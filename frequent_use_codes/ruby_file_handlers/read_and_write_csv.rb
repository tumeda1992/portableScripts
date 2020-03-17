require "csv"

$is_debug = true

def main(csv)
  # output_file_writer = CSV.open(output_file, "w")
  # output_cols = ["hoge"]
  # output_file_writer.puts(output_cols)

  csv_foreach(csv) do |row|
    # 処理
    p row

    # output_file_writer.puts(output_cols.map {|col| result[col]})
  end

  # output_file_writer.close
end

def csv_foreach(csv)
  log "#{Time.now}: read start #{csv}"
  all_line_count = line_count(csv)

  return_values = CSV.foreach(csv, headers: true).with_index(1).map do |row, row_no|
    log progress(line_no, all_line_count) if progress_timing?(all_line_count, row_no)
    yield(row)
  end

  log "#{Time.now}: read end #{csv}"

  return_values
end

def log(message)
  puts(message) if $is_debug
end

def progress_timing?(all_line_count, line_no)
  return false if all_line_count < 100
  div_number = 100

  percent_unit = all_line_count / div_number
  line_no % percent_unit == 0
end

def progress(current_count, all_count)
  finished_rate = current_count.fdiv(all_count)
  finished_rate_percent = (finished_rate * 100).round(2)
  "#{Time.now}: #{finished_rate_percent}% (#{current_count}/#{all_count})"
end

def line_count(file)
  open(file){|f|
    while f.gets; end
    f.lineno
  }
end

main(ARGV[0])