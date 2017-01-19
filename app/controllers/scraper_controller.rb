require 'HTTParty'

class ScraperController < ApplicationController
    before_action :require_login
    
    # GET /scraper
    def index
    end
    
    def scrape
        @url = params[:url]
        puts "@url: #{@url}"
        page = HTTParty.get(@url, :verify => false)
        #puts "Page: #{page}"
        @scraper = Scraper.scrape(page)
        puts "Scraper: #{@scraper}"
        render 'index'
    end
    
    def clear
       @scraper = []
       render 'index'
    end
end