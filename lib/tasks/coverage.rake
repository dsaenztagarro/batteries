namespace :coverage do
  desc 'Launchs a browser with Cucumber coverage report index page'
  task :cucumber do
    `open coverage/features/index.html`
  end

  desc 'Launchs a browser with Rspec coverage report index page'
  task :rspec do
    `open coverage/spec/index.html`
  end
end
