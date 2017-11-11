require_relative '../helpers/application_helper.rb'
require_relative '../models/Album.rb'

class ProductsController < ApplicationController
    attr_reader :album

    # Lists all available products
    def list
        unless defined? $album
            $album = Album.new "unicowsstore", :auto => true
        end
        @limit = $album.how_many_pages - 1
        @page = (request['page'].nil?)? 0 : request['page'].to_i - 1
        if (0 <= @page) && (@page <= @limit)
            @products = $album.get_page_images @page
        else
            redirect_to '/products/not_found'
        end
    end

    # Displays a specific product
    def show
        id = request['id']
        @product = $album.get_image id
        if @product.nil?
            redirect_to '/products/not_found'
        end

        @price_code = nil
        if @product.is_on_sale?
            case @product.price
            when 15
                @price_code = '8FBD629E1717F39AA4D30FA501C58C98'
            when 20
                @price_code = '411EBE215050855114CC4F9102F2752C'
            when 40
                @price_code = '003E24DE808080E554CC9F810CD6692D'
            else
                redirect_to '/products/not_found'
            end
        end
    end

    # Page to display when something didn't happen quite right.
    def not_found
    end
end
