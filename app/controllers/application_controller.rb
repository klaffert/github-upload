class ApplicationController < ActionController::Base

    class Post
        attr_reader :title
        attr_reader :link

        def initialize (title,link)
            @title = title
            @link = link
        end
    end

    def scrape_craigslist
        require 'open-uri'
        doc = Nokogiri::HTML(open("https://seattle.craigslist.org/d/free-stuff/search/zip"))
        
        posts = doc.css('.result-title')
        @postsArray = []
        posts.each do |post|
            title = post.text
            link = post.values[0]
            @postsArray << Post.new(title,link)
        end

    render template: 'scrape_craigslist'
end
end
