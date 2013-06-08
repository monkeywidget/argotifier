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

        contents: function() {
            return this.get("contents");
        }
    });

});



