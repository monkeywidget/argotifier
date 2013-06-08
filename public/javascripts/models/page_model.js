(function($){
    Backbone.sync = function(method, model, success, error){
        success();
    }

    var Page = Backbone.Model.extend({
        defaults: {
            'index': '1'
        }
    });

    // load 'contents'

})(jquery);



