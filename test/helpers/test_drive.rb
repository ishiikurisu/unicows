require "minitest/autorun"
require_relative "../../app/helpers/drive_helper"

class TestDrive < MiniTest::Test
    # Runs before each test
    def setup
        @worksheet = Drive.download_worksheet 'Produtos'
    end

    def test_can_download_first_worksheet
        assert @worksheet
    end
end
