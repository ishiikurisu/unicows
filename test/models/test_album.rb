require "minitest/autorun"
require "set"
require_relative "../../app/models/Album"

class TestAlbum < MiniTest::Test
    # Runs before each test
    def setup
        @album = Album.new
    end

    def test_can_organize_images_in_album_by_name
        pictures = ['neko atsume', 'overwatch', 'fifa 18']
        @album.images.each do |product|
            pictures.delete product.name
        end
        assert_equal 0, pictures.length
    end

    def test_can_organize_images_in_album_by_price
        pictures = [15, 20, 40]
        @album.images.each do |product|
            pictures.delete product.price
        end
        assert_equal 0, pictures.length
    end

    # TODO Test if products are on sale
end
