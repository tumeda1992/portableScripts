require "csv"

def main(csv)
  csv_foreach(csv) do |row|
    p row


  end

end

def csv_foreach(csv)
  CSV.foreach(csv, headers: true).with_index(1).map do |row, row_no|
    row
  end
end

main(ARGV[0])