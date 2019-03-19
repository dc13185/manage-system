<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>
<!DOCTYPE ">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品详情</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
<link rel="stylesheet" href="${_ctx}/source/wx/lib/weui.min.css">
<link rel="stylesheet" href="${_ctx}/source/wx/css/jquery-weui.css">
<link rel="stylesheet" href="${_ctx}/source/wx/css/style.css">
<style type="text/css">
.swiper-container{
 height: 200px;
}

</style>
</head>
<body ontouchstart>
<!--主体-->
<div class="weui-content">
  <!--产品详情-->
  <div class="weui-tab">
    <div class="weui-navbar" style="position:fixed; top:0; left:0; right:0; height:44px;">
      <a class="weui-navbar__item proinfo-tab-tit weui-bar__item--on" href="#tab1">商品</a>
      <a class="weui-navbar__item proinfo-tab-tit" href="#tab3">评价</a>
    </div>
    <div class="weui-tab__bd proinfo-tab-con">
      <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
        <!--主图轮播-->
        <div class="swiper-container swiper-zhutu">
          <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="${foodMenu.food_menu_foodpic}" /></div>
          </div>
          <div class="swiper-pagination swiper-zhutu-pagination"></div>
        </div>
        <div class="wy-media-box-nomg weui-media-box_text">
          <h4 class="wy-media-box__title">${foodMenu.food_menu_foodname}</h4>
          <div class="wy-pro-pri mg-tb-5">¥<em class="num font-20">${(foodMenu.food_menu_foodprice)/100}</em></div>
        </div>
      </div>
      <div id="tab3" class="weui-tab__bd-item">
        <!--评价-->
        <c:if test="${! empty comments}">
      	<c:forEach items="${comments}" var="comment" >
				<div class="weui-panel__bd">
					<div class="wy-media-box weui-media-box_text">
						<div class="weui-cell nopd weui-cell_access">
							<div class="weui-cell__hd">
								<img src="${_ctx}/source/upload/headimg.jpg" alt=""
									style="width: 20px; margin-right: 5px; display: block">
							</div>
						<!-- 	<div class="weui-cell__bd weui-cell_primary">
								<p>飞翔的小土豆</p>
							</div> -->
							<span class="weui-cell__time">${comment.comment_data}</span>
						</div>
						<div class="comment-item-star">
							<span class="real-star comment-stars-width5"></span>
						</div>
						<p class="weui-media-box__desc">${comment.comment_main}</p>
					</div>
				</div>
			</c:forEach>
        </c:if>
<!--         <a href="javascript:void(0);" class="weui-cell weui-cell_access weui-cell_link list-more">
            <div class="weui-cell__bd">查看更多</div>
            <span class="weui-cell__ft"></span>
          </a>
         -->
      </div>
    </div>
  </div>  
</div>
<span id="tophovertree" title="返回顶部"></span>
<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu">
  <a href="${_ctx}/wxFoodAction/toShowCart" class="promotion-foot-menu-items">
    <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;">8</span>
    <div class="weui-tabbar__icon promotion-foot-menu-cart"></div>
    <p class="weui-tabbar__label">购物车</p>
  </a>
  <a href="javascript:;" class="weui-tabbar__item yellow-color open-popup"  >  <!-- data-target="#join_cart -->  
    <p class="promotion-foot-menu-label">加入购物车</p>
  </a>
</div>
<div id="join_cart" class='weui-popup__container popup-bottom' style="z-index:600;">
  <div class="weui-popup__overlay" style="opacity:1;"></div>
  <div class="weui-popup__modal">
    <div class="modal-content">
      <div class="weui-msg" style="padding-top:0;">
        <div class="weui-msg__icon-area"><i class="weui-icon-success weui-icon_msg"></i></div>
        <div class="weui-msg__text-area">
          <h2 class="weui-msg__title">成功加入购物车</h2>
          <p class="weui-msg__desc">亲爱的用户，您的商品已成功加入购物车，为了保证您的商品快速送达，请您尽快到购物车结算。</p>
        </div>
        <div class="weui-msg__opr-area">
          <p class="weui-btn-area">
            <a href="shopcart.html" class="weui-btn weui-btn_primary">去购物车结算</a>
            <a href="javascript:;" class="weui-btn weui-btn_default close-popup">不，我再看看</a>
          </p>
        </div>
      </div>
    </div>
  </div>
