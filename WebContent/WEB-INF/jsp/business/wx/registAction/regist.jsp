<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>手机注册</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
<link rel="stylesheet" href="${_ctx}/source/wx/lib/weui.min.css">
<link rel="stylesheet" href="${_ctx}/source/wx/css/jquery-weui.css">
<link rel="stylesheet" href="${_ctx}/source/wx/css/style.css">
</head>
<body ontouchstart>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">手机注册</div>
</header>
<div class="weui-content">
  <div class="weui-cells weui-cells_form wy-address-edit">
    <div class="weui-cell weui-cell_vcode">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">手机号</label></div>
      <div class="weui-cell__bd"><input class="weui-input" id="tel" type="tel" placeholder="请输入手机号"></div>
      <div class="weui-cell__ft"><button class="weui-vcode-btn sendCode">获取验证码</button></div>
    </div>
    <div class="weui-cell ">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">验证码</label></div>
      <div class="weui-cell__bd"><input class="weui-input" id="code" type="number" placeholder="请输入验证码"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">设置密码</label></div>
      <div class="weui-cell__bd"><input class="weui-input" id="pwd" type="password" pattern="[0-9]*" placeholder="请输入新密码"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">确认密码</label></div>
      <div class="weui-cell__bd"><input class="weui-input" id="repwd" type="password" pattern="[0-9]*" placeholder="请再次输入新密码"></div>
    </div>
  </div>
  <div class="weui-btn-area"><a href="javascript:void(0);"  class="weui-btn weui-btn_warn saveBtn"> 注册并登陆</a></div>
  <div class="weui-cells__tips t-c font-12">登陆账号为您输入的手机号码</div>
  
</div>

<script src="${_ctx}/source/wx/lib/jquery-2.1.4.js"></script> 
<script src="${_ctx}/source/wx/lib/fastclick.js"></script> 
<script type="text/javascript" src="${_ctx}/soure/wx/js/jquery.Spinner.js"></script>
<script>
  $(function() {
   	 FastClick.attach(document.body);
  });
  
  	$(".sendCode").click(function(){
  		var tel=$("#tel").val();
  		if(!checkTel(tel)){
  			return ;
  		}
  		$.ajax({
  			url:"${_ctx}/wxLoginAction/sendCode",
  			type:"post",
  			async:false,
  			data:{"tel":tel},
  			success:function(data){}
  	    });
  		
  	})
	function hasTelPwdRepwd(tel,pwd,repwd,code){
 	    var flag = false;
 	    if(!checkTel(tel)){
 	    	return true;
 	    }
 	    
	  	if(pwd == null || pwd == ''){
 	  	    $.alert("请输入密码!");
	  	    return flag;
	  	}
	  	
		if(pwd.length<6 ||  pwd.length>18){
			$.alert("密码位数必须在6~18位之间!");
	  	    return flag;
	  	}
		
	  	if(repwd == null || repwd == ''){
	  		$.alert("请输入确认密码!");
	  	    return flag;
	  	}
	  	if(pwd != repwd){
 	  	    $.alert("两次输入密码不一致!");
	  	    return flag;
	  	}
	  	if(code == null || code == ''){
	  		 $.alert("验证码不能为空!");
	  	}
	  	
	  	return true;
	}
  	
  	function checkTel(tel){
  		 //校验手机号
	  	 if(tel == null || tel == ''){
	  		 $.alert("请输入手机号!");
	  	     return false;
	  	 }else{
	  	     var telreg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
	  	     if(!telreg.test(tel)){
	  	    	 $.alert("手机号格式不正确!");
	  		 	return false;
	  	     }else{
	  		 	if(hasTel(tel)){
	  		 		 $.alert("手机号已存在!");
	  		 	    return false;
	  		 	}
	  	     }
	  	 }
	  	return true;
  	}
  	
  	
  	
	function hasTel(tel){
		 var flag =false;
		$.ajax({
  			url:"${_ctx}/wxLoginAction/hasTel",
  			type:"post",
  			async:false,
  			data:{"tel":tel},
  			success:function(data){
  				flag = data.dataMap.flag;
  			}
  	    });
		
		return flag;
  	}
	
	
	
	$(".saveBtn").click(function(){
  		var tel=$("#tel").val();
		var code=$("#code").val();
		var pwd=$("#pwd").val();
		var repwd=$("#repwd").val();
		
		if(hasTelPwdRepwd(tel,pwd,repwd,code)){
			$.ajax({
	  			url:"${_ctx}/registAction/regist",
	  			type:"post",
	  			async:false,
	  			data:{"tel":tel,"pwd":pwd,"code":code},
	  			success:function(data){
	  				if(data.dataMap.status=="success"){
	  					window.location.href="${_ctx}/wxLoginAction/toLogin"
	  				}else if(data.dataMap.status=="codeError"){
	  					$.alert("验证码错误");
	  				}
	  			}
	  	    });
		}
		
	})
</script>

<script src="${_ctx}/source/wx/js/jquery-weui.js"></script>
</body>
</html>