// import jquery

// basic without jquery
$(document).ready(function() {
    // DEBUG: $('#header').fadeOut('slow');

    // open and close the control panel without DOM
    /* $('#panel_toggle').click( function() {
        $('#control_panel').slideToggle('fast');
    })  */


    var PageView = Backbone.View.extend( {
        el: $('#page_container'),

        events: {
            'click div#panel_toggle': 'toggleControlDrawer',
            'click a#prev_page_arrow': 'loadPrevPage',
            'click a#next_page_arrow': 'loadNextPage'
        },

        toggleControlDrawer: function() {
            $('#control_panel').slideToggle('fast');
        },

        displayPage: function(new_index){
            this.page = new Page({'index': new_index});
            this.render();
        },

        loadPrevPage: function() {
            displayPage(this.page.index -1);
        },

        loadNextPage: function() {
            displayPage(this.page.index +1);
        },


        initialize: function(){
            // fixes loss of context for 'this' within methods
            _.bindAll(this, 'render',
                'toggleControlDrawer',
                'loadPrevPage', 'loadNextPage'
            );

            // the first time we'll load in page 1
            this.page = new Page({'index': '1'});

            this.render(); // not all views are self-rendering. This one is.
        },

        render: function(){
            $('#page_panel').append("<ul> <li>interior content here</li> </ul>");
        }

    }); // end PageView

    var pageView = new PageView();
});// (jquery);