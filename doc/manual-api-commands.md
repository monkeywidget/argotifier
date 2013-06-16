RESTful API reference
=====================

Words
=====

count
-----

    curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/words/count


index
-----

    curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/words/

create
------

    curl -i -X POST  -H "Content-type: application/json" -d '{"text":"foo"}' http://localhost:3000/words/

show
----

    curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/words/1

update
------

    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d '{"word":{"text":"garply"}}' http://localhost:3000/words/2.json

destroy
-------

    curl -i -H "Accept: application/json" -X DELETE  http://localhost:3000/words/2.json

