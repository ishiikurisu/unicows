require "open-uri"
require "json"

module ApplicationHelper
    # Loads the HTML content from a valid URL.
    public
    def ApplicationHelper.load url
        open(url) { |f| f.read }
    end

    public
    def ApplicationHelper.parse_json inlet
        JSON.parse inlet
    end

    public
    def ApplicationHelper.each_slice a, length
        inlet = Array.new a
        outlet = []
        while inlet.length > 0
            outlet << inlet.pop(length)
        end
        return outlet
    end
end
