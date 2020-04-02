# 特定のカラムだけ取ってくる場合（これselectでもいいのか）
`StockPrice.pluck(:id)`

# joinしてjoin先のテーブルの条件で絞り込む
`StockPrice.joins(:stock).where(stocks: {code: 1301})`

## [様々なjoin方法](https://qiita.com/k0kubun/items/80c5a5494f53bb88dc58)
- JOINして条件を絞り込みたいが、JOINするテーブルのデータを使わない場合 -> 単純なjoin
    - 内部結合 -> `joins`
    - 外部結合 -> `left_joins`
- 複数のテーブルに触って、複数のテーブルのデータを使う場合
    - JOINする場合 -> `eager_load`
    - JOINせずにテーブル分だけSQLを発行 -> `preload`
    - 上記をよしなに判断する -> `includes`