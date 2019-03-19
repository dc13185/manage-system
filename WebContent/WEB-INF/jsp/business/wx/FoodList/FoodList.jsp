<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>商城分类</title>
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
<!--顶部搜索-->
<!--主体-->
<div class="wy-content">
  <div class="category-top">
    <header class='weui-header'>
      <div style="height: 100px;">
					<div class="weui-panel weui-panel_access">
						<div class="weui-panel__bd">
							<div class="weui-media-box_appmsg pd-10">
								<div class="weui-media-box__hd">
									<img class="weui-media-box__thumb storeImg" src="" alt=""></a>
								</div>
								<div class="weui-media-box__bd">
									<h4 style="text-align: center;font-weight: bolder;" class="storeName"></h4>
									<div class="clear mg-t-10">
										<div class="pro-amount fr storeInf" style="float: left;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
    </header>
  </div>
  <aside>
    <div class="menu-left scrollbar-none" id="sidebar">
      <ul id="typeList">
      </ul>
    </div>
  </aside>
  <section class="menu-right padding-all j-content">
    <h5 class="TypeTitle">酒水食品</h5>
    <div id="modelFile"></div>
  </section>
  
  
  <!--底部导航-->
<%@ include file="/source/base/button.jsp"%>
</div>




<div id="foodModel" style="display: none">
	  <div class="weui-panel weui-panel_access foodBean">
	    <div class="weui-panel__bd">
	      <div class="weui-media-box_appmsg pd-10">
	        <div class="weui-media-box__hd check-w weui-cells_checkbox">
	        </div>
	        <div class="weui-media-box__hd">
	           <img class="weui-media-box__thumb foodImg"  alt="">
	        </div>
	        <div class="weui-media-box__bd">
	          <h1 class="weui-media-box__desc foodName" ></h1>
	          <div class="clear mg-t-10">
	            <div class="wy-pro-pri fl">¥<em class="num font-15 food_menu_foodprice"></em></div>
	            <div class="pro-amount fr"><div class="Spinner"><a class="Increase  addShopCar" style="margin-left: 50px;" href="javascript:void(0)"><i>+</i></a></div></div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>	
</div>
<script src="${_ctx}/source/wx/lib/jquery-2.1.4.js"></script> 
<script src="${_ctx}/source/wx/lib/fastclick.js"></script> 
<script>
  $(function() {
    FastClick.attach(document.body);
    var store =${store};
    $(".storeName").text(store.store_name);
    $(".storeInf").text(store.store_introduc);
    $(".storeImg").attr("src",store.store_image);
    
    $(".weui-tabbar__item").removeClass("weui-bar__item--on");
    $(".indexMain").addClass("weui-bar__item--on");
 
    
    var storeTypes = store.storeTypes;
    console.log(storeTypes);
    for (var i = 0; i < storeTypes.length; i++) {
    	var model = '<li class="storeType" id="'+i+'">'+storeTypes[i].storeType_name+'</li>';
		$("#typeList").append(model);
	}

    $(".storeType").click(function(){
    	$(".storeType").removeClass("active");
    	$(this).addClass("active");
    	$(".TypeTitle").text($(this).text());
    	
    	var i =parseInt($(this).attr("id"));
    	var foodList = storeTypes[i].foodMenus; 
    	
    	$("#modelFile").find(".foodBean").remove();
    	for (var i = 0; i < foodList.length; i++) {
    		var food_json = foodList[i];
    		food_json["store_id"]=store.store_id;
    		food_json["store_name"]=store.store_name;
    		var food_menu = JSON.stringify(food_json);  
    	
        	var model = $("#foodModel").find(".foodBean").clone();
        	model.find(".foodName").text(foodList[i].food_menu_foodname);
        	model.find(".foodImg").attr("src",foodList[i].food_menu_foodpic);
        	model.find(".foodImg").attr("onClick","toFoodDetails('"+foodList[i].food_menu_id+"')")
        	model.find(".food_menu_foodprice").text((parseInt(foodList[i].food_menu_foodprice)/100).toFixed(2));
            var foodId = foodList[i].food_menu_id;
        	model.find(".addShopCar").attr("onClick","addShopCart('"+foodId+"','"+food_menu+"')");
        	$("#modelFile").append(model);
    	}
        
    	
    })
	$('.storeType').eq(0).trigger("click");
  });
  
  
  function addShopCart(foodId,food_menu){
	     var food= sessionStorage.getItem(foodId);
	     if(!food){
	    	 food =  JSON.parse(food_menu);
	    	 food["length"] =1;
	    	 sessionStorage.setItem(foodId, JSON.stringify(food)); 
	     }else{
    	     food =JSON.parse(food);
	    	 food["length"] = parseInt(food.length)+1;  
	    	 sessionStorage.setItem(foodId, JSON.stringify(food));
	     }
	     
  	     var length= sessionStorage.getItem("length");
  	     if(!length){
  	    	sessionStorage.setItem("length",1);
  	     }else{
  	    	sessionStorage.setItem("length",parseInt(length)+1);
  	     }
		 $(".weui-badge").text(sessionStorage.getItem("length"));
  }
  
  
  function toFoodDetails(food_menu_id){
	  window.location.href="${_ctx}/wxFoodAction/toFoodDetails?food_id="+food_menu_id;
	  
  }
  
  
</script>
<script src="${_ctx}/source/wx/js/jquery-weui.js"></script>
</body>
</html>