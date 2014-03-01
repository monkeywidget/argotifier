Development Log
===============

https://github.com/monkeywidget/argotifier/

- Log is in "blog order" - Most recent first!
- Intended to record the rails- rspec- and other framework steps


CURRENT GOAL
============

(see below under "soon")

CLI commands:

- CLI output translated Document to file


commit TBI "later"
------------------

- fix PG error / rspec tests
- REST tests for sentences model and controller
- REST tests for paragraphs model and controller
- REST tests for documents model and controller

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

- move existing routing spec to non-controller area
- UI: translated_word search should handle multiple results (include rspec)
- sentence controller tests

unimplemented specs:
- Sentence#create works (controller)

- Sentence#create rejects a nonexistent paragraph
- SentencesController#create both creates and tokenizes the sentence
- ParagraphsController#show should include original sentences
- ParagraphsController#show should include translated sentences
- Document add some examples to (or delete) /Users/brain/Documents/workspace/argotifier/spec/models/document_model_spec.rb
- Paragraph#create rejects a nonexistent document


commit TBI "soon"
-----------------

- CLI "word foo" - shows all words like "foo", with their translations
- CLI "word -u foo" - shows all words like "foo" that are without translations


implemented but not yet committed
---------------------------------



Implemented and committed
=========================

commit
-----------------------------------------------

- CLI "dictionary load filename.csv" - restores translations

commit 660d07a949be7665615c62b65246d0c2d5385c06
-----------------------------------------------

- CLI "dictionary save filename.csv" - saves translations
- CLI "translation foo"
- fixed TranslatedWord rewriting case, added stub for test

commit 92253dfd9d07d2cdbe6bcc45db4d7f746df4a044
-----------------------------------------------

- CLI "translation foo bar"
    - sets translation "foo" -> "bar"
- CLI "document load "New Title" <plaintext_filename.txt>"
- CLI "paragraph 1" "paragraph 12 14"
    - renders translated paragraphs (col 80 wrap)

- Paragraph#show now shows translation
- REST create a Sentence, adds to named Paragraph
- REST create a Paragraph, adds to named Document
- REST: create an empty Document


      curl -i -X POST  -H "Content-type: application/json" -d '{"title":"Star Smashers of the Galaxy Rangers"}' http://localhost:3000/documents/
      curl -i -X POST  -H "Content-type: application/json" -d '{"text":"Beware the Jabberwock, my son!\\nThe jaws that bite, the claws that catch! Beware the Jubjub bird,\\nand shun The frumious Bandersnatch!","document":"1","document_index":"1"}' http://localhost:3000/paragraphs/




commit dc1f6fc33ecb04d07eb5d5c1dedc16af6cac503c
-----------------------------------------------

- Paragraph#create controller
- Document#create controller (in progress)
- upcoming: post a Paragraph text and have it parse and add to named Document

commit 8196aa5840796735d6a7c8a17f9eede1fd9aba47
-----------------------------------------------

- add factory document to paragraph factory
- paragraph create model specs
- add document to paragraph create
- document model
    bundle exec rails generate model document title:string

commit 295422c7e588f78cac3bdedf0258416d1e3cb250
-----------------------------------------------

- paragraph: tokenize (model) bug fixes
- paragraph rendering model spec


commit 61218607e07efd0e22721a575977cf9b837e109e
-----------------------------------------------

- paragraph: tokenize (model) and spec

commit f83cd41d10c99de9423ee76cf7ab66043eb55d2b
-----------------------------------------------

- paragraph rendering in model
- paragraph controller
- paragraph controller tests


commit 3a0ec111ee4dbe29b769f99d495f220a35b2ffb8
-----------------------------------------------

- sentence controller
- sentence create tests

commit d4c0a8b8192e28d0e689c8d1c5d71a61a13ff7ff
-----------------------------------------------
Sentence model completed
- sentence parser tests
- sentence renderer tests
- sentenceword broken out into own model file
- sentenceword factory fixed



commit 4d39b0de79bb2f6811484b65954e5e33f4086794
-----------------------------------------------

- sentence parser
- sentence renderer
- create sentence/word many-to-many relationship
- create paragraph model
- create sentence model
    bundle exec rails generate model sentence word_template:string
- create word template generation/render, with rspec


commit cdddbc327d0e36825a52b1bfeb979a6b9dc8a247
-----------------------------------------------

- implement word.in_argot and tests

commit a2bd7f1c14851ee7ad7ee5366a578809a48756f5
-----------------------------------------------

- translated_word search by translation
- translated_word search by original word
- translated_word create API takes the original word's text, not its index
- translated_word controller and tests
- translated_word model - unique translation per word

commit 620101feb708e4bdfbf351225acb395800729ce9
-----------------------------------------------

- JavaScript: Backbone sync of Page uses REST API
- static location for html/jquery pages
    http://localhost:3000/pager

commit a26db07c2eb05dde68cf8e2a88bde279bb9196d0
-----------------------------------------------

- Page interface/controller and route but no model

- created translated_word model
    bundle exec rails generate model translated_word translation:string word:belongs_to
    rake db:migrate
    rake db:migrate RAILS_ENV="test"


commit 799f860d4beb8f990853590fda1eec488a36efad
-----------------------------------------------

- more model tests
- first controller tests, with routing (still rspec)
- manual controller tests with curl

commit 99a670210782165fd4da1d091988474436ee84f5
-----------------------------------------------

- created rails app
- generate basic rspec framework in app
    rails generate rspec:install
- running tests:
    bundle exec rspec
- created Word class and updated (autogenerated) schema.rb :
    rails generate model word text:string
    rake db:migrate
- migrate test db (dev is the default and was initialized with previous command)
    rake db:migrate RAILS_ENV="test"
- create and run initial test
    bundle exec rspec

commit f97725bdfa8955cbcc53159026debcafb3a4132a and previous
------------------------------------------------------------

javscript/jquery interface working:
- basic viewer page design
- view: widget for page view
- control panel opens and closes
- Backbone, Require installation
- PostgreSQL setup
- view page
- next/prev page
- view - goto page


