require 'google_drive'
require 'pathname'

module DriveHelper
    def DriveHelper.download_worksheet title
        gd_json = Pathname.new './config/gd.json'
        unless gd_json.exist?
            p `curl -o ./config/gd.json #{ENV['GD_JSON']}`
        end

        session = GoogleDrive::Session.from_service_account_key('./config/gd.json')
        spreadsheet = session.spreadsheet_by_title title
        worksheet = spreadsheet.worksheets.first
        worksheet
    end
end
