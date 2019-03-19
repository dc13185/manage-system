<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>购物车</title>
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
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">购物车</div>
</header>
<div class="weui-content modelFill">
 
</div>
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu" style="bottom: 48px !important;">
  <div class="npd cart-foot-check-item weui-cells_checkbox allselect">
    <label class="weui-cell allsec-well weui-check__label" for="all">
        <div class="weui-cell__hd">
          <input type="checkbox" class="weui-check all-select" name="all-sec" id="all" >
          <i class="weui-icon-checked"></i>
        </div>
        <div class="weui-cell__bd">
          <p class="font-14">全选</p>
        </div>
    </label>
  </div>
  <div class="weui-tabbar__item  npd">
    <p class="cart-total-txt">合计：<i>￥</i><em class="num font-16" id="zong1">0</em></p>
  </div>
  <a href="javascript:void(0)" class="red-color npd w-90 t-c jsButton">
    <p class="promotion-foot-menu-label ">去结算</p>
  </a>
</div>
  <!--底部导航-->
 <%@ include file="/source/base/button.jsp"%> 

<div id="model" style="display: none">
 <div class="weui-panel weui-panel_access foodData">
    <div class="weui-panel__hd"><span storeName>江苏蓝之蓝旗舰店</span></div>
    <div class="weui-panel__bd">
      <div class="weui-media-box_appmsg pd-10">
        <div class="weui-media-box__hd check-w weui-cells_checkbox">
          <label class="weui-check__label" >
            <div class="weui-cell__hd cat-check">
	             <input type="checkbox" class="weui-check" name="cartpro" xzCheck   > 
	             <i class="weui-icon-checked"></i>
             </div>
          </label>
        </div>
        <div class="weui-media-box__hd"><a href="javascript:void(0)"><img class="weui-media-box__thumb" src="" alt="" foodImg></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="javascript:void(0)" class="ord-pro-link" foodName></a></h1>
          <div class="clear mg-t-10">
            <div class="wy-pro-pri fl">¥<em class="num font-15" foodPrice></em></div>
            <div class="pro-amount fr"><div class="Spinner" foodLength></div></div>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>

<script src="${_ctx}/source/wx/lib/jquery-2.1.4.js"></script> 
<script src="${_ctx}/source/wx/lib/fastclick.js"></script> 
<script type="text/javascript" src="${_ctx}/source/wx/js/jquery.Spinner.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
    if(sessionStorage.getItem("length")){
    	$(".weui-badge").text(sessionStorage.getItem("length"));
    }else{
    	$(".weui-badge").text(0);
    }
  });
</script>
<script type="text/javascript">
$(function(){
	/* $(".Spinner").Spinner({value:1, len:3, max:999}); */
	
    $(".weui-tabbar__item").removeClass("weui-bar__item--on");
    $(".shopCart").addClass("weui-bar__item--on");
});
</script>
<script src="${_ctx}/source/wx/js/jquery-weui.js"></script>
<!---全选按钮-->

<script type="text/javascript">
var sumMoney =0;
var foodIds = new Array();
$(document).ready(function () {
	for(var i=0; i<sessionStorage.length; i++){
		  var key = sessionStorage.key(i);
		  if(key=="length" || key=="foodIds"){
			 return ;  
		  }else{
			  var foodList = JSON.parse(sessionStorage.getItem(sessionStorage.key(i)));
		      var foodData= $("#model").find(".foodData").clone();
		      foodData.find("[foodName]").text(foodList.food_menu_foodname);
		      foodData.find("[foodImg]").attr("src",foodList.food_menu_foodpic);
		      foodData.find("[storeName]").text(foodList.store_name);
		      foodData.find("[foodPrice]").text((parseInt(foodList.food_menu_foodprice)/100).toFixed(2));
		      var price =(parseInt(foodList.food_menu_foodprice)/100).toFixed(2);
		      var foodId =foodList.food_menu_id;
		      foodData.find("[foodLength]").text("数量："+foodList.length);
		      foodData.find("[xzCheck]").attr("id",key);
		      foodData.find("[xzCheck]").attr("onClick","addOrders('"+sessionStorage.key(i)+"')");
		  /*     foodData.find("[xzCheck]").click(function(){
		    	  var flge = $(this)[0].checked;
		    	  if(flge == true){
		    		  sumMoney+=parseInt(price);
		    		  foodIds.push(foodId);
		    	  }else{
		    		  sumMoney-=parseInt(price);
		    		  foodIds.splice(foodIds.indexOf(foodId), 1);
		    	  }
		    	  $("#zong1").text(sumMoney.toFixed(2));
		      }) */
		      
		      $(".modelFill").append(foodData);
			  
		  }
	      
	} 
	
	

	
	
	
});

$(".all-select").click(function () {
	var isAll =  $(".all-select")[0].checked;
	if(isAll){
		$("[xzCheck]").prop("checked",true);
		sumMoney=0;
		foodIds=new Array();
		for(var i=0; i<sessionStorage.length; i++){
			if(sessionStorage.key(i)=="length" || sessionStorage.key(i)=="foodIds"){
				 continue ;  
			 }
			var foodList = JSON.parse(sessionStorage.getItem(sessionStorage.key(i)));
			foodIds.push(foodList.food_menu_id);
			var l=parseInt(foodList.length);
			var p=parseInt(foodList.food_menu_foodprice);
			var price= ((l*p)/100).toFixed(2)
			sumMoney+=parseInt(price);
		}
	}else{
		$("[xzCheck]").prop("checked",false);
		sumMoney=0;
		foodIds=new Array();
	}
	 $("#zong1").text(sumMoney.toFixed(2));
});

function addOrders(key){
	var foodList = JSON.parse(sessionStorage.getItem(key));
	var flge = $("#"+key)[0].checked;
	var  foodId=foodList.food_menu_id;
	    var  p=parseInt(foodList.food_menu_foodprice);
	    var  l=parseInt(foodList.length);
	    if(flge == true){
		  sumMoney+=parseInt((p*l)/100);
		  foodIds.push(foodId);
	    }else{
		  sumMoney-=parseInt((p*l)/100);
	 	  foodIds.splice(foodIds.indexOf(foodId), 1);
	  }
	  $("#zong1").text(sumMoney.toFixed(2));
	
}


$(".jsButton").click(function(){
	sessionStorage.setItem("foodIds",JSON.stringify(foodIds));
	window.location.href = "${_ctx}/orderAction/toOrderList"
}) 

$(".wy-header-icon-back").click(function(){
	window.location.href="${_ctx}/wxLoginAction/toLogin";
})
</script>


</body>
</html>