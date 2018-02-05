/*配置模块信息*/
define(function(){
   require.config({
		baseUrl: "js/",
		paths: {
			"jquery": "lib/jquery/jquery-3.3.1.min.js",
			"app": "app/app.js",
			"mui":"mui/mui.min.js"
		},shim:{ 
			"underscore":{
				"exports":"_"
			}
		}
	})
});