<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员中心</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<link rel="stylesheet" href="${_ctx}/source/wx/lib/weui.min.css">
<link rel="stylesheet" href="${_ctx}/source/wx/css/jquery-weui.css">
<link rel="stylesheet" href="${_ctx}/source/wx/css/style.css">
</head>
<body ontouchstart>
<!--主体-->
<div class='weui-content'>
 <!-- <div class="wy-center-top">
    <div class="weui-media-box weui-media-box_appmsg">
      <div class="weui-media-box__hd"><img class="weui-media-box__thumb radius" src="${_ctx}/source/wx/upload/headimg.jpg" alt=""></div>
      <div class="weui-media-box__bd">
        <h4 class="weui-media-box__title user-name">飞翔的小土豆</h4>
        <p class="user-grade">等级：普通会员</p>
        <p class="user-integral">待返还金额：<em class="num">500.0</em>元</p>
      </div>
    </div>
    <div class="xx-menu weui-flex">
      <div class="weui-flex__item"><div class="xx-menu-list"><em>987</em><p>账户余额</p></div></div>
      <div class="weui-flex__item"><div class="xx-menu-list"><em>459</em><p>我的蓝豆</p></div></div>
      <div class="weui-flex__item"><div class="xx-menu-list"><em>4</em><p>收藏商品</p></div></div>
    </div>
  </div>-->
  <div class="weui-panel weui-panel_access">
    <div class="weui-panel__hd">
      <a href="${_ctx}/orderAction/toAllOrder" class="weui-cell weui-cell_access center-alloder">
        <div class="weui-cell__bd wy-cell">
          <div class="weui-cell__hd"><img src="${_ctx}/source/wx/images/center-icon-order-all.png" alt="" class="center-list-icon"></div>
          <div class="weui-cell__bd weui-cell_primary"><p class="center-list-txt">全部订单</p></div>
        </div>
        <span class="weui-cell__ft"></span>
      </a>   
    </div>
  </div>
  
  <div class="weui-panel weui-panel_access">
    <div class="weui-panel__hd">
      <a href="myburse.html" class="weui-cell weui-cell_access center-alloder">
        <div class="weui-cell__bd wy-cell">
          <div class="weui-cell__hd"><img src="${_ctx}/source/wx/images/center-icon-jk.png" alt="" class="center-list-icon"></div>
          <div class="weui-cell__bd weui-cell_primary"><p class="center-list-txt">我的小金库</p></div>
        </div>
        <span class="weui-cell__ft"></span>
      </a>   
    </div>
    <div class="weui-panel__bd">
      <div class="weui-flex">
        <div class="weui-flex__item">
          <a href="${_ctx}/userAction/toMyburse" class="center-ordersModule">
            <div class="center-money"><em>${user.money/100}</em></div>
            <div class="name">账户总额</div>
          </a>
        </div>
      </div>
    </div>
  </div>
  
  
  <div class="weui-panel">
        <div class="weui-panel__bd">
          <div class="weui-media-box weui-media-box_small-appmsg">
            <div class="weui-cells">
              <a class="weui-cell weui-cell_access" href="${_ctx}/userAction/toResetPassword">
                <div class="weui-cell__hd"><img src="${_ctx}/source/wx/images/center-icon-dlmm.png" alt="" class="center-list-icon"></div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">密码修改</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
              <a class="weui-cell weui-cell_access" href="${_ctx}/wxLoginAction/logout">
                <div class="weui-cell__hd"><img src="${_ctx}/source/wx/images/center-icon-out.png" alt="" class="center-list-icon"></div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">退出账号</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
            </div>
          </div>
        </div>
      </div>
  
  
  
</div>

<!--底部导航-->
<div class="foot-black"></div>
  <!--底部导航-->
<%@ include file="/source/base/button.jsp"%>

<script src="${_ctx}/source/wx/lib/jquery-2.1.4.js"></script> 
<script src="${_ctx}/source/wx/lib/fastclick.js"></script> 
<script>
  $(function() {
    FastClick.attach(document.body);
    if(sessionStorage.getItem("length")){
    	$(".weui-badge").text(sessionStorage.getItem("length"));
    }else{
    	$(".weui-badge").text(0);
    }
	
    $(".weui-tabbar__item").removeClass("weui-bar__item--on");
    $(".myMain").addClass("weui-bar__item--on");
  });
</script> 
<script src="${_ctx}/source/wx/js/jquery-weui.js"></script>
</body>
</html>