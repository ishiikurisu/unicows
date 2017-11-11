require_relative '../helpers/drive_helper.rb'
require_relative '../models/Image.rb'

class Album
    attr_reader :images

    def initialize
        @images = [ ]
        @worksheet = DriveHelper.download_worksheet('Produtos').rows
        @tags = @worksheet[0]
        @worksheet[1..-1].each_index do |line|
            row = @worksheet[line]
            info = { 'id' => line }
            @tags.each_index do |index|
                tag = @tags[index]
                info[tag] = row[index]
            end
            image = Image.new info
            @images << image
        end
    end
end
