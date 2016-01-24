# Add your own tasks in files placed in lib/tasks ending in .rake, for example
# lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

begin
  require 'coveralls/rake/task'
  Coveralls::RakeTask.new
  task test_with_coveralls: ['spec', 'cucumber:ok', 'coveralls:push']

  task default: :test_with_coveralls
rescue LoadError
  puts '>>>>> Coveralls gem not loaded, omitting tasks'
end
