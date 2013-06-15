Installation
============

Install database
----------------

Currently configured for PostgreSQL.app on OSX 10.8 (Mountain Lion).

Note that we downgraded to PostgreSQL 9.2.2 (from 9.2.4) due to incompatibilities in rspec:
https://github.com/PostgresApp/PostgresApp/issues/109


Set up the database
-------------------

    $ createuser argotifier
    $ createdb -O argotifier argotifier_dev
    $ createdb -O argotifier argotifier_test
    $ createdb -O argotifier argotifier_prod



Configuration
=============

Verification
============

Test (manually) the JSON interface
- TBD: see in words_controller.rb

