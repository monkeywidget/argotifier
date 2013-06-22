define ([
    'underscore',
    'backbone',
    'models/page_model'
], function(_, Backbone, Page){

    // console.log('hola 2!');

    'use strict';

    // intercept the outgoing calls
    /* Backbone.sync = function(method, model, success, error){
        success();
    }  */

    // DEBUG:
    $('#header').fadeOut('slow');

    // open and close the control panel without DOM
    /* $('#panel_toggle').click( function() {
        $('#control_panel').slideToggle('fast');
    })  */


    var PageView = Backbone.View.extend( {
        el: $('#page_container'),

        events: {
            'click div#panel_toggle': 'toggleControlDrawer',
            'click a#prev_page_arrow': 'loadPrevPage',
            'click a#next_page_arrow': 'loadNextPage',
            'keypress input#goto_page_number': 'gotoHandler'
        },

        toggleControlDrawer: function() {
            $('#control_panel').slideToggle('fast');
        },

        displayPage: function(new_index){
            console.log('trying to display page ' + new_index)

            var self = this; // for callback
            var new_page = new Page({'id': parseInt(new_index)});

            new_page.fetch( {
                success: function() {
                    console.log('DEBUG: async fetch: ' + new_page.contents());
                    self.page = new_page;
                    self.render();
                }
            });
            // console.log('DEBUG: outside fetch: ' + new_page.contents());
        },

        gotoHandler: function (event) {
            // only does somethjing on "enter" key
            if (event.which == 13) {
                this.gotoPage(parseInt($('input#goto_page_number').val()));
            }
            /* else {
                console.log('DEBUG: non-enter was pressed');
            }  */
        },

        gotoPage: function(page_number) {
            this.displayPage( page_number );
        },


        loadPrevPage: function() {
            // console.log('called load Prev page')
            var newPage = parseInt(this.page.index()) -1;
            if ( newPage < 1 ) {
                newPage = 1;
            }
            this.displayPage(newPage);
        },

        loadNextPage: function() {
            // console.log('called load Next page')
            var newPage = parseInt(this.page.index()) +1;

            /* var last_page =
            if ( newPage > last_page ) {
                newPage = last_page;
            }  */

            this.displayPage(newPage);
        },


        initialize: function(){

            // fixes loss of context for 'this' within methods
            _.bindAll(this, 'render',
                'toggleControlDrawer',
                'gotoHandler', 'gotoPage',
                'loadPrevPage', 'loadNextPage', 'displayPage'

            );

            // the first time we'll load in page 1
            this.displayPage(1);                   // includes render
        },

        render: function(){
            $('#page_panel').html("<h2>Page " + this.page.index() +
                                  "</h2><div class=\"document_text\">" +
                                  this.page.contents() +
                                  "</div>");
        }

    });

    return PageView;

});

