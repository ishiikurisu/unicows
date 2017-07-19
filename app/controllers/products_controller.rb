require './app/helpers/application_helper.rb'
require './app/models/image.rb'

class ProductsController < ApplicationController
    attr_reader :raw
    attr_reader :products

    # Lists all available products
    def list
        # TODO Make this line work before the constructor
        @products = ProductsController.get_first_products
    end

    # Displays a specific product
    def show
        puts "REQUEST: #{request}"
    end

    # Downloads the first products on the shop.
    def ProductsController.get_first_products
        @raw = ApplicationHelper.parse_json(ApplicationHelper.load("https://instagram.com/unicowsstore/media"))
        @products = [ ]
        @raw['items'].each do |item|
            image = Image.new item
            @products << image
        end
        # TODO Download remaining products
        return @products
    end
end
