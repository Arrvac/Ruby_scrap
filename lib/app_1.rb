require 'rubygems'
require 'nokogiri'
require 'open-uri'

def first_page
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  tab = page.xpath('/html/body/div/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr').map do |name|
    { name.xpath('td[3]').text => name.xpath('td[5]').text }
  end
  pp tab
end

first_page
