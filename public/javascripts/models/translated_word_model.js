define ([
    'underscore',
    'backbone'
], function(_, Backbone){

    'use strict';


    var TranslatedWord = Backbone.Model.extend({
        urlRoot: '/translated_words',

        defaults: {
            'id': '2'         // DEBUG
        },

        id: function() {
            return this.get('id');
        },

        translation: function() {
            return this.get('translation');
        },

        word: function() {
            return this.get('word')['text'];
        },

        initialize: function(){
            // fixes loss of context for 'this' within methods
            _.bindAll(this, 'id', 'translation', 'word');
        }

    });

    return TranslatedWord;

});
