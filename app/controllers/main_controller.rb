class MainController < ApplicationController
    def index
        @products = ProductsController.get_first_products
    end

    def about
    end
end
