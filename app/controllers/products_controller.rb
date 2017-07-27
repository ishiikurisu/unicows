require_relative '../helpers/application_helper.rb'
require_relative '../models/Album.rb'

class ProductsController < ApplicationController
    attr_reader :album

    # Lists all available products
    def list
        unless defined? $album
            $album = Album.new "unicowsstore", :auto => true
        end
        # TODO Implement pagination logic
        @products = $album.get_page_images (request['page'].nil?)? 0 : request['page'].to_i
    end

    # Displays a specific product
    def show
        id = request['id']
        @product = $album.get_image id
    end

    # Downloads the whole catalogue. Returns the first page of products.
    def ProductsController.download_catalogue
        $album = Album.new "unicowsstore", :auto => true
        # TODO Download remaining products
        $album.get_page_images 0
    end
end
