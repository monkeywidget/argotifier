Installation
============

Install database
----------------

Currently configured for PostgreSQL.app on OSX 10.8 (Mountain Lion).

Note that we downgraded to PostgreSQL 9.2.2 (from 9.2.4) due to incompatibilities in rspec:
https://github.com/PostgresApp/PostgresApp/issues/109


Set up the database
-------------------

Note that with "-s" this user can create/delete tables - not for production!

    $ createuser -s argotifier
    $ createdb -O argotifier argotifier_dev
    $ createdb -O argotifier argotifier_test
    $ createdb -O argotifier argotifier_prod


Make sure the user's password is set to what is in config:

    ALTER USER argotifier WITH PASSWORD 'start123';

Compile and install
-------------------

    $ bundle install


Continue on to Verification


Verification
============

Run the unit tests
------------------

Get the database ready:

    $ RAILS_ENV=test bundle exec rake db:test:prepare
    $ RAILS_ENV=test bundle exec rake db:migrate

The spec tests were written with rspec:
    https://www.relishapp.com/rspec/rspec-rails/docs/model-specs

Run all the tests:

    $ bundle exec rspec

To run only a couple tests use one of:

    $ bundle exec rspec spec/models/words_model_spec.rb
    $ bundle exec rspec spec/models/words_model_spec.rb -e "#as_template"
    $ bundle exec rspec spec/models/words_model_spec.rb \
            -e "converts a all-lowercased word to 'x'"


Test the JSON interface
-----------------------

- see: manual-api-commands.md


Debugging
=========

Clear and rebuild based on the current db schema
------------------------------------------------

    RAILS_ENV=test bundle exec rake db:reset

Clear and rebuild the db completely
-----------------------------------

Ignoring and regenerating schema.rb:

    $ RAILS_ENV=development bundle exec rake db:drop
    $ RAILS_ENV=development bundle exec rake db:create

Then

    $ RAILS_ENV=development bundle exec rake db:migrate
    $ RAILS_ENV=development bundle exec rake db:seed
