require_relative '../helpers/application_helper.rb'
require_relative '../helpers/drive_helper.rb'
require_relative '../models/Image.rb'

class Album
    attr_reader :images
    attr_reader :pages

    def initialize
        @images = [ ]
        @worksheet = DriveHelper.download_worksheet('Produtos').rows
        @tags = @worksheet[0]
        @worksheet[1..-1].each_index do |line|
            row = @worksheet[line+1]
            info = { 'id' => line+1 }
            @tags.each_index do |index|
                tag = @tags[index]
                info[tag] = row[index]
            end
            puts "---"
            puts info
            image = Image.new info
            @images << image
        end
        puts "...1"

        @pages = ApplicationHelper.each_slice @images.select { |e| e.is_on_sale? }, 6
    end

    def get_image id
        @images[@images.index { |x| x.id == id }]
    end
end
