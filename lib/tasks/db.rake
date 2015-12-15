namespace :db do
  desc 'Regenerates development db'
  task dev: [:drop, :create, :migrate, :seed]

  desc 'Generates data for development db'
  task :dev_data do
  end
end
