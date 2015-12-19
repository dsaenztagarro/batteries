namespace :db do
  desc 'Regenerates development db'
  task dev: [:drop, :create, :migrate, :seed, :dev_data]

  desc 'Generates data for development db'
  task :dev_data do
  end
end
