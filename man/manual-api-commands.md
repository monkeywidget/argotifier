RESTful API reference
=====================

Page
====

show
----

    curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/pages/1

Example output:

    {"created_at":"2013-06-15T06:38:19Z","contents":"An entire page goes here - several sentences worth","index":1,"updated_at":"2013-06-15T06:38:19Z"}


Words
=====

count
-----

    curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/words/count

Example output:

    {"catalog_size":4}

index
-----

    curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/words/

Example output:

    [{"created_at":"2013-06-15T06:38:19Z","id":1,"text":"foo","updated_at":"2013-06-15T06:38:19Z"},{"created_at":"2013-06-15T06:40:21Z","id":3,"text":"garply","updated_at":"2013-06-16T03:29:43Z"},{"created_at":"2013-06-16T03:32:13Z","id":4,"text":"bar","updated_at":"2013-06-16T03:32:13Z"},{"created_at":"2013-06-16T03:32:19Z","id":5,"text":"baz","updated_at":"2013-06-16T03:32:19Z"}]

For none:
    []

create
------

    curl -i -X POST  -H "Content-type: application/json" -d '{"text":"foo"}' http://localhost:3000/words/

Example output:

    {"created_at":"2013-06-15T06:38:19Z","id":1,"text":"foo","updated_at":"2013-06-15T06:38:19Z"}

show
----

    curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/words/1

Example output:

    {"created_at":"2013-06-15T06:38:19Z","id":1,"text":"foo","updated_at":"2013-06-15T06:38:19Z"}

update
------

    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d '{"word":{"text":"garply"}}' http://localhost:3000/words/2.json

Example output: (none)

destroy
-------

    curl -i -H "Accept: application/json" -X DELETE  http://localhost:3000/words/2.json

Example output: (none)



TranslatedWords
===============

create
------

    curl -i -X POST  -H "Content-type: application/json" \
        -d '{"word":"foo","translation":"bar"}' http://localhost:3000/translated_words/

Example output:

    {"created_at":"2013-06-28T02:03:51Z","id":4,"translation":"bar","updated_at":"2013-06-28T02:03:51Z","word_id":11}ungolia

or

    {"word_id":["has already been taken"]}

index
-----

    curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/translated_words/

Example output:

    [{"created_at":"2013-06-23T18:52:21Z","id":2,"translation":"bar","updated_at":"2013-06-23T18:52:21Z","word_id":6,
    "word":{"created_at":"2013-06-23T18:26:30Z","id":6,"text":"foo","updated_at":"2013-06-23T18:26:30Z"}},
    ...
    ]

show
----

    curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/translated_words/1

Example output:

    {"created_at":"2013-06-23T18:52:21Z","id":2,"translation":"bar","updated_at":"2013-06-23T18:52:21Z","word_id":6,
    "word":{"created_at":"2013-06-23T18:26:30Z","id":6,"text":"foo","updated_at":"2013-06-23T18:26:30Z"}}

update
------

    curl -v -H "Accept: application/json" -H "Content-type: application/json" \
         -X PUT -d '{"translated_word":{"translation":"garply"}}' http://localhost:3000/translated_words/2.json

Example output:  (none)

destroy
-------

    curl -i -H "Accept: application/json" -X DELETE  http://localhost:3000/translated_words/2.json

Example output: (none)


search by translated word
-------------------------

    curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/translated_words/by_translation/bar

Example output: (same as "show")


search by original word
-----------------------

    curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/translated_words/by_original_word/foo

Example output: (same as "show")




Sentences
=========

create
------

Example output:

index
-----

Example output:

show
----

Example output:

update
------

Example output:  (none)

destroy
-------


Example output: (none)

