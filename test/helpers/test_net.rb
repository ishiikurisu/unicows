require "minitest/autorun"
require "./app/helpers/application_helper"

class TestNet < MiniTest::Test
    
    # Runs before each test
    def setup
        @testurl = "https://www.instagram.com/_boxofjoe_/"
    end

    def test_loads_something_from_internet
        contents = ApplicationHelper.load @testurl
        assert contents
        assert contents.include? '<script type="text/javascript">'
    end
end