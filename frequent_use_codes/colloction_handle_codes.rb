# each_with_objectオススメ。reduce, inject特有の最後に集約オブジェクト返さなくていい
# https://qiita.com/Kta-M/items/c9781e09d96601687767
# > injectの場合はresultにはブロック内で最後に評価した値が入る
# > each_with_objectの場合は、resultは常にeach_with_objectの引数として渡されたオブジェクトを指す
ret = [["Alice", 50], ["Bob", 40], ["Charlie", 70]].each_with_object({}) do |(key, value), hash|
  hash[key] = value
end