</div>
<div id="selcet_sku" class='weui-popup__container popup-bottom' style="z-index:600;">
  <div class="weui-popup__overlay" style="opacity:1;"></div>
  <div class="weui-popup__modal">
    <div class="toolbar">
      <div class="toolbar-inner">
        <a href="javascript:;" class="picker-button close-popup">关闭</a>
        <h1 class="title">商品属性</h1>
      </div>
    </div>
    <div class="modal-content">
      <div class="weui-msg" style="padding-top:0;">
        <div class="weui-msg__opr-area">
          <p class="weui-btn-area">
            <a href="order_info.html" class="weui-btn weui-btn_primary">立即购买</a>
            <a href="javascript:;" class="weui-btn weui-btn_default close-popup">不，我再看看</a>
          </p>
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
    if(sessionStorage.getItem("length")){
    	$(".weui-badge").text(sessionStorage.getItem("length"));
    }else{
    	$(".weui-badge").text(0);
    }
	 
  });
</script> 
<script src="${_ctx}/source/wx/js/jquery-weui.js"></script>
<script src="${_ctx}/source/wx/js/swiper.js"></script>
<script>
$(".swiper-zhutu").swiper({
        loop: true,
		paginationType:'fraction',
        autoplay:5000
      });
</script>
<script>
$(function(){
	$(".promotion-sku li").click(function(){
		$(this).addClass("active").siblings("li").removeClass("active");
		})
	})
</script>
<script>
      $(document).on("click", "#show-toast", function() {
        $.toast("收藏成功", function() {
          console.log('close');
        });
      })
</script>
<script>
      $(document).on("open", ".weui-popup-modal", function() {
        console.log("open popup");
      }).on("close", ".weui-popup-modal", function() {
        console.log("close popup");
      });
    </script>
<script>
$(function (){initTopHoverTree("tophov"+"ertree",30,10,10); })
</script>
<script>
function initTopHoverTree(hvtid, times, right, bottom) {
$("#" + hvtid).css("right", right).css("bottmo", bottom);
$("#" + hvtid).on("click", function () { goTopHovetree(times); })
$(window).scroll(function () {
if ($(window).scrollTop() > 268) {
$("#" + hvtid).fadeIn(100);
}
else {
$("#" + hvtid).fadeOut(100);
}
});
}
//返回顶部动画
//goTop(500);//500ms内滚回顶部
function goTopHovetree(times) {
	if (!!!times) {
	$(window).scrollTop(0);
	return;
	}
	var sh = $('body').scrollTop();//移动总距离
	var inter = 13.333;//ms,每次移动间隔时间
	var forCount = Math.ceil(times / inter);//移动次数
	var stepL = Math.ceil(sh / forCount);//移动步长
	var timeId = null;
	function aniHovertree() {
	!!timeId && clearTimeout(timeId);
	timeId = null;
	//console.log($('body').scrollTop());
	if ($('body').scrollTop() <= 0 || forCount <= 0) {//移动端判断次数好些，因为移动端的scroll事件触发不频繁，有可能检测不到有<=0的情况
	$('body').scrollTop(0);
	return;
	}
	forCount--;
	sh -= stepL;
	$('body').scrollTop(sh);
	timeId = setTimeout(function () { aniHovertree(); }, inter);
	}
	aniHovertree();
}


$(".promotion-foot-menu-label").click(function(){
	var foodId  = '${foodMenu.food_menu_id}'
	var food_menu = '${json_foodMenu}';
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
	$("#join_cart").popup();
	
	
})

$(".weui-btn_primary").click(function(){
	window.location.href="${_ctx}/wxFoodAction/toShowCart";	
})
</script>
</body>
</html>