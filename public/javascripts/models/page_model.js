define ([
    'underscore',
    'backbone'
    ], function(_, Backbone){

    'use strict';

    Backbone.sync = function(method, model, success, error){
        success();
    }

    var Page = Backbone.Model.extend({
        defaults: {
            'index': '1'
        },

        index: function() {
            return this.get("index");
        },

        contents: function() {
            return this.get("contents");
        },

        /* setIndex: function(new_value) {
          this.set("index", new_value);
        }, */

        initialize: function(){
            // console.log('in Page.initialize: index is '+ this.index())
            // fixes loss of context for 'this' within methods
            _.bindAll(this, 'contents', 'index');
        }
    });

    return Page;

});



