define(function(){
   require.config({
		baseUrl: "js/",
		paths: {
			"jquery": "lib/jquery-1.11.0.js",
			"app": "app/app.js"
		},shim:{ 
			"underscore":{
				"exports":"_"
			}
		}
	})
});