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

Example output:

    (none)

destroy
-------

    curl -i -H "Accept: application/json" -X DELETE  http://localhost:3000/words/2.json

Example output:

    (none)
