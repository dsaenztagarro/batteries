require 'simplecov'
require 'simplecov-console'
require 'coveralls'

SimpleCov.command_name 'Cucumber'
SimpleCov.coverage_dir 'coverage/features/'

formatters = [Coveralls::SimpleCov::Formatter,
              SimpleCov::Formatter::HTMLFormatter,
              SimpleCov::Formatter::Console]

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatters)
# SimpleCov.minimum_coverage(100)
SimpleCov.start 'rails'
