# Jobs and More

Hiring tool for companies and job seekers.

### Prerequisites

Application is built with:

- ruby 3.0.2
- Rails 6.1.4.1
- Postgres 13.3
- nvm 12.14.1

### Running locally

To run locally:

1. Clone this repository and navigate into root
2. bundle install to install needed gems
3. Run `bin/rails db:create` to create databases for each environment
4. Run `bin/rails db:migrate` to migrate database. No need to seed test database, since we're doing seed before executing each spec and cleaning it with DatabaseCleaneru afterwards
5. Run `yarn add bootstrap jquery @popper.js/core` (if it reports error `Yarn not found`, probably the nvm version is outdated)
6. Run `./bin/rails db:migrate db:test:prepare` to prepaare test database

Of course, we might create a Dockerfile to run an app in a docker container, but it was not done it this showcase

### Tests

There are three types of tests:

- function tests, done with RSpec
- models tests, done with RSpec
- system tests done with Capybara

To run all tests, type: `bundle exec rspec`

Tests are executed against test database and no mocking is used. Not all functionalities are covered with tests
