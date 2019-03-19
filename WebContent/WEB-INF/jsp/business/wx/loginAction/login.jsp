<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>登陆</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
<link rel="stylesheet" href="${_ctx}/source/wx/lib/weui.min.css">
<link rel="stylesheet" href="${_ctx}/source/wx/css/jquery-weui.css">
<link rel="stylesheet" href="${_ctx}/source/wx/css/style.css">
</head>
<body ontouchstart style="background:#323542;">
<!--主体-->
<div class="login-box">
  	<div class="lg-title">欢迎登陆智慧食堂</div>
    <div class="login-form">
    	<form action="#">
        	<div class="login-user-name common-div">
            	<span class="eamil-icon common-icon">
                	<img src="${_ctx}/source/wx/images/eamil.png" />
                </span>
                <input type="number" id="tel" name="username" value="" placeholder="请输入您的手机号" />        
            </div>
            <div class="login-user-pasw common-div">
            	<span class="pasw-icon common-icon">
                	<img src="${_ctx}/source/wx/images/password.png" />
                </span>
                <input type="password" id="password" name="password" value="" placeholder="请输入您的密码" />        
            </div>
            <a href="javascript:;" class="login-btn common-div">登陆</a>
        </form>
    </div>
    <div class="forgets">
    	<a href="${_ctx}/userAction/toResetPassword">忘记密码？</a>
        <a href="${_ctx}/registAction/toRegist">免费注册</a>
    </div>
</div>
<script src="${_ctx}/source/wx/lib/jquery-2.1.4.js"></script> 
<script src="${_ctx}/source/wx/lib/fastclick.js"></script> 
<script type="text/javascript" src="${_ctx}/source/wx/js/jquery.Spinner.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
  });
  
  $(".login-btn").click(function(){
	 var tel = $("#tel").val();
	 var password = $("#password").val(); 
	 if(hasTelPwdRepwd(tel,password)){
			$.ajax({
	  			url:"${_ctx}/wxLoginAction/login",
	  			type:"post",
	  			async:false,
	  			data:{"tel":tel,"password":password},
	  			success:function(data){
	  			 var   status = data.dataMap.status;
	  			   if(status == 'success'){
	  				 window.location.href="${_ctx}/wxLoginAction/toLogin"
	  			   }else{
	  				 $.alert("密码错误");
	  			   }
	  			}
	  	    });
	 }
	  
  })
  
function hasTelPwdRepwd(tel,pwd){
 	    var flag = false;
 	    
 	   if(tel == null || tel == ''){
	  		 $.alert("请输入手机号!");
	  	     return false;
	  	 }else{
	  	     var telreg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
	  	     if(!telreg.test(tel)){
	  	    	 $.alert("手机号格式不正确!");
	  		 	return false;
	  	     }else{
	  		 	if(!hasTel(tel)){
	  		 		 $.alert("手机号不存在!");
	  		 	    return false;
	  		 	}
	  	     }
	  	 }
 	    
	  	if(pwd == null || pwd == ''){
 	  	    $.alert("请输入密码!");
	  	    return flag;
	  	}
	  	
		if(pwd.length<6 ||  pwd.length>18){
			$.alert("密码位数必须在6~18位之间!");
	  	    return flag;
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
  
</script>

<script src="${_ctx}/source/wx/js/jquery-weui.js"></script>

</body>
</html>