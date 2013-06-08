requirejs.config ({
    baseUrl: "javascripts/libs",
    "paths": {
        "app": "../app",
        jquery: "jquery",
        underscore: "underscore",
        backbone: "backbone"
    },
    "shim": {
        underscore: {
            exports: "_"
        },
        backbone: {
            deps: ['underscore', 'jquery'],
            exports: 'Backbone'
        }
    }
})