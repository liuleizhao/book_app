<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
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
			<h1 class="mui-title">
			 	<c:if test="${typePath eq 'jdcBookUI'}">网上机动车业务预约结果查询</c:if>
		     	<c:if test="${typePath eq 'jszBookUI'}">网上驾驶证业务预约结果查询</c:if>
			</h1>
		</header>
		<div class="mui-content">
			<div class="mui-content-padded">
			<div id="errorMess" style="display: none">${errMessage}</div>
			<form action="${ctx}/front/welcome!queryYuyueInfo.action" method="post" >
				<input type="hidden" name="smsCode" value="${smsCode}">
				<input type="hidden" name="typePath" value="${typePath}"/>
				<input type="hidden" name="code" value="${code}"/>		
				
				<h5>电话号码：</h5>
				<div class="mui-input-row">
					<input class="mui-input-group" type="text" readonly="true" name="bookerMobile" id="bookerMobile" value="${bookerMobile}" >
				</div>
				<h5>预约号码：</h5>
				<div class="mui-input-row">
					<input class="mui-input-group" type="text" name="bookNumber" id="bookNumber" value="${bookNumber}" >
				</div>
				<h5>身份证号码：</h5>
				<div class="mui-input-row">
					<input class="mui-input-group" type="text" name="idNumber" id="idNumber" value="${idNumber}" >
				</div>
				<c:if test="${typePath eq 'jdcBookUI'}">    
					<h5>号牌号码：</h5>
					<div class="mui-input-row">
						<input class="mui-input-group" type="text" name="plantNumbers" id="plantNumbers" value="${plantNumbers}" >
					</div>
				</c:if>
				<div class="i-button-box">
					<button type="submit" class="mui-btn i-btn-bule" id="nextBtn">查  询</button>
				</div>
			 </form>
			</div>
			
			 <!-- 设置当前时间，用于下面比较，可以共用 -->
            <c:set var="nowDate"><fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd " type="date"/></c:set> 
			
			<ul id="box" class="mui-table-view mui-table-view-striped mui-table-view-condensed">
				<c:forEach items="${qcInfos}" var="item" varStatus="status">
		        <li class="mui-table-view-cell">
		            <div class="mui-table">
		                <div class="mui-table-cell mui-col-xs-10">
		                    <p class="mui-ellipsis">预约号码:${item.bookNumber}</p>
		                    <p>姓名：${item.name}</p>
		                    <p>证件号：${item.idNumber}</p>
		                    <p>联系电话：${item.mobile}</p>
		                    <p>预约时间：${item.appointmentDate} ${item.appointmentTime}</p>
		                    <p>预约单位：${item.organization.name}</p>
		                    <c:choose>
			            		<c:when test="${typePath eq 'jdcBookUI'}">
					          	 <p>号牌号码${item.platNumber}</p>
					          	 <p>车牌种类${item.carType.name}</p>
				          		</c:when>
				          		<c:when test="${typePath eq 'jszBookUI'}"></c:when>
				          		<c:otherwise>
				          		  <p>号牌号码${item.platNumber}</p>
				          	 	  <p>迁出地${item.province} ${item.city}</p>
				          	 	  <p>号牌种类${item.accepter}</p><!-- car name  -->
				          		</c:otherwise>
				          	</c:choose>
		                </div>
		                <div class="mui-table-cell mui-col-xs-3 mui-text-right">
		                    <p class="mui-h6">${item.bookState.description}</p>
		                    
		                    <c:if test="${item.bookState.index eq 1 && item.appointmentDate >= nowDate}">
			          			<c:choose>
				          		<c:when test="${typePath eq 'jdcBookUI' || typePath eq 'jszBookUI'}">
				          			<a class="mui-h6 i-a-cancel" href="${ctx}/front/welcome!cancel.action?cancel.idNumber=${item.idNumber}&cancel.bookNumber=${item.bookNumber}&cancel.mobile=${item.mobile}&cancel.bookerMobile=${bookerMobile}&smsCode=${smsCode}&typePath=${typePath}&code=${code}';">撤销</a>
				          		</c:when>
				          		<c:otherwise>
				          			<a class="mui-h6 i-a-cancel" href="${ctx}/front/welcome!cancel.action?cancel.platNumber=${item.platNumber}&cancel.idNumber=${item.idNumber}&cancel.bookNumber=${item.bookNumber}&cancel.mobile=${item.mobile}&cancel.bookerMobile=${bookerMobile}&smsCode=${smsCode}&typePath=${typePath}&code=${code}';">撤销</a>
				          		</c:otherwise>
				          		</c:choose>
				          	</c:if>
		                </div>
		            </div>
		        </li>
		        </c:forEach>
		      </ul>
  		</div>
	</body>
</html>
	<script type='text/javascript' src='${ctx}/js/app/mui.min.js'></script>
	<script type='text/javascript' src='${ctx}/js/pages/front/include.js?{ctx:"${ctx}",jsfileversion:"2.0"}'></script>
	<script type="text/javascript">
	$(function() {
		$('html, body').animate({scrollTop: $('#box').offset().top-50}, 500)
		if ($("#errorMess").text() != null && $.trim($("#errorMess").text()) != "") {
			$.dialog( {time : 3,content : $("#errorMess").text(),icon : 'error',yesFn: true});
		}
	});
</script>