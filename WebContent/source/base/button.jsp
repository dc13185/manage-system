<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu">
  <a href="${_ctx}/wxLoginAction/toLogin" class="weui-tabbar__item weui-bar__item--on indexMain ">
    <div class="weui-tabbar__icon foot-menu-home"></div>
    <p class="weui-tabbar__label">首页</p>
  </a>
  <a href="${_ctx}/wxFoodAction/toShowCart" class="weui-tabbar__item shopCart">
    <span class="weui-badge" style="position: absolute;top: -.4em;right: 3em;">0</span>
    <div class="weui-tabbar__icon foot-menu-cart"></div>
    <p class="weui-tabbar__label">购物车</p>
  </a>
  <a href="${_ctx}/userAction/toMine" class="weui-tabbar__item myMain" >
    <div class="weui-tabbar__icon foot-menu-member"></div>
    <p class="weui-tabbar__label">我的</p>
  </a>
</div>

