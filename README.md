# Movie with Friends

This is the base repo for the [viewing party project](https://backend.turing.io/module3/projects/viewing_party) used for Turing's Backend Module 3.

### About this Project

Movie with Friends is an application in which users can explore movie options and create a viewing party event for the user and friends. It also freatures a live-chat service for users to create chat rooms and plan their parties.

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{create,migrate}`
4. Encrypt [TMBD](https://www.themoviedb.org/?language=en-US) API key with [Figaro](https://github.com/laserlemon/figaro): `movie_api_key=<your-api-key>`

## Versions

- Ruby 2.7.2

- Rails 5.2.6

- PostgreSQL >= 18

- React-rails 1.11

## Features

User Dashboard
- Add existing users as friends
- Viewing upcoming parties
Discover Movies
- Search by title
- View top 40 movies by rating

## Testing

Testing done through RSpec.
Coverage details monitored through [SimpleCov](https://github.com/simplecov-ruby/simplecov).
API calls mocked using [Webmock](https://github.com/bblimke/webmock) and [VCR](https://github.com/vcr/vcr).
- Cassettes created on a per-test basis.
- Configuration allows for query parameter modifications without creating new cassettes.
Run suite with: `bundle exec rspec`

## Deployment

This project uses [TravisCI](https://github.com/travis-ci/travis.rb) for continuous integration.
- If deploying through Heroku:
  1. Replace `app_name` with your application name on Heroku in `travis.yml`.
  2. Log in to the Travis CLI and authorize GH Repo on [Travis-CI](https://www.travis-ci.com/).
  3. Connect to your Heroku application: `travis encrypt $(heroku auth:token) --add deploy.api_key --pro`.
Live Chat feature requires [Redis](https://redis.io/) for ActionCable connections.
- [Redis to Go](https://elements.heroku.com/addons/redistogo) addon (or any other Redis addon) is required for Heroku deplyment.

## Authors

- Laura Court [GH](https://github.com/Lmcourt)
- Tanner Dale [GH](https://github.com/TannerDale)

## Acknowledgments

- [The Movie Database](https://www.themoviedb.org/) for movie information and details.
- [Turing School of Software and Design](https://backend.turing.io/module3/projects/viewing_party).
