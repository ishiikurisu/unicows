require "open-uri"

module ApplicationHelper
    # Loads the HTML content from a valid URL.
    public
    def ApplicationHelper.load url
        open(url) { |f| f.read }
    end

    # Extracts the HTML inside the given tag with parameters from a HTML string.
    public
    def ApplicationHelper.get_innerHTML html, tag
        outlet = [ ]
        offset = 0
        opening_tag = "<#{tag}>"
        closing_tag = "</#{tag.split[0]}>"

        loop do
            from = html.index(tag, offset)
            unless from.nil?
                to = html.index(closing_tag, from)
                from += tag.length+1
                outlet << html[from...to]
                offset = to
            else
                break
            end
        end

        outlet
    end
end
