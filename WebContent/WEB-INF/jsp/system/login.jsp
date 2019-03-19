<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/source/base/taglibs.jsp"%>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>${systemName}</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link href="${_ctx}/source/css/bootstrap.min.css" rel="stylesheet">
    <link href="${_ctx}/source/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${_ctx}/source/css/animate.css" rel="stylesheet">
    <link href="${_ctx}/source/css/style.css" rel="stylesheet">
    <link href="${_ctx}/source/css/login.css" rel="stylesheet">
    
    <!-- jQuery  -->
    <script src="${_ctx}/source/js/jquery.min.js?v=2.1.4"></script>
    <script src="${_ctx}/source/js/bootstrap.min.js?v=3.3.6"></script>
    
    <!-- jQuery Validation plugin javascript-->
    <script src="${_ctx}/source/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${_ctx}/source/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${_ctx}/source/js/plugins/validate/form-validate-demo.js"></script>
    
     <script src="${_ctx}/source/js/plugins/tips/jquery.tips.js"></script>
    
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>[ H+ ]</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎使用 <strong>${systemName}</strong></h4>
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post" id="loginFrom" action="/123123" >
                    <h4 class="no-margins">登录：</h4>                    
                     <div class="form-group">
                             <input type="text" class="form-control uname" name="username" id="username" placeholder="用户名" />
                     </div>
                    
                     <div class="form-group">
                             <input type="password" class="form-control pword m-b" name="password" id="password" placeholder="密码" />
                     </div>
                     
                      <div class="form-group">
                            <input type="text" class="form-control code" name="code" id="code" placeholder="验证码" />
                     </div>
                      <div class="form-group">
                            <img id="codeImg" alt="点击更换" title="点击更换" />
                            <label class="label" >点击图片更换验证码</label>
                     </div>
                     
                     <button  class="btn btn-success btn-block " type="button"  id="loginBtn">登录</button>
                </form> 
                
                
                
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2018 All Rights Reserved. H+
            </div>
        </div>
    </div>
</body>
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
        
        //客户端校验
        $().ready(function () {
        	changeCode();
        	$("#codeImg").bind("click", changeCode);
     
        });
        
        //客户端校验
        function check(){
        	var icon = "<i class='fa fa-times-circle'></i> ";
             return  $("#loginFrom").validate({
                rules: {
                    username: {
                        required: true,
                        minlength: 2
                    },
                    password: {
                        required: true,
                        minlength: 6
                    }
                   
                },
                messages: {
                    username: {
                        required: icon + "请输入您的用户名",
                        minlength: icon + "用户名必须两个字符以上"
                    },
                    password: {
                        required: icon + "请输入您的密码",
                        minlength: icon + "密码必须6个字符以上"
                    }
                }
            }).form();
        
        }
        
        
        $("#loginBtn").click(function(){
        	
        	if(check()){
        		var username = $("#username").val();
    			var password = $("#password").val();
    			var code=$("#code").val();
    			$.ajax({
    				type: "POST",
    				url: '${_ctx}/loginAction/login',
    		    	data: {"username":username,"password":password,"code":code,tm:new Date().getTime()},
    				dataType:'json',
    				cache: false,
    				async:false,
    				success: function(data){
    					if(data.dataMap.status == "success"){
    						//登陆成功
    						window.location.href="${_ctx}/loginAction/toLogin";
    					}else if(data.dataMap.status == "userNoFoundError"){
    						//没有找到该用户
    						$("#username").tips({
    							side : 1,
    							msg : '没有找到该用户',
    							bg : '#eb2e34',
    							time : 2
    						});
    					
    					}else if(data.dataMap.status == "passwordError"){
    						//密码错误
    						$("#password").tips({
    							side : 1,
    							msg : '密码错误',
    							bg : '#eb2e34',
    							time : 2
    						});
    						
    					}else if("codeError" == data.dataMap.status){
    						//验证码错误
    						$("#code").tips({
    							side : 1,
    							msg : '验证码错误',
    							bg : '#eb2e34',
    							time : 2
    						});
    						
    					}else{
    						//验证码错误
    						$("#username").tips({
    							side : 1,
    							msg : '登陆失败',
    							bg : '#eb2e34',
    							time : 2
    						});
    						
    					}
    				}
    			}); 
        		
        	}
        	
        });
        
        //验证码
       	function changeCode(){
			$("#codeImg").attr("src", "${_ctx}/secCodeAction/code.action?r="+Math.random());
		}
        
        
    </script>
</html>