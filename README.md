argotifier
==========

Automatic word and phrase substitution for simple codes

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
- control panel opens and closes
- Backbone, Require installation


Incomplete Tasks
----------------

- assertions in jasmine tests for stories
- view page (with jasmine tests and mock data)
- next/prev page (with jasmine tests and mock data)
- goto page (with jasmine tests and mock data)

- search scenarios (with jasmine tests and mock data)
- translation scenarios (with jasmine tests and mock data)

- restructure project for ruby on rails

- PostgreSQL setup
- basic document creation/destruction (REST) with test
- basic REST with tests for
	- words
	- sentences
	- translations
	- paragraphs
	- documents
- CSV input / output with tests
- CLI script for document creation
- CLI script for document delete
- CLI script for document output as CSV
- CLI script for document input as CSV
- web API for paragraph, range of paragraphs, and document
 - and tests
- web API for page with word index and tests
- view: widget for page view
- view: widget for translation search (word only)
- view: widget for translation creation/edit/remove (word only)



