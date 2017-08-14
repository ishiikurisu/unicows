class MainController < ApplicationController
    def index
        @products = ProductsController.download_catalogue
    end

    def about
        @images = $album.get_page_images(0).take(5).map { |i| i.image['url'] }
        p @images
    end
end
