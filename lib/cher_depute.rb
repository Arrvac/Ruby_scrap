require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_email(x)
	lien = x.css('td[1]/a/@href').text
	page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr#{lien}"))
	email = page.css('.deputes-liste-attributs > dd:nth-child(8) > ul:nth-child(1) > li:nth-child(2) > a:nth-child(1)').text
end

def get_first(x)
	name = x.css('td[1]/a').text.delete_prefix("Mme ").delete_prefix("M. ").split.first
end

def get_last(x)
	name = x.css('td[1]/a').text.delete_prefix("Mme ").delete_prefix("M. ").split.last
end

def depute
	pages = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/tableau'))
  	tmp = pages.css('//table/tbody/tr')
	deputename = tmp[0..10].map { |x| { "first_name" => get_first(x), "last_name" => get_last(x), "email" => get_email(x) } }
end

pp depute
