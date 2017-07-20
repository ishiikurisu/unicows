require "minitest/autorun"
require_relative "../../app/helpers/application_helper"
require_relative "../../app/models/Image"

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
        @image_on_sale = {
            "type" => 'image',
            'id' => 123,
            'user' => { 'username' => 'whatever' },
            'images' => {
                'standard_resolution' => nil,
                'low_resolution' => nil
            },
            'caption' => { 'text' => '[SOMETHING] Is cute' }
        }
        @image_not_on_sale = {
            "type" => 'image',
            'id' => 123,
            'user' => { 'username' => 'whatever' },
            'images' => {
                'standard_resolution' => nil,
                'low_resolution' => nil
            },
            'caption' => { 'text' => 'Something is cute anyways' }
        }
        @image_sold = {
            "type" => 'image',
            'id' => 123,
            'user' => { 'username' => 'whatever' },
            'images' => {
                'standard_resolution' => nil,
                'low_resolution' => nil
            },
            'caption' => { 'text' => '[VENDIDO][SOME OTHER THING]Something was cute' }
        }
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

    def test_if_image_is_on_sale
        image = Image.new @image_on_sale
        assert image.is_on_sale?
        image = Image.new @image_not_on_sale
        assert !image.is_on_sale?
        image = Image.new @image_sold
        assert !image.is_on_sale?
    end

    def test_get_title
        image = Image.new @image_on_sale
        assert_equal 'SOMETHING', image.title
        image = Image.new @image_not_on_sale
        assert image.title.nil?
        image = Image.new @image_sold
        assert_equal 'SOME OTHER THING', image.title
    end
end
