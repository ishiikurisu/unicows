class MainController < ApplicationController
    def index
        @products = ProductsController.download_catalogue
    end

    def about
    end
end
