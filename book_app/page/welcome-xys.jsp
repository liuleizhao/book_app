<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>车驾管网上预约协议书</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${ctx}/css/app/app.css" rel="stylesheet"type="text/css" />
		<link href="${ctx}/css/app/mui.min.css" rel="stylesheet"type="text/css" />
	</head>
	<body>
		<header  class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">网上预约协议书</h1>
		</header>
		<div class="mui-content">
			<div class="mui-content-padded">
		      <table width="96%" border="0" align="center" cellpadding="2" cellspacing="10">
		        <tr>
		          <td>
		          	<h5>一、请如实录入个人信息，否则不予受理。</h5>
		            <h5> 二、申请人凭本人身份证明，每天限预约2次（机动车、驾驶证业务各1次）。 </h5>
		            <h5> 三、在选择预约日期和时段时，如系统未能显示，表示该时间段预约已满。 </h5>
		            <h5> 四、非因车管所原因，申请人未在预约时间到预约地点提交规定的申请材料的，视为失约。 </h5>
		            <h5> 五、如需撤销预约，须至少提前半个工作日在网站预约申请页面进行撤销，否则视为失约。 </h5>
		            <h5> 六、预约失约累计达到2次及以上，手机号将记入预约黑名单库。 </h5>
		            <h5><font color="red">七、预约时间段分为上午、下午,请在预约时间段内前来办理,未在预约时间段前来造成无法受理的由本人承担责任。</font></h5>
		          </td>
		        </tr>
		      </table>
				<div class="i-button-box">
					<c:choose>
		          	  	<c:when test="${code == 'JD39' }">
		          	  		<input type="button" class="mui-btn i-btn-bule" onclick="window.location.href = '${ctx}/front/welcome!selfCheckUI.action?typePath=${typePath}&code=${code}'" name="Submit" value="我接受（下一步）" class="anni01"/>
		          	  	</c:when>
		          	  	<c:otherwise>
		          	  		<input type="button" class="mui-btn i-btn-bule" onclick="window.location.href = '${ctx}/front/welcome!${typePath}.action?typePath=${typePath}&code=${code}'" name="Submit" value="我接受（下一步）" class="anni01"/>
		          	  	</c:otherwise>
		          	 </c:choose>
				</div>	
			</div>
		</div>
	</body>
</html>
