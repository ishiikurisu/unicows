class MainController < ApplicationController
    def index
        unless defined? $album
            $album = Album.new
        end
        @products = $album.images.take 6
    end

    def about
        unless defined? $album
            $album = Album.new
        end
        @images = $album.images.take 3
    end
end
