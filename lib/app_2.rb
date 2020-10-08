require 'rubygems'
require 'nokogiri'
require 'open-uri'

def second_page(link)
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/#{link['href']}"))
  page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

def first_page
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  tab = page.css('.lientxt').map { |name| { name.text => second_page(name) } }
  pp tab
end

first_page
