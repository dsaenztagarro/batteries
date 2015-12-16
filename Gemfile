source 'https://rubygems.org'

gem 'rails', '4.2.5'

gem 'devise'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'pg', '~> 0.18.4'
gem 'paperclip', '~> 4.3'
gem 'responders', '~> 2.0'
gem 'searchkick'
gem 'sqlite3'
gem 'turbolinks'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'simplecrud', github: 'dsaenztagarro/simplecrud', branch: 'master'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
group :development do
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rvm', '0.1.1'
  gem 'capistrano-rails', '1.1.5'
  gem 'capistrano-passenger', '0.2.0'
end

group :test do
  gem 'capybara'
  gem 'coveralls', '~> 0.8.10'
  gem 'cucumber-rails', '1.4.2', require: false
  gem 'database_cleaner'
  gem 'factory_girl_rails', '4.5.0'
  gem 'rspec-rails', '3.4.0'
  gem 'shoulda-matchers', '~> 3.0'
  gem 'simplecov', '~> 0.11.0'
  gem 'simplecov-console', '~> 0.2.0'
end

group :development, :test do
  gem 'byebug'
  gem 'cane'
  gem 'pry-byebug'
  gem 'reek'
  gem 'rubocop'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end
