$is_debug = true

def main(file)
  # output_file_writer = File.open(output_file, "w")

  FileHandler.file_foreach(file) do |line|
    # 処理
    p line

    # output_file_writer.puts(line)
  end

  # puts "#{output_file}を作成しました"
  # output_file_writer.close
end

module FileHandler
  class << self
    def file_foreach(file)
      File.open(file) do |lines|
        log "#{Time.now}: read start #{file}"
        all_line_count = line_count(file)

        return_values = lines.each_line.each.with_index(1).map do |line, line_no|
          log progress(line_no, all_line_count) if progress_timing?(all_line_count, line_no)
          yield(line.chomp)
        end

        log "#{Time.now}: read end #{file}"

        return_values
      end
    end

    def line_count(file)
      open(file){|f|
        while f.gets; end
        f.lineno
      }
    end

    private

    def log(message)
      puts(message) if $is_debug
    end

    def progress_timing?(all_line_count, line_no)
      return false if all_line_count < 100

      # NOTE 処理時間によって変更
      div_number = 100

      percent_unit = all_line_count / div_number
      line_no % percent_unit == 0
    end

    def progress(current_count, all_count)
      "#{Time.now}: #{CommonUtilities.percent(current_count, all_count)}% (#{CommonUtilities.number_with_commma(current_count)} / #{CommonUtilities.number_with_commma(all_count)})"
    end
  end
end

module CommonUtilities
  class << self
    def percent(num, all_count)
      (num.fdiv(all_count) * 100).round(2)
    end

    def number_with_commma(number)
      number.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,')
    end
  end
end

main(ARGV[0])
