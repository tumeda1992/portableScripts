$is_debug = true

def main(file)
  # output_file_writer = File.open(output_file)

  file_foreach(file) do |line|
    p line

    # output_file.put(line)
  end

  # output_file_writer.close
end

def file_foreach(file)
  File.open(file) do |lines|
    log "#{Time.now}: read start #{file}"
    all_line_count = lines.size

    return_values = lines.each_line.each.with_index(1).map do |line, line_no|
      log progress(line_no, all_line_count) if progress_timing?(all_line_count, line_no)
      yield(line.chomp)
    end

    log "#{Time.now}: read end #{file}"

    return_values
  end
end

def log(message)
  puts(message) if $is_debug
end

def progress_timing?(all_line_count, line_no)
  div_number = 100

  if all_line_count < 100
    return false
  elsif all_line_count > 100_000
    div_number = 1000
  end

  percent_unit = all_line_count / div_number
  line_no % percent_unit == 0
end

def progress(current_count, all_count)
  finished_rate = current_count.fdiv(all_count)
  finished_rate_percent = (finished_rate * 100).round(2)
  "#{Time.now}: #{finished_rate_percent}% (#{current_count}/#{all_count})"
end

main(ARGV[0])
