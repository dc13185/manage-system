<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>全部订单</title>
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
<header class="wy-header" style="position:fixed; top:0; left:0; right:0; z-index:200;">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">订单管理</div>
</header>
<div class='weui-content'>
  <div class="weui-tab">
    <div class="weui-navbar" style="position:fixed; top:44px; left:0; right:0; height:44px; background:#fff;">
      <a class="weui-navbar__item proinfo-tab-tit font-14 weui-bar__item--on allOrder" >全部</a>
     <!--  <a class="weui-navbar__item proinfo-tab-tit font-14" href="#tab2">待付款</a>
      <a class="weui-navbar__item proinfo-tab-tit font-14" href="#tab3">待发货</a>
      <a class="weui-navbar__item proinfo-tab-tit font-14" href="#tab4">待收货</a> -->
      <a class="weui-navbar__item proinfo-tab-tit font-14 noCommentOrder" >待评价</a>
    </div>
    <div class="weui-tab__bd proinfo-tab-con" style="padding-top:87px;">
        
    </div>
  </div>
</div>


<div id="model" style="display: none">
 
        <div class="weui-panel weui-panel_access">
          <div class="weui-panel__hd"><span orderId>单号：2132165457654545</span><span class="ord-status-txt-ts fr" status>交易成功</span></div>
          <div class="weui-media-box__bd  pd-10">
            <div class="weui-media-box_appmsg ord-pro-list">
              <div class="weui-media-box__hd"><a href="javasrcipt:void(0)"><img class="weui-media-box__thumb" foodImg src="" alt=""></a></div>
              <div class="weui-media-box__bd">
                <h1 class="weui-media-box__desc"><a href="javasrcipt:void(0)" class="ord-pro-link" food_name></a></h1>
                <div class="clear mg-t-10">
                  <div class="wy-pro-pri fl">¥<em class="num font-15" moeny>296.00</em></div>
                  <div class="pro-amount fr"><span class="font-13">数量×<em class="name" count>1</em></span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="ord-statistics">
            <span class="wy-pro-pri">总金额：¥<em class="num font-15" allMoeny>296.00</em></span>
          </div>
          <div class="weui-panel__ft">
            <div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox">
                <a href="javascript:void(0)" class="ords-btn-com" comment>评价</a>
            </div>    
          </div>
        </div>
</div>

<script src="${_ctx}/source/wx/lib/jquery-2.1.4.js"></script> 
<script src="${_ctx}/source/wx/lib/fastclick.js"></script> 
<script src="${_ctx}/source/wx/js/jquery-weui.js"></script>
<script>

$(function() {
    FastClick.attach(document.body);
	
    //先触发所有的
	$(".proinfo-tab-tit").removeClass("weui-bar__item--on")
	$(".allOrder").addClass("weui-bar__item--on");
	getOrderByStatus();
    
    $(".allOrder").click(function(){
    	$(".proinfo-tab-tit").removeClass("weui-bar__item--on")
    	$(".allOrder").addClass("weui-bar__item--on");
    	getOrderByStatus();
    })
    
      $(".noCommentOrder").click(function(){
    	$(".proinfo-tab-tit").removeClass("weui-bar__item--on")
    	$(".noCommentOrder").addClass("weui-bar__item--on");
    	getOrderByStatus("1");
    })
    
    
  });

function getOrderByStatus(status){
	$.ajax({
			url:"${_ctx}/orderAction/findOrdersByStatus",
			type:"post",
			async:true,
			data:{"status":status},
			success:function(data){
				var orders = data.dataMap.orders;
				
				if(orders.length>0){
					$(".weui-tab__bd").html("");
					for(var i=0;i<orders.length;i++){
						var model = $("#model").find(".weui-panel").clone();
						model.find("[orderId]").text("单号："+orders[i].order_id+"");
						model.find("[foodImg]").attr("src",orders[i].food_menu_foodpic);
						model.find("[moeny]").text((parseInt(orders[i].food_menu_foodprice)/100).toFixed(2));
						model.find("[count]").text(orders[i].count);
						model.find("[food_name]").text(orders[i].food_menu_foodname);
						model.find("[allMoeny]").text((parseInt(orders[i].all_money)/100).toFixed(2));
						if(orders[i].status=='1'){
							model.find("[comment]").attr("onClick","toComment('"+orders[i].food_menu_id+"','"+orders[i].order_id+"')"); 
						}else if(orders[i].status=='2'){
							model.find("[comment]").remove();
						}
						$(".weui-tab__bd").append(model)
						
					}
				}
				
			}
	    });
	
}

function toComment(food_id,order_id){
	window.location.href="${_ctx}/orderAction/toComment?food_id="+food_id+"&&order_id="+order_id+"";
}

$(".wy-header-icon-back").click(function(){
	window.location.href="${_ctx}/userAction/toMine";
})

</script>
</body>
</html>
