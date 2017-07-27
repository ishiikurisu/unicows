# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "Runs unit tests"
task :tdd do
    puts `rails test ./test/helpers/test_net.rb`
    puts `rails test ./test/models/test_image.rb`
    puts `rails test ./test/models/test_album.rb`
end
