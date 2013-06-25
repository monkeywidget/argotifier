$(document).ready(function(){
    (function() {
        'use strict';

        require.config({
            paths: {
                underscore: 'libs/underscore/underscore',
                backbone: 'libs/backbone/backbone-min'
                // jquery ?
            },

            shim: {
                'underscore': {
                    exports: '_'
                },

                'backbone': {
                    deps: ['underscore', 'jquery'],
                    exports: 'Backbone'
                }
            }
        });

        require([
            'models/page_model',
            'models/pagedocument_model',
            'models/translated_word_model',
            'views/page_view'
            ], function(Page, PageDocument, TranslatedWord, PageView) {

            var pageView = new PageView();
        });


    }());
});


