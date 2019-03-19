<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>订单详情</title>
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
  <div class="wy-header-title">订单详情</div>
</header>
<div class="weui-content">
  <div class="wy-media-box weui-media-box_text foodModel">
 
  </div>
  <div class="weui-panel">
    <div class="weui-panel__bd">
    </div>
  </div>
  
  <div class="weui-cells weui-cells_form wy-address-edit">
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">座位号</label></div>
      <div class="weui-cell__bd"><input class="weui-input zwh" type="text"   placeholder="座位号"></div>
    </div>
    <div class="weui-cell">
      <div class="weui-cell__hd"><label class="weui-label wy-lab">备注</label></div>
      <div class="weui-cell__bd"><input class="weui-input bj" type="text"  placeholder="备注"></div>
    </div>
  
  
  <div class="wy-media-box weui-media-box_text">
    <div class="mg10-0 t-c">总金额：<span class="wy-pro-pri mg-tb-5">¥<em class="num font-20 sumMoney"></em></span></div>
    <div class="mg10-0"><a href="javascript:void(0)" class="weui-btn weui-btn_primary">付款</a></div>
  </div>
</div>


<div id="model" style="display: none;">
	<div class="weui-media-box__bd foodData">
     <div class="weui-media-box_appmsg ord-pro-list">
        <div class="weui-media-box__hd">
        	<a href="javascript:void(0)">
        	<img class="weui-media-box__thumb" src="" alt="" foodImg></a>
        </div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc">
          	<a href="pro_info.html" class="ord-pro-link" foodName></a>
          </h1>
          <div class="clear mg-t-10">
            <div class="wy-pro-pri fl">¥<em class="num font-15" foodPrice></em></div>
            <div class="pro-amount fr"><div id="spinner-amount" class="Spinner" foodLength></div></div>
          </div>
        </div>
      </div>
    </div>
</div>

<script src="${_ctx}/source/wx/lib/jquery-2.1.4.js"></script> 
<script src="${_ctx}/source/wx/lib/fastclick.js"></script> 
<script type="text/javascript" src="${_ctx}/source/wx/js/jquery.Spinner.js"></script>
<script src="${_ctx}/source/wx/js/jquery-weui.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
  });
</script>
<script type="text/javascript">
var sumMoney = 0;
var foodIds = JSON.parse(sessionStorage.getItem("foodIds"));
var ids="";
var lengths="";
$(function(){
/* 	$(".Spinner").Spinner({value:1, len:3, max:999}); */
for(var i=0;i<foodIds.length;i++){
	var foodId =  foodIds[i];
 	var food = JSON.parse(sessionStorage.getItem(foodId));
 	var foodData = $("#model").find(".foodData").clone();
	foodData.find("[foodName]").text(food.food_menu_foodname);
    foodData.find("[foodImg]").attr("src",food.food_menu_foodpic);
    foodData.find("[storeName]").text(food.store_name);
    foodData.find("[foodPrice]").text((parseInt(food.food_menu_foodprice)/100).toFixed(2));
    var price =(parseInt(food.food_menu_foodprice)/100).toFixed(2);
    
    var p = parseInt(food.food_menu_foodprice);
    var l = parseInt(food.length);
    sumMoney+= ((l*p)/100);
    var foodId =food.food_menu_id;
    foodData.find("[foodLength]").text("数量："+food.length);
 	$(".foodModel").append(foodData);
	if(i!=0){
		ids+=","+foodId;
		lengths+=","+l;
	}else{
		ids+=foodId
		lengths+=l;
	}	
}

 $(".sumMoney").text(sumMoney);
 
});


$(".weui-btn_primary").click(function(){
	var zwh =$(".zwh").val();
	var bj =$(".bj").val();
	if(zwh==""){
		$.alert("请填写座位号");
		return ;
	}
	var uwer_money = (parseInt('${user.money}'))/100; 
	if(uwer_money<sumMoney){
		$.alert("余额不足");
		return ;
	}else{
		$.ajax({
  			url:"${_ctx}/orderAction/saveOrder",
  			type:"post",
  			async:false,
  			data:{"lengths":lengths,"ids":ids,"user_id":'${user.user_id}',"zwh":zwh,"bj":bj},
  			success:function(data){
  				$.alert("支付成功");
  				sessionStorage.clear() ;
  				window.location.href="${_ctx}/orderAction/toAllOrder";
  			}
  	    });
		
	}
})

 $(".wy-header-icon-back").click(function(){
		window.location.href="${_ctx}/wxFoodAction/toShowCart";	
  })
</script>



</body>
</html>