argotifier
==========

Automatic word and phrase substitution for simple codes!

- The rails app need only be running for API calls for the AJAX UI at  http://localhost:3000/pager
- for basic load/save, editing contents, see "Use the CLI" below

NOTE: For now, make sure to specify environment on every command.  Example:

        $ RAILS_ENV=production bundle exec rails server
        $ RAILS_ENV=test bundle exec rspec


What it's for
-------------

A simple DB-based app, entirely RESTful (HTTP), which stores 
code word / plaintext word mappings.

Tech Notes
----------

- PostgreSQL
   - Note: show_counts_of_translations_like, one of the CLI translated_word_finders has hardcoded SQL
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
- CLI utilities in bin


In Progress
-----------

See doc/Development-log.md

Unfinished but prioritized:
- CLI output translated Document to file

How To: Develop & Install
=========================

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


How To: Use the CLI
===================


Load a new document to be translated from a file
------------------------------------------------

     $ document load "New Title" <plaintext_filename.txt>


Save a rendered translation to a file
-------------------------------------

     $ document save "Existing Title" <translation_filename.txt>


Print the translation of a paragraph (or range)
-----------------------------------------------

     $ paragraph 1
     $ paragraph 12 14

Wraps to 80 columns

Set a new translation of a word
-------------------------------

translates every instance of "foo" to "bar"

     $ translation foo bar

Show all the words translated to
--------------------------------

Shows every word translated to "foo," with counts

     $ translation foo


Save the translation dictionary to file
---------------------------------------

     $ dictionary save <filename.csv>

Load the translation dictionary form file
-----------------------------------------

     $ dictionary load <filename.csv>

List words matching a substring
-------------------------------

     $ word <matching substring>

List counts of sentences using words matching a substring
---------------------------------------------------------

     $ word -c <matching substring>


List words matching a substring which have no translation
---------------------------------------------------------

     $ word -u <matching substring>


Show original and translated Sentences using words matching a substring
-----------------------------------------------------------------------

     $ sentence <matching substring>


Show translated Sentences using translated words matching a substring
---------------------------------------------------------------------

     $ sentence -t <matching substring>
