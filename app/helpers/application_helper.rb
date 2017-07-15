require "open-uri"

module ApplicationHelper
    public
    def ApplicationHelper.load url
        open(url) { |f| f.read }
    end
end
