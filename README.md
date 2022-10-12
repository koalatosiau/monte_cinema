# Monte Cinema :movie_camera: :popcorn:

Simple ticket booking tool for cinema developed as a part of Monterail Rubycamp.

## Technology stack

  Name |  Version |
  | :--: | :---: |
  | [Ruby](https://www.ruby-lang.org) | 3.1.2 |
  | [Rails](http://www.rubyonrails.org/) | 7.0.3 |
  | [PostgreSQL](https://www.postgresql.org/) | 14.5 |

## Configuration :hammer_and_wrench:

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
  
## Live App 

  [Monte Cinema on Heroku](https://monte-cinema-as.herokuapp.com/)
  
## Known issues :construction:

 - devise notices don't always show up (for example password requirements during registration)
   - sometimes when they do, they are persistent (when deleting a user)
 - deleting hall, movie or screening *will* cause errors with associated reservations (as reservations are not to be permanently deleted, there needs to be more logic added than simple dependent option)
 - screenings may be added with the same start time in the same hall
