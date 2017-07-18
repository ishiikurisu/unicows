require "minitest/autorun"
require "./app/helpers/application_helper"

class TestNet < MiniTest::Test

    # Runs before each test
    def setup
        # @testurl = "https://www.instagram.com/_boxofjoe_/"
        @testurl = "https://www.instagram.com/crisjoejr/"
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
        data = ApplicationHelper.find_json innies[1]
        assert data['entry_data']['ProfilePage'].length > 0
        assert data['entry_data']['ProfilePage'][0]['user'].has_key? 'media'
        assert data['entry_data']['ProfilePage'][0]['user']['media']['nodes'].length <= 12
    end
end
