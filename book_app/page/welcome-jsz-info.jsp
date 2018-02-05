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
		<link href="${ctx}/js/plugins/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header  class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<a class="mui-icon mui-icon-search mui-pull-right" name="yuyueQuery" id="yuyueQuery"></a>
			<h1 class="mui-title">${driveInfo.businessType.name}</h1>
		</header>
		<div class="mui-content">
			<div class="mui-content-padded">
				<form action="${ctx}/front/welcome!jszBookNext.action" method="post" id="appointForm">
					<input type="hidden" name="typePath" value="${typePath}"/>
					<input type="hidden" name="code" value="${code}"/>
					<input type="hidden" name="driveInfo.bookerMobile" id="bookerMobile"/>
					<input type="hidden" name="smsCode" id="smsCode">
					<input type="hidden" name="mobile" id="mobile"/>
					<span style="display: none;" id="jq_reorganizationId">${driveInfo.organization.id}</span>
					<span style="display: none;" id="jq_reappointmentDate">${driveInfo.appointmentDate}</span>
					<span style="display: none;" id="jq_reappointmentTime">${driveInfo.appointmentTime}</span>
					<s:hidden name="driveInfo.businessType.id"/>
					<h5>姓名：</h5>
					<div class="mui-input-row">
						<input name="driveInfo.name" id="jq_name" type="text" class="mui-input-group" value="llz">
					</div>
					<h5>证件类型：</h5>
					<div class="mui-input-row">
						<select id="jq_id_type_list" name="driveInfo.idType.id" class="i-select">
							<c:forEach items="${idTypes }" var="item">
								<option value="${item.id }">${item.name }</option>
							</c:forEach>
						</select>
					</div>
					
					<h5>证件号码：<span style="color: red;font-size: 10px;">温馨提示：香港人预约请使用香港身份证。</span></h5>
					<div class="mui-input-row">
						
						<input id="idNumber" name="driveInfo.idNumber" type="text" maxlength="18" oninput="value=value.toUpperCase()" class="mui-input-group" value="420117199404053611">
					</div>
					
					<h5>手机号码：</h5>
					<div class="mui-input-row">
						<input name="driveInfo.mobile" id="jq_mobile" type="number" oninput="if(value.length>11)value=value.slice(0,11)" class="mui-input-group" value="17087161090">
					</div>
					
					<div class="i-button-box">
						<button type="button" class="mui-btn i-btn-bule" id="nextBtn">下一步</button>
					</div>	
					<h5>${bt.description}</h5>
				</form>
			</div>
		</div>
		<script type='text/javascript' src='${ctx}/js/pages/front/include.js?{ctx:"${ctx}",jsfileversion:"2.0"}'></script>
		<script type='text/javascript' src='${ctx}/js/app/mui.min.js'></script>
		<script type="text/javascript">
			$(function(){
			//全角转成半角
			$('#idNumber').blur(function(){
				var idNumber= document.getElementById("idNumber").value;
				var result='';
				for(var i=0;i<idNumber.length;i++){
					if(idNumber.charCodeAt(i)>65248 && idNumber.charCodeAt(i)<65375){
						result +=String.fromCharCode(idNumber.charCodeAt(i)-65248);
					}else{
						result +=String.fromCharCode(idNumber.charCodeAt(i));
					}
				}
				document.getElementById("idNumber").value=result;
			});
			
			// 下一步 
			$('#nextBtn').click(function(){
				try{
					/**************************check start****************************/
					$(this).validate.isName($('#jq_name').val(), '姓名只能是由中文、英文、数字、括号组成且至少两个字符！');
					$(this).validate.isNull($('#idNumber').val(), '证件号码不能为空');
					var idName = $("#jq_id_type_list").find('option:selected').text(); 
					if(idName == '居民身份证'){$(this).validate.isCardFormat($('#idNumber').val(), '证件号格式不正确','身份证未满18周岁');}
					$(this).validate.isMobile($('#jq_mobile').val(), '手机号码手机格式不正确');
				}catch(e){
					$.dialog({time: 3,content: e,icon: 'error', yesFn: true});
					return;
				}
					/**************************check end****************************/
					//短信验证码，驾驶证全部使用短息验证
					var idTypeId = $("#jq_id_type_list").find('option:selected').val();
					var code=$('input[name=code]').val();
					var url = "${ctx}/front/sms!smsCheckUI.action?lx=1&idTypeId="+idTypeId+"&code="+code+"&bookerMobile="+$('#jq_mobile').val();
					$.dialog.open(url,{id:"sms",title:"短信验证",width:500,height:200,noFn:true,lock:true,drag:false,yesFn:function(){
						//手机号码
						var tel = this.iframe.contentWindow.$("#tel").val();
						//用户输入的短信验证码
						var telCheckCode = $.trim(this.iframe.contentWindow.$("#tel_check_code").val());
						if(telCheckCode ==''){
							$.dialog({time: 3, content: '请输入短信验证码',icon: 'error', yesFn: true});
							return false;
						}
						//发送请求，后台验证短信验证码
						$.get("${ctx}/front/sms!checkSmsCode.action",{tel:tel,telCheckCode:telCheckCode},function(data){
							if(data.status == "success"){
								if(data.code != 5){
									d.iframe.contentWindow.$("#tel_check_code").attr("value","");
									//短信验证码验证失败
									$.dialog({time: 3,content: data.msg,icon:'error',yesFn: true});
								}else{
									//短信验证码验证通过，继续预约
									setBookerMobile(tel);
									$(this).validate.submin_form();
								}
							}
						},"json");
						return false;
					}});
			});
		
		$("#yuyueQuery").click(function() {
			try{
				var url = "${ctx}/front/sms!smsNoCheckUI.action?bookerMobile="+$('#jq_mobile').val();
				$.dialog.open(url,{id:"sms",title:"短信验证",width:500,height:200,noFn:true,lock:true,drag:false,yesFn:function(){
					//手机号码
					var tel = this.iframe.contentWindow.$("#tel").val();
					//用户输入的短信验证码
					var telCheckCode = $.trim(this.iframe.contentWindow.$("#tel_check_code").val());
					if(telCheckCode ==''){
						$.dialog({time: 3,content: '请输入短信验证码',icon: 'error',yesFn: true});
						return false;
					}
					//发送请求，后台验证短信验证码
					$.get("${ctx}/front/sms!checkSmsCode.action",{tel:tel,telCheckCode:telCheckCode},function(data){
						if(data.status == "success"){
							if(data.code != 5){
								d.iframe.contentWindow.$("#tel_check_code").attr("value","");
								//短信验证码验证失败
								$.dialog({time: 3,content: data.msg,icon: 'error',yesFn: true});
							}else{
								//短信验证码验证通过，继续查询
								$("#mobile").attr("value", tel);  
								$("#smsCode").attr("value", telCheckCode);  
								$("#appointForm").attr("action","${ctx}/front/welcome!queryYuyueUI.action");
								$("#appointForm").attr("method", "post");
								$("#appointForm").submit();
							}
						}
					},"json");
					return false;
					
				}});
			}catch(e){
				$.dialog({time: 3,content: e,icon: 'error',yesFn: true});
			}
		});
		
		function setBookerMobile(mobile){
			 $("#bookerMobile").attr("value", mobile);  
		}
		
	});
		</script>
	</body>
</html>