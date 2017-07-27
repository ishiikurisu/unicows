require "minitest/autorun"
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
            assert (album.pages[0].length >= 0) && (album.pages[0].length <= 12)
        end
    end
end
