class MainController < ApplicationController
    def index
        unless defined? $album
            $album = Album.new
        end
        @products = $album.images.reverse.take 6
    end

    def about
        @images = [
            'https://instagram.fbsb4-1.fna.fbcdn.net/t51.2885-15/e35/19984565_487796128235495_3360415122861326336_n.jpg',
            'https://instagram.fbsb4-1.fna.fbcdn.net/t51.2885-15/s640x640/sh0.08/e35/19764860_683714328490093_3798162845414195200_n.jpg',
            'https://instagram.fbsb4-1.fna.fbcdn.net/t51.2885-15/s640x640/sh0.08/e35/19761175_851600388321431_7635192864229556224_n.jpg'
        ]
    end
end
