require "minitest/autorun"
require "./app/helpers/application_helper"

class TestNet < MiniTest::Test

    # Runs before each test
    def setup
        # @testurl = "https://www.instagram.com/crisjoejr/"
        @testurl = "https://www.instagram.com/_boxofjoe_/"
    end

    def test_loads_something_from_internet
        contents = ApplicationHelper.load @testurl
        assert contents
        assert contents.include? '<script type="text/javascript">'
    end

    def test_can_parse_stuff_from_html
        html = ApplicationHelper.load @testurl
        innies = ApplicationHelper.get_innerHTML html, 'script type="text/javascript"'
        assert_equal 4, innies.length
    end

    def test_can_parse_stuff_from_json
        html = ApplicationHelper.load @testurl
        innies = ApplicationHelper.get_innerHTML html, 'script type="text/javascript"'
        assert ApplicationHelper.find_json innies[1]
        # TODO Make sense of that JSON struct so we can test it.
    end
end
