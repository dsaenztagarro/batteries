namespace :coverage do
  desc 'Launchs a browser with the coverage report index page'
  task :show do
    `open coverage/index.html`
  end
end
