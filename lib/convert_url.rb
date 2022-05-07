require 'cgi'
require 'csv'

url_array = [
  'https://www.amazon.co.jp/%E3%82%B0%E3%83%AC%E3%83%B4%E3%82%A3%E3%82%AA-%E3%83%AA%E3%83%A5%E3%83%83%E3%82%AF-%E3%83%93%E3%82%B8%E3%83%8D%E3%82%B9%E3%83%AA%E3%83%A5%E3%83%83%E3%82%AF-AIN_HYT_SWN_businessryukku_00-%E3%83%96%E3%83%A9%E3%83%83%E3%82%AF/dp/B085HLVJYP',
  'https://www.amazon.co.jp/%E3%83%93%E3%82%A2%E3%83%B3%E3%82%AD-%E3%83%95%E3%83%A9%E3%83%83%E3%83%97%E3%83%90%E3%83%83%E3%82%AF%E3%83%91%E3%83%83%E3%82%AF-%E3%83%AA%E3%83%A5%E3%83%83%E3%82%AF-NBTC-37-%E6%92%A5%E6%B0%B4/dp/B00UY43FVS',
  'https://www.amazon.co.jp/MARK-RYDEN-%E3%83%90%E3%83%83%E3%82%AF%E3%83%91%E3%83%83%E3%82%AF%E9%98%B2%E6%B0%B4-%E3%83%93%E3%82%B8%E3%83%8D%E3%82%B9%E3%83%AA%E3%83%A5%E3%83%83%E3%82%AF-%E7%9B%97%E9%9B%A3%E9%98%B2%E6%AD%A2%E3%83%A9%E3%83%83%E3%83%97%E3%83%88%E3%83%83%E3%83%97%E3%83%90%E3%83%83%E3%82%B017%E3%82%A4%E3%83%B3%E3%83%81%E3%83%91%E3%82%BD%E3%82%B3%E3%83%B3%E5%AF%BE%E5%BF%9C/dp/B082VTKYY9',
  'https://www.amazon.co.jp/%E3%83%93%E3%82%B8%E3%83%8D%E3%82%B9%E3%83%AA%E3%83%A5%E3%83%83%E3%82%AF-%E3%83%90%E3%83%83%E3%82%AF%E3%83%91%E3%83%83%E3%82%AF-USB%E5%85%85%E9%9B%BB%E3%83%9D%E3%83%BC%E3%83%8815-6%E3%82%A4%E3%83%B3%E3%83%81PC-%E3%83%AA%E3%83%A5%E3%83%83%E3%82%AF%E3%82%B5%E3%83%83%E3%82%AF-%E3%83%A1%E3%83%B3%E3%82%BA%E3%83%AA%E3%83%A5%E3%83%83%E3%82%AF/dp/B08FY6NGWN',
  'https://www.amazon.co.jp/SUNOGE-%E3%83%90%E3%83%83%E3%82%AF%E3%83%91%E3%83%83%E3%82%AF-%E3%83%AA%E3%83%A5%E3%83%83%E3%82%AF%E3%82%B5%E3%83%83%E3%82%AF-%E3%83%93%E3%82%B8%E3%83%8D%E3%82%B9%E3%83%AA%E3%83%A5%E3%83%83%E3%82%AF-%E3%83%A9%E3%83%83%E3%83%97%E3%83%88%E3%83%83%E3%83%97%E3%83%90%E3%83%83%E3%82%B0/dp/B08XHS9FQP'
]

decoded_url = url_array.map do |url|
  item_data = url[25..-1].gsub!('/', ',')
  data = item_data.split(',')
  item = CGI.unescape((data[0]).to_s)
  data[0] = item
  data.delete_at(1)
  data
end

amazon_csv = CSV.generate do |csv|
  decoded_url.each do |du|
    csv << %w[商品ID 商品名]
    csv << [du.first, du.last]
  end
end

p amazon_csv
