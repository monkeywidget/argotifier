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
- development tools
   - ruby: gem, bundler, rspec, rcov
      - on OSX: rbenv


Development Order
=================

Current state:
- REST interface for
   - Word
   - TranslatedWord
   - Sentence
   - Paragraph
   - Document: create
- models for all

Unfinished but prioritzed:
- CLI create Document from input file
- CLI insert/edit translation utility
- CLI load/save translations table
- CLI output translated Document

- AJAX pager

In Progress
-----------

See doc/Development-log.md

Incomplete Tasks as yet unscheduled
-----------------------------------

- REST with tests for sentences model and controller
- REST with tests for paragraphs model and controller
- REST with tests for documents model and controller

- assertions in jasmine tests for stories
- view page jasmine tests and mock data
- jasmine tests: next/prev page
- jasmine tests: goto page

- search scenarios (with jasmine tests and mock data)
- rails: search by name: word and rspec
- rails: search by name: translated_word and rspec

- translation scenarios (with jasmine tests and mock data)
- rails: translated_word#update and rspec
- rails: translated_word#delete and rspec

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

- port/deploy to AWS

- code coverage for rspec (rcov)
http://old.rspec.info/documentation/tools/rcov.html

- code coverage for jasmine
JSCover:
- http://blog.johnryding.com/post/46757192364/javascript-code-coverage-with-phantomjs-jasmine-and
- http://siliconforks.com/jscoverage/


How To
======

Run the unit tests
------------------

     $ bundle exec rspec

For more on the tests see doc/Install-steps.md


Run the server
--------------

     $ bundle exec rails server

Access the UI
-------------

     http://localhost:3000/pager


Access the REST API
-------------------

see doc/manual-api-commands.md

Set up the database
-------------------

     $ createdb -O argotifier argotifier_test

     $ RAILS_ENV=test bundle exec rake db:test:prepare

Troubleshoot the database
-------------------------

     $ /Applications/Postgres.app/Contents/MacOS/bin/psql -U argotifier argotifier_test


Load a new document to be translated from a file
------------------------------------------------

     $ bin/document load "New Title" <plaintext_filename.txt>


Save a rendered translation to a file
-------------------------------------

     $ bin/document save "Existing Title" <translation_filename.txt>

