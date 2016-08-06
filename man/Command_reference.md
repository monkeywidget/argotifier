How To Use the CLI
===================

![Argotifier Models diagram here](https://raw.githubusercontent.com/monkeywidget/argotifier/201608-refactor/man/Argotifier_Models.png "Argotifier Models")


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

Wraps to 80 columns!

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

Load the translation dictionary from file
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


List a random word which has no translation
---------------------------------------------------------

    $ word -r


Show original and translated Sentences using words matching a substring
----------------------------------------------------------------------

    $ sentence <matching substring>


Show translated Sentences using translated words matching a substring
---------------------------------------------------------------------

    $ sentence -t <matching substring>
