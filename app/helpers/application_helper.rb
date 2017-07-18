require "open-uri"
require "json"

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

    # Parses JSON data into something meaningful
    public
    def ApplicationHelper.find_json inlet
        JSON.parse inlet.split('=')[1..-1].join('=')[0...-1]
    end

    # Gets all image nodes from a Instagram user
    public
    def ApplicationHelper.get_instanodes user
        # TODO Load all nodes from instagram
        html = ApplicationHelper.load "https://www.instagram.com/#{user}/"
        innies = ApplicationHelper.get_innerHTML html, 'script type="text/javascript"'
        data = ApplicationHelper.find_json innies[1]
        return data['entry_data']['ProfilePage'][0]['user']['media']['nodes']
    end
end
