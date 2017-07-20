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

    def is_on_sale?
        (self.is_product?)? !@caption.start_with?('[VENDIDO]') : false
    end

    def is_product?
        @caption[0] == '['
    end

    def title
        if self.is_product?
            sold = '[VENDIDO]'
            caption = (@caption.start_with? sold)? @caption[sold.length..-1] : @caption
            caption[1...caption.index(']')]
        else
            nil
        end
    end

    # TODO Implement method to get description
end
