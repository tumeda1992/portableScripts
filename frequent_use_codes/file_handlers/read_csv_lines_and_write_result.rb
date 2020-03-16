require "csv"

def main(csv)
  values = CSV.foreach(csv, headers: true).with_index(0).map do |row, i|
    # break ["1", "0", "1"] if i > 10 # デバッグ
    row
  end
  values.each do |value|
    # 処理
  end
end

main(ARGV[0])