<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>驾驶证业务网上预约</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${ctx}/css/app/app.css" rel="stylesheet"type="text/css" />
		<link href="${ctx}/css/app/mui.min.css" rel="stylesheet"type="text/css" />
		<link href="${ctx}/js/plugins/artDialog/skins/default.css"rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header  class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">驾驶证业务网上预约</h1>
		</header>
		<div class="mui-content">
			<div class="mui-content-padded">


		<form action="${ctx}/front/welcome!jszBook.action" method="post" id="jszForm">
		<s:token></s:token>
			<input type="hidden" name="typePath" value="${typePath}"/>
			<input type="hidden" name="code" value="${code}" id="code"/>
			<s:hidden name="driveInfo.name"></s:hidden>
			<s:hidden name="driveInfo.idNumber"></s:hidden>
			<s:hidden name="driveInfo.mobile"></s:hidden>
			<s:hidden name="driveInfo.businessType.id" id="businessTypeId"></s:hidden>
			<s:hidden name="driveInfo.idType.id" id="idTypeId"></s:hidden>
			<s:hidden name="bt.id" id="btid"></s:hidden>
			<s:hidden name="driveInfo.bookerMobile" id="bookerMobile"></s:hidden>
			
			<span style="display: none;" id="jq_reorganizationId">${driveInfo.organization.id}</span>
			<span style="display: none;" id="jq_reappointmentDate">${driveInfo.appointmentDate}</span>
			<span style="display: none;" id="jq_reappointmentTime">${driveInfo.appointmentTime}</span>
			<span id="errorMess" style="display: none">${errorMessage}</span>
			
			
			<h5>预约办理单位：</h5>
			<div class="mui-input-row">
				<select id="org_id" name="driveInfo.organization.id" onchange="select_org(this.value);" class="i-select">
					<c:forEach var="org" varStatus="varStatus"   items="${list}">
						<option name="org" value="${org.id}" textstr="${org.name}" >${org.name}</option>
					</c:forEach>
				</select>
			</div>
			
			<h5>预约日期（工作日）：</h5>
			<div class="mui-input-row">
				<select id="dates" name="driveInfo.appointmentDate" class="i-select" onchange="select_date(this.value)"></select>
			</div>
			
			<h5>预约时间：</h5>
			<div class="mui-input-row">
				<select id="times"  name="driveInfo.appointmentTime" class="i-select"></select>
			</div>
			
			<div class="i-button-box">
				<button type="button" class="mui-btn i-btn-bule" id="jq_form_submit_btn">预约</button>
			</div>	
		</form>
		</div>
		</div>
		<script type='text/javascript' src='${ctx}/js/app/mui.min.js'></script>
		<script type='text/javascript' src='${ctx}/js/pages/front/include.js?{ctx:"${ctx}",jsfileversion:"2.0"}'></script>
	</body>
</html>