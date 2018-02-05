<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<!doctype html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>驾驶证业务网上预约成功</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${ctx}/css/app/app.css" rel="stylesheet"type="text/css" />
		<link href="${ctx}/css/app/mui.min.css" rel="stylesheet"type="text/css" />
		<link href="${ctx}/js/plugins/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header  class="mui-bar mui-bar-nav">
			<a class="mui-icon mui-icon-home mui-pull-left" href="http://${ctx }/front/welcome!index.action?typePath=${typePath }&code=${code }"></a>
			<h1 class="mui-title">预约成功</h1>
		</header>
		<div class="mui-content">
			<div class="mui-table-view">
				<ul class="mui-table-view">
					<li class="mui-table-view-cell">
						预约号码
						<div class="i-content-text">${driveInfo.bookNumber}65656456456456465</div>
					</li>
					<li class="mui-table-view-cell">
						申办业务
						<div class="i-content-text">${driveInfo.businessType.name}</div>
					</li>
					<li class="mui-table-view-cell">
						预约日期
						<div class="i-content-text">${driveInfo.appointmentDate}</div>
					</li>
					<li class="mui-table-view-cell">
						预约时间
						<div class="i-content-text">${driveInfo.appointmentTime}</div>
					</li>
					<li class="mui-table-view-cell">
						受理单位
						<div class="i-content-text">${driveInfo.organization.name}</div>
					</li>
					<li class="mui-table-view-cell">
						详细地址
						<div class="i-content-text">${driveInfo.organization.description}</div>
					</li>
					<li class="mui-table-view-cell">
						<p style="color: red">说明：</p>
						<p>如您是AB类驾驶人，请您下载"交管12123"手机软件,并进行注册后，方可到窗口办理驾驶证业务。</p>
						<p style="color: red">温馨提示：</p>
						<p>1.请在预约时间段内前来办理,逾期将无法办理。 </p>
						<p>2.请打印预约回执或用手机或其他方式拍摄本页面。 </p>
						<p>3.当日预约，工作人员可通过扫描二维码的方式获得预约信息。请用手机拍摄下二维码。 </p>
					</li>
					<c:if test="${!empty qrCodePath }">
						<li class="mui-table-view-cell">
							<input type="button" id="QRCfind" value="显示二维码" />
						</li>
					</c:if>
					
				</ul>
		</div>
	</div>
</body>
<script type='text/javascript' src='${ctx}/js/pages/front/include.js?{ctx:"${ctx}",jsfileversion:"2.0"}'></script>
<script type="text/javascript">

	$(function(){
		$("#QRCfind").click(function(){
			$.dialog({content: "<img  src='${ctx }/${qrCodePath }'>",yesFn: true});
		})
	})
</script>
</html>
