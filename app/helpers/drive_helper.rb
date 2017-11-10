require 'google_drive'

module Drive
    def Drive.download_worksheet title
        session = GoogleDrive::Session.from_service_account_key('./config/gd.json')
        spreadsheet = session.spreadsheet_by_title title
        worksheet = spreadsheet.worksheets.first
        worksheet
    end
end
