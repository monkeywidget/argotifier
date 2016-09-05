How To Develop & Install
=========================

Run the unit tests
------------------

    $ bundle exec rspec

For more on the tests see [Install-steps](man/Install-steps.md)

Run the server
--------------

    $ bundle exec rails server

Access the UI
-------------

     http://localhost:3000/pager

Access the REST API
-------------------

see  [Manual API Commands](man/manual-api-commands.md)

Set up the database
-------------------

Make sure the path to Postgres is in your path!

Example: `/Applications/Postgres.app/Contents/Versions/latest/bin/`

    $ createdb -O argotifier argotifier_test
    $ RAILS_ENV=test bundle exec rake db:test:prepare

Troubleshoot the database
-------------------------

    $ /Applications/Postgres.app/Contents/MacOS/bin/psql -U argotifier argotifier_test

Reset the database
------------------

Drops, and then recreates the database and includes your `seeds.rb`:

    $ rake db:reset

Loads from `schema.rb`:

    $ rake db:reset

Loads from migrations:

    $ rake db:drop db:create db:migrate db:seed
