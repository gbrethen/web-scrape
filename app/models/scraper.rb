require 'Nokogiri'
require 'HTTParty'
require 'JSON'

class Scraper < ApplicationRecord
    	    
    def self.scrape(page)
		parse_page = Nokogiri::HTML(page)
        pets_array = []
        parse_page.css('.content').css('.rows').css('.result-row').css('.hdrlnk').map do |a|
            post_name = a.text
            pets_array.push(post_name)
        end
        return pets_array
	end
    
end