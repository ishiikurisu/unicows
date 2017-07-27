require_relative '../helpers/application_helper.rb'
require_relative '../models/Image.rb'

class ProductsController < ApplicationController
    attr_reader :raw
    attr_reader :products

    # Lists all available products
    def list
        # TODO Make this line work before the constructor
        @products = ProductsController.get_first_products
        # IDEA Implement pagination logic for dealing with access better
    end

    # Displays a specific product
    def show
        # TODO Display product only if their id is valid
        puts "REQUEST: #{request}"
        @request = request
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
