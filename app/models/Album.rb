require_relative '../helpers/application_helper.rb'
require_relative '../models/Image.rb'

class Album
    attr_reader :raw
    attr_reader :pages
    attr_reader :user
    attr_reader :images

    def initialize user, options = { }
        @products = [ ]
        @pages = [ ]
        @images = { }
        @user = user

        @raw = query_instagram
        page = create_page @raw['items']
        @pages << page

        if options.key? :auto
            download_more_pages_automatically
        end
    end

    def download_more_pages
        if @raw['more_available']
            last_id = @pages[-1][-1]
            @raw = query_instagram last_id
            page = create_page @raw['items']
            @pages << page
        end
    end

    def create_page items
        page = [ ]
        items.each do |item|
            begin
                image = Image.new item
                page << image.id
                @images[image.id] = image
            rescue ArgumentError

            end
        end
        page
    end

    def query_instagram last_id=nil
        url = "https://instagram.com/#{@user}/media" + ((last_id.nil?)? "" : "?max_id=#{last_id}")
        ApplicationHelper.parse_json(ApplicationHelper.load(url))
    end

    def download_more_pages_automatically
        Thread.new do
            while @raw['more_available']
                last_id = @pages[-1][-1]
                @raw = query_instagram last_id
                page = create_page @raw['items']
                @pages << page
            end
        end
    end

    def get_page page
        @pages[page]
    end

    def get_page_images page
        @pages[page].map { |p| @images[p] }
    end

    def get_image id
        @images[id]
    end

    def how_many_pages
        @pages.length
    end
end
