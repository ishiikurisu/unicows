class Image
    attr_reader :id
    attr_reader :user
    attr_reader :image
    attr_reader :thumbnail
    attr_reader :caption

    def initialize stuff
        if stuff['type'] == 'image'
            @id = stuff['id']
            @user = stuff['user']['username']
            @image = stuff['images']['standard_resolution']
            @thumbnail = stuff['images']['low_resolution']
            @caption = (!stuff['caption'].nil?)? stuff['caption']['text'] : ''
        else
            raise ArgumentError
        end
    end
end
