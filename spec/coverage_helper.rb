require 'simplecov'
require 'simplecov-console'
require 'coveralls'

formatters = [Coveralls::SimpleCov::Formatter,
              SimpleCov::Formatter::HTMLFormatter,
              SimpleCov::Formatter::Console]

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatters)
SimpleCov.command_name 'RSpec'
# SimpleCov.minimum_coverage(100)
SimpleCov.start 'rails'
