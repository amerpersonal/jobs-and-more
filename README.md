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

### API

As a showcase, small API is made, for developing mobile applications. There is a single request, for browsing jobs:

```
curl --location --request GET 'http://localhost:3000/api/v1/jobs' \
--header 'Cookie: __profilin=p%3Dt' \
--data-raw ''
```

It returns data in json format.

### Tests

There are three types of tests:

- function tests, done with RSpec
- models tests, done with RSpec
- system tests done with Capybara

To run all tests, type: `bundle exec rspec`

Tests are executed against test database and no mocking is used. Not all functionalities are covered with tests.

### Further work

The project contains only POC and it shoule be further developed, both in terms of technical improvements and adding new functionalities. Things that could be improved and added:

- better code coverage with tests
- full API for all endpoints
- add option for user to add job to wish list and gets notification a few days before job expiration
- matching jobs for user based on his preferences
- messaging between job seekers and companies
- performance improvements (some of them are already done on browsing jobs page) - avoid stressing database to much with Active Record default behavior
- categories page
- CRUD for adding category and company
- reports for companies
- many more
