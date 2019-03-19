<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>商城首页</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
<link rel="stylesheet" href="${_ctx}/source/wx/lib/weui.min.css">
<link rel="stylesheet" href="${_ctx}/source/wx/css/jquery-weui.css">
<link rel="stylesheet" href="${_ctx}/source/wx/css/style.css">
</head>
<body ontouchstart>
<!--顶部搜索-->
<!-- <header class='weui-header'>
  <div class="weui-search-bar" id="searchBar">
      <div class="weui-search-bar__box">
        <i class="weui-icon-search"></i>
        <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索您想要的商品" required>
        <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
      </div>
      <label class="weui-search-bar__label" id="searchText" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
        <span>搜索您想要的商品</span>
      </label>
    <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
  </div>
</header> -->
<!--主体-->
<div class='weui-content'>
  <!--顶部轮播-->
  <div class="swiper-container swiper-banner">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><a href="javascript:void(0)"><img src="${_ctx}/source/wx/upload/ban2.jpg" /></a></div>
      <div class="swiper-slide"><a href="javascript:void(0)"><img src="${_ctx}/source/wx/upload/ban3.jpg" /></a></div>
      <div class="swiper-slide"><a href="javascript:void(0)"><img src="${_ctx}/source/wx/upload/ban4.jpg" /></a></div>
    </div>
    <div class="swiper-pagination"></div>
  </div>
  <!--新闻切换-->
  <div class="wy-ind-news">
    <i class="news-icon-laba"></i>
    <div class="swiper-container swiper-news">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><a href="javascript:void(0)">热烈祝贺智慧食堂上线</a></div>
      </div>
      <div class="swiper-pagination"></div>
    </div>
    <a href="news_list.html" class="newsmore"><i class="news-icon-more"></i></a>
  </div>
  <!--精选推荐-->
  <c:if test="${!empty storeAdminTypes}">
    <c:forEach  items="${storeAdminTypes}" var="storeAdminType">
	  	<div class="wy-Module">
	    <div class="wy-Module-tit"><span>${storeAdminType.storeType_name}</span></div>
	    <div class="wy-Module-con">
	      <div class="swiper-container swiper-jingxuan" style="padding-top:34px;">
	        <div class="swiper-wrapper">
	          <c:if test="${!empty storeAdminType.stores}" > 
	               <c:forEach  items="${storeAdminType.stores}" var="store">
						<div class="swiper-slide">
							<div class="store">
								<a href="${_ctx}/wxFoodAction/toFoodList?store_id=${store.store_id}"> 
								   <img class="store_img"src="${store.store_image}" />
								</a>
								<div class="store_label">${store.store_name}</div>
							</div>
						</div>
					</c:forEach>
	           </c:if> 
	        </div>
	        <div class="swiper-pagination jingxuan-pagination"></div>
	      </div>
	    </div>
	  </div>
      </c:forEach>
  </c:if>
  
  
  <!--底部导航-->
<%@ include file="/source/base/button.jsp"%>


<script src="${_ctx}/source/wx/lib/jquery-2.1.4.js"></script> 
<script src="${_ctx}/source/wx/lib/fastclick.js"></script> 
<script>
  $(function() {
    FastClick.attach(document.body);
    
    $(".weui-tabbar__item").removeClass("weui-bar__item--on");
    $(".indexMain").addClass("weui-bar__item--on");
    
    
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
	$(".swiper-banner").swiper({
        loop: true,
        autoplay: 3000
      });
	$(".swiper-news").swiper({
		loop: true,
		direction: 'vertical',
		paginationHide :true,
        autoplay: 30000
      });
	 $(".swiper-jingxuan").swiper({
		pagination: '.swiper-pagination',
		loop: false,
		paginationType:'fraction',
        slidesPerView:3,
        paginationClickable: false,
        spaceBetween: 2
      });
	 $(".swiper-jiushui").swiper({
		pagination: '.swiper-pagination',
		paginationType:'fraction',
		loop: true,
        slidesPerView:3,
		slidesPerColumn: 2,
        paginationClickable: true,
        spaceBetween:2
      });
</script>
</body>
</html>
