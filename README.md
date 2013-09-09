argotifier
==========

Automatic word and phrase substitution for simple codes

http://localhost:3000/pager

What it's for
-------------

A simple DB-based app, entirely RESTful (HTTP), which stores 
code word / plaintext word mappings.

Tech Notes
----------

- PostgreSQL
- Server side:
   - Ruby on rails
   - RESTful interface
- JavaScript
   - jQuery
   - backbone.js / underscore.js
   - require.js


Development Order
=================

Completed Tasks
---------------
- basic viewer page design
- view: widget for page view
- control panel opens and closes
- Backbone, Require installation
- restructure project for ruby on rails
- PostgreSQL setup
- view page
- next/prev page
- view - goto page
- basic REST with controller and model tests
- REST with tests for words model and controller
- REST with tests for translations model and controller


Incomplete Tasks
----------------

- REST with tests for sentences model and controller
- REST with tests for paragraphs model and controller
- REST with tests for documents model and controller

- assertions in jasmine tests for stories
- view page jasmine tests and mock data
- jasmine tests: next/prev page
- jasmine tests: goto page

- search scenarios (with jasmine tests and mock data)
- translation scenarios (with jasmine tests and mock data)

- basic document creation/destruction (REST) with test
- CSV input / output with tests
- CLI script for document creation
- CLI script for document delete
- CLI script for document output as CSV
- CLI script for document input as CSV
- web API for paragraph, range of paragraphs, and document
 - and tests
- web API for page with word index and tests
- view: widget for translation search (word only)
- view: widget for translation creation/edit/remove (word only)



How To
======

Run the unit tests
------------------

     $ bundle exec rspec
     $ bundle exec rspec spec/models/words_model_spec.rb
     $ bundle exec rspec spec/models/words_model_spec.rb -e "#as_template"
     $ bundle exec rspec spec/models/words_model_spec.rb \
            -e "converts a all-lowercased word to 'x'"

Run the server
--------------

     $ bundle exec rails server

Access the UI
-------------

     http://localhost:3000/pager


Access the REST API
-------------------

see doc/manual-api-commands.md
