/*
	This file is responsible for being called by individual application page files for require.js
	All basic require js configuration is done here and we can declare settings / environments etc
	Shims and dependencies are especially noted and this file has been debugged as there was a priority loading issue before
*/


(function() {
  var config;

  config = {
    status: false,
    paths: {
      jquery: "/components/jquery/jquery",
      angular: "/components/angular/angular",
      underscore: "/components/underscore/underscore",
      angularResource: "/components/angular-resource/angular-resource",
      angularStates: "/components/angular-ui-router/build/angular-ui-states",
      facebook: "//connect.facebook.net/en_US/all.js#xfbml=1",
      twitter: "http://platform.twitter.com/widgets"
    },
    shim: {
      angular: {
        exports: "angular"
      },
      angularResource: {
        deps: ['angular']
      },
      angularStates: {
        deps: ['angular']
      },
      facebook: {
        exports: "FB"
      },
      twitter: {
        exports: "twttr"
      }
    },
    priority: ["angular", "facebook"],
    urlArgs: 'v=0.1'
  };

  require.config(config);

}).call(this);
