def main(file)
  output_file = File.open("")

  file_foreach(file) do |line|
    p line

    # output_file.put(line)
  end

  output_file.close
end

def file_foreach(file)
  File.open(file) do |lines|
    return_values = lines.each_line.map do |line|
      yield(line.chomp)
    end
    return_values
  end
end

main(ARGV[0])