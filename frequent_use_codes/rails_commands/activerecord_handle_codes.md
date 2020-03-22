# joinしてjoin先のテーブルの条件で絞り込む
StockPrice.joins(:stock).where(stocks: {code: 1301})

# 特定のカラムだけ取ってくる場合（これselectでもいいのか）
StockPrice.pluck(:id)
