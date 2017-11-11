class Image
    attr_reader :id
    attr_reader :price
    attr_reader :image
    attr_reader :caption
    attr_reader :name
    attr_reader :code

    def initialize stuff
        @name = stuff['name']
        @caption = stuff['description']
        @stock = stuff['stock'].to_i
        @image = stuff['image']
        @price = stuff['price'].to_i
        @code = stuff['pagseguro']
        @id = stuff['id']
    end

    def is_on_sale?
        @stock > 0
    end
end
