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
   - CLI utilities
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


In Progress
-----------

See doc/Development-log.md

Unfinished but prioritized:
- CLI create Document from input file
- CLI output translated Document to file
- CLI "mapping save filename.csv" "mapping load filename.csv" - save/restores translations
- CLI "paragraph 1" "paragraph 12-14" - renders translated paragraphs (col 80 wrap)
- CLI "translation foo" - shows all the words that are translated to "foo"
- CLI "translation foo bar" - sets translation "foo" -> "bar"
- CLI "word foo" - shows all words like "foo", with their translations
- CLI "word -u foo" - shows all words like "foo" that are without translations



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

