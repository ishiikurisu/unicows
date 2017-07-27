require "minitest/autorun"
require "set"
require_relative "../../app/helpers/application_helper"
require_relative "../../app/models/Image"
require_relative "../../app/models/Album"

class TestAlbum < MiniTest::Test
    # Runs before each test
    def setup
        @users = [
            'crisjoejr',
            '_boxofjoe_'
        ]
    end

    def test_can_download_first_page
        @users.each do |user|
            album = Album.new user
            assert album.pages.length >= 1
            assert((album.pages[0].length >= 0) && (album.pages[0].length <= 20))
        end
    end

    def test_can_download_remaining_pages
        album = Album.new @users[0]
        assert_equal 1, album.pages.length
        album.download_more_pages
        assert album.pages.length > 1
        page0 = Set.new album.pages[0]
        page1 = Set.new album.pages[1]
        refute(page0.intersect? page1)
    end
end
