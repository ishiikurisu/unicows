class MainController < ApplicationController
    def index
        @products = ProductsController.get_first_products[0...6]
    end

    def about
    end
end
