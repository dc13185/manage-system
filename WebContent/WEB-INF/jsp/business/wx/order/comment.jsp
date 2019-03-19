<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>

<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>发表评价</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.">
<link rel="stylesheet" href="${_ctx}/source/wx/lib/weui.min.css">
<link rel="stylesheet" href="${_ctx}/source/wx/css/style.css">
</head>
<body ontouchstart>
<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">发表评价</div>
</header>
<div class="weui-content clear">
<!--   <div class="order-list-Below clear">
    <h1>商品评价</h1>
    <ul>
      <li class="on"></li>
      <li class="on"></li>
      <li class="on"></li>
      <li class="on"></li>
      <li class="on"></li>
    </ul>
  </div> -->
  <div class="weui-cells weui-cells_form com-txt-area">
    <div class="weui-cell">
      <div class="weui-cell__bd">
        <textarea class="weui-textarea txt-area"  maxlength="220" placeholder="这个商品满足你的期待吗？说说你的使用心得，分享给想买的他们吧" rows="3"></textarea>
        <div class="weui-textarea-counter font-12 num"><span>最多200字</span></div>
      </div>
    </div>
  </div>
<!--   <div class="weui-cells weui-cells_checkbox commg">
    <label class="weui-cell weui-check__label" for="s11">
      <div class="weui-cell__hd">
        <input type="checkbox" class="weui-check" name="checkbox1" id="s11" checked="checked">
        <i class="weui-icon-checked"></i>
      </div>
      <div class="weui-cell__bd"><p>匿名评价</p></div>
    </label>
  </div> -->
  
  <div class="com-button"><a href="javascript:void(0);">发表评价</a></div>
</div>

<script src="${_ctx}/source/wx/lib/jquery-2.1.4.js"></script> 
<script src="${_ctx}/source/wx/lib/fastclick.js"></script> 
<script type="text/javascript" src="${_ctx}/source/wx/js/jquery.Spinner.js"></script>
<script>
  $(function() {
    FastClick.attach(document.body);
  });
</script>
<script src="${_ctx}/source/wx/js/jquery-weui.js"></script>
<script type="text/javascript">
$(".order-list-Below ul li").click(
    function(){
        var num = $(this).index()+1;
        var len = $(this).index();
        var thats = $(this).parent(".order-list-Below ul").find("li");
        if($(thats).eq(len).attr("class")=="on"){
            if($(thats).eq(num).attr("class")=="on"){
                $(thats).removeClass();
                for (var i=0 ; i<num; i++) {
                    $(thats).eq(i).addClass("on");
                }
            }else{
                $(thats).removeClass();
                for (var k=0 ; k<len; k++) {
                    $(thats).eq(k).addClass("on");
                }
            }
        }else{
            $(thats).removeClass();
            for (var j=0 ; j<num; j++) {
                $(thats).eq(j).addClass("on");
            }
        }
    }
);
$(".com-button").click(function(){
	comment();
})

function comment(){
	var comment_main= $(".txt-area").val();
	if(comment_main.trim()==""){
		$.alert("评论不能为空");
		return;
	}
	
	$.ajax({
			url:"${_ctx}/orderAction/comment",
			type:"post",
			async:true,
			data:{"comment_main":comment_main,"food_id":'${food_id}',"order_id":'${order_id}'},
			success:function(data){
				window.location.href="${_ctx}/orderAction/toAllOrder";
				
			}
	    });
	
}

$(".wy-header-icon-back").click(function(){
	window.location.href="${_ctx}/orderAction/toAllOrder";
})

</script>

</body>
</html>