require "minitest/autorun"
require "./app/helpers/application_helper"

class TestNet < MiniTest::Test

    # Runs before each test
    def setup
        @users = [
            'crisjoejr',
            '_boxofjoe_'
        ]
    end

    def test_loads_something_from_internet
        @users.each do |user|
            contents = ApplicationHelper.load "https://instagram.com/#{user}"
            assert contents
            assert contents.include? '<script type="text/javascript">'
        end
    end

    def test_can_load_more_than_one_page
        @users.each do |user|
            raw = ApplicationHelper.load "https://instagram.com/#{user}/media"
            obj = ApplicationHelper.parse_json raw
            assert obj['items'].length > 0
            if obj['more_available']
                max_id = obj['items'][-1]['id']
                raw = ApplicationHelper.load "https://instagram.com/#{user}/media/?max_id=#{max_id}"
                obj = ApplicationHelper.parse_json raw
                assert max_id != obj['items'][0]['id']
                assert obj['items'].length > 0
            end
        end
    end
end
