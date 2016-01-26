[![Build Status](https://travis-ci.org/dsaenztagarro/myfamilyweb.svg?branch=master)](https://travis-ci.org/dsaenztagarro/myfamilyweb)
[![Code Climate](https://codeclimate.com/github/dsaenztagarro/myfamilyweb/badges/gpa.svg)](https://codeclimate.com/github/dsaenztagarro/myfamilyweb)
[![Coverage Status](https://coveralls.io/repos/dsaenztagarro/myfamilyweb/badge.svg?branch=master&service=github)](https://coveralls.io/github/dsaenztagarro/myfamilyweb?branch=master)
[![Dependency Status](https://gemnasium.com/dsaenztagarro/myfamilyweb.svg)](https://gemnasium.com/dsaenztagarro/myfamilyweb)

# myfamilyweb

Rails app for management of electronic devices at home

## Features

- Custom scaffolding templates (see `lib/templates/erb/scaffold` folder)
- Custom form builder helpers (see `app/builders/bootstrap_form_builder.rb`)
- Rails cache for index/show pages

## Additional rake tasks

- `coverage:cucumber`: Launchs a browser with Cucumber coverage report index page
- `coverage:rspec`: Launchs a browser with Rspec coverage report index page
- `design:admin`: Launchs a browser with the admin template design
- `design:blog`: Launchs a browser with the blog template design
- `design:forum`: Launchs a browser with the forum template design
- `db:dev`: Regenerates development db
- `db:dev_data`: Generates data for development db
- `quality:reek`: Run reek to examine classes
- `quality:cane`: Run cane to check quality metrics
- `quality:all`: Run all quality checks
