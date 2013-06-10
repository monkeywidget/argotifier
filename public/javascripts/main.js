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
            'views/page_view'
            ], function(Page, PageDocument, PageView) {

            var pageView = new PageView();
        });

        /*require([
            'jquery',
            'libs/backbone/backbone',
            'models/Page',
            'models/PageDocument',
            'views/PageView'
        ], function($, Backbone, Page, PageDocument, PageView) {

            var Router = Backbone.Router.extend({
                routes: {
                    "": "main"
                },
                main: function(){
                    var tasks = new .Collection();
                    var view = new MasterView({collection: tasks});
                    tasks.fetch({
                        success: function(tasks){
                            $("#container").html(view.render().el).show();
                        }
                    });
                }
            });
        });*/
    }());
});


