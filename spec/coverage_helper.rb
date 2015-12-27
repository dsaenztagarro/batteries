require 'simplecov'
require 'simplecov-console'
require 'coveralls'

SimpleCov.command_name 'RSpec'
SimpleCov.coverage_dir 'coverage/spec/'

formatters = [SimpleCov::Formatter::HTMLFormatter,
              SimpleCov::Formatter::Console]

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatters)
# SimpleCov.minimum_coverage(100)
SimpleCov.start 'rails'
