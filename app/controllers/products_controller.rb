require_relative '../helpers/application_helper.rb'
require_relative '../models/Album.rb'

class ProductsController < ApplicationController
    attr_reader :album

    # Lists all available products
    def list
        unless defined? $album
            $album = Album.new
        end
        @limit = $album.pages.length - 1
        @page = (request['page'].nil?)? 0 : request['page'].to_i - 1
        if (0 <= @page) && (@page <= @limit)
            @products = $album.pages[@page]
        else
            redirect_to '/products/not_found'
        end
    end

    # Displays a specific product
    def show
        unless defined? $album
            $album = Album.new
        end
        id = request['id'].to_i
        @product = $album.get_image id
        if @product.nil?
            redirect_to '/products/not_found'
        end
    end

    # Page to display when something didn't happen quite right.
    def not_found
    end
end
