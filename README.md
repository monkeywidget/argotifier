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
   - Note: show_counts_of_translations_like, one of the CLI translated_word_finders has hardcoded SQL:
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

- CLI "translation foo bar" - sets translation "foo" -> "bar"
- CLI "untranslate foo" - removes translation for "foo"

- CLI output translated Document to file

- CLI "dictionary save filename.csv" - saves translations
- CLI "dictionary load filename.csv" - restores translations

- CLI "translation foo" - shows all the words that are translated to "foo"
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
