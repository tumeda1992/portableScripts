require "csv"
require "json"
require "net/http"
require "net/https"
require "uri"
require "optparse"
require "cgi"

URL_PARAM_NAMES = {
  use_es: "use_es",
  audiostock_w: "audiostock_w",
  cmusic_w: "cmusic_w",
  sale_count_w: "sale_count_w",
  sale_started_at_w: "sale_started_at_w",
  rows: "rows",
}

# 実行例: ruby print_search_result_tsv_by_specified_parameter.rb --use_es true --sale_count_w 5 --rows 2
def main(url_params)
  url = create_url(url_params)
  result = fetch(url)
  print_tsv(result)
end

def create_url(search_word, url_params)
  uri = URI.parse("https://example.com/hoge.json")

  url_params.delete_if{ |_, v| v.nil? || v.strip == ""}
  uri.query = URI.encode_www_form(url_params)

  uri
end

def fetch(url)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new url.request_uri

  response = http.request(request)
  response_body = CGI.unescape(response.body)
  JSON.load(response_body)
end

def print_tsv(result)
  items = result["items"]
  tsv = CSV.generate(col_sep: "\t") do |tsv|
    tsv << %w(id 内容)
    items.each do |item|
      values = [
        item["id"],
        item["content"],
      ]
      tsv << values
    end
  end

  print tsv
end

long_options = URL_PARAM_NAMES.map { |k, _| "#{k}:" }
option_arg_hash = ARGV.getopts("", *long_options)

main(option_arg_hash)