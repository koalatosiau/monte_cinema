# Monte Cinema :movie_camera: :popcorn:

Simple ticket booking tool for cinema developed as a part of Monterail Rubycamp.

## Technology stack

  Name |  Version |
  | :--: | :---: |
  | [Ruby](https://www.ruby-lang.org) | 3.1.2 |
  | [Rails](http://www.rubyonrails.org/) | 7.0.3 |
  | [PostgreSQL](https://www.postgresql.org/) | 14.5 |

## Configuration

  Clone project repository: `git clone git@github.com:koalatosiau/monte_cinema.git`

  Install required gems: `bundle install`

  Create and seed database:
  ```
  rails db:create
  rails db:migrate
  rails db:seed
  ```
  or alternatively: `rails db:setup`

  Start the Rails server: `rails server` or `rails s`

## How to run the test suite

  Simply write `rspec` in console and watch the RSpec magic happen!

  If you choose to do so, you can reset the format to default by removing `--format documentation` from `.rspec` file.
