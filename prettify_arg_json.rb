# $ ruby prettify_arg_json.rb '{"a": "hoge", "b": [1, 2]}'                                                                                                                                          +[master]
# {
#   "a": "hoge",
#   "b": [
#     1,
#     2
#   ]
# }

require "json"

json = ARGV[0]
hash_for_json = JSON.parse(json)
pretty_json = JSON.pretty_generate(hash_for_json)
puts pretty_json