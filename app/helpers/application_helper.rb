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
end
