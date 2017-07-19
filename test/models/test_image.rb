require "minitest/autorun"
require "./app/helpers/application_helper"
require "./app/models/Image"

class TestImage < MiniTest::Test

    # Runs before each test
    def setup
        @users = [
            'crisjoejr',
            '_boxofjoe_'
        ]
        @all_raw_stuff = @users.map do |user|
            ApplicationHelper.parse_json(ApplicationHelper.load("https://instagram.com/#{user}/media"))
        end
    end

    def test_can_create_many_images
        @all_raw_stuff.each do |raw_stuff|
            raw_stuff['items'].each do |stuff|
                image = Image.new stuff
                assert image
            end
        end
    end

    def test_can_fail_with_invalid_map
        assert_raises(ArgumentError) do
            image = Image.new { }
        end
    end
end
