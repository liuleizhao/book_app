/*配置模块信息*/
define(function(){
   require.config({
		baseUrl: "../js",
		paths: {
			"jquery": "lib/jquery/jquery-3.3.1.min",
			"mui":"lib/mui/mui.min",
			"cancel":"app/cancel"
		},shim:{
			"underscore":{
				"exports":"_"
			}
		}
	})
});