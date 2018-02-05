<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>车驾管网上预约温馨提示</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${ctx}/css/app/app.css" rel="stylesheet"type="text/css" />
		<link href="${ctx}/css/app/mui.min.css" rel="stylesheet"type="text/css" />
	</head>
	<body>
		<header  class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">网上预约温馨提示</h1>
		</header>
		<div class="mui-content">
			<div class="mui-content-padded">
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为贯彻落实深圳市政府2014年民生实事事项第110项关于逐步推行户政、出入境、车管业务网上预约、网上申请、“一站式”服务的要求，根据2013年1月1日起施行的公安部《公安机关执法公开规定》第二十三条关于公安机关应当逐步推进行政许可、非行政许可审批、备案类事项办理的网上预约的规定，车驾管业务从2014年7月15日起全面实行网上预约办理。对于未预约的孕妇、残疾人、60岁以上的群众，可直接到西丽总所及各分所“绿色通道”窗口办理。对于已预约办理业务，但未来办理预约的当事人，从第三次起将纳入“黑名单”库。 </p>
				<div class="i-button-box">
					<input type="button" class="mui-btn i-btn-bule"  onclick="window.location.href = '${ctx}/front/welcome!xys.action?typePath=${typePath}&code=${code}'" name="Submit" value="下一步" class="anni01"/>
				</div>
			</div>
		</div>
	</body>
	<script type='text/javascript' src='${ctx}/js/app/mui.min.js'></script>
</html>
