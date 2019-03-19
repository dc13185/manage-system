<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>

<!DOCTYPE html ">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>余额充值</title>
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
  <div class="wy-header-title">余额充值</div>
</header>
<div class="weui-content">
  <div class="weui-cells weui-cells_form">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label">充值金额</label></div>
      <div class="weui-cell__bd"><input class="weui-input" type="number" placeholder="请输入金额"></div>
    </div>
  </div>
  <div class="weui-btn-area">
    <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips">微信支付</a>
  </div>
  
</div>

<script src="${_ctx}/source/wx/lib/jquery-2.1.4.js"></script> 
<script src="${_ctx}/source/wx/lib/fastclick.js"></script> 
<script type="text/javascript" src="${_ctx}/source/wx/js/jquery.Spinner.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
  });
  
  
  $("#showTooltips").click(function(){
	  var moeny=   $(".weui-input").val();
	  if(moeny=="" || moeny<=0){
		  $.alert("请输入合法金额");
	  }
	  
		$.ajax({
  			url:"${_ctx}/userAction/recharge",
  			type:"post",
  			async:false,
  			data:{"moeny":moeny},
  			success:function(data){
  				
  				
  			}
  	    });
	   
	  
  })
  
  
$(".weui-btn_primary").click(function(){
	window.location.href="${_ctx}/userAction/toMine";	
})
</script>

<script src="${_ctx}/source/wx/js/jquery-weui.js"></script>
</body>
</html>