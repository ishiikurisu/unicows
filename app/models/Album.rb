require_relative '../helpers/application_helper.rb'
require_relative '../models/Image.rb'

class Album
    attr_reader :raw
    attr_reader :products
    attr_reader :pages

    def initialize user
        @products = [ ]
        @pages = [ ]
        @images = { }

        raw = ApplicationHelper.parse_json(ApplicationHelper.load("https://instagram.com/#{user}/media"))
        page = [ ]
        @raw['items'].each do |item|
            image = Image.new item
            page << image.id
            @images[image.id] = image
        end
        
        @pages << page
        # TODO Download remaining products
    end

    # TODO Implement access of individual pages
    # TODO Implemenet access to individual pictures
end
