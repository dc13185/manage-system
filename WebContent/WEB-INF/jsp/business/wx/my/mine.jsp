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
<link href="${_ctx}/source/js/plugins/cropper/cropper.min.css" rel="stylesheet">
</head>
<body ontouchstart>
<!--主体-->
<div class='weui-content'>
 <div class="wy-center-top">
    <div class="weui-media-box weui-media-box_appmsg">
      <div class="weui-media-box__hd">
     <c:if test="${user.portrait == null }">
          <img class="weui-media-box__thumb radius" id="portrait" src="${_ctx}/source/wx/upload/headimg.jpg" alt=""></div>
      </c:if>
      <c:if test="${user.portrait != null }">
          <img class="weui-media-box__thumb radius"  id="portrait" src="${user.portrait}" alt="" style="height: 80px;width: 80  px;"></div>
      </c:if>
      <div class="weui-media-box__bd">
        <h4 class="weui-media-box__title user-name">${user.nickName}</h4>
        <p class="user-grade">等级：普通会员</p>
        <p class="user-grade">个人签名：${user.introduction}</p>
     <%--   <p class="user-integral">待返还金额：<em class="num">500.0</em>元</p>--%>
      </div>
    </div>
 <%--   <div class="xx-menu weui-flex">
      <div class="weui-flex__item"><div class="xx-menu-list"><em>987</em><p>账户余额</p></div></div>
      <div class="weui-flex__item"><div class="xx-menu-list"><em>459</em><p>我的蓝豆</p></div></div>
      <div class="weui-flex__item"><div class="xx-menu-list"><em>4</em><p>收藏商品</p></div></div>
    </div>--%>
  </div>
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
              <a class="weui-cell weui-cell_access" href="${_ctx}/userAction/toMineEdit">
                <div class="weui-cell__hd"><img src="${_ctx}/source/wx/images/center-icon-dz.png" alt="" class="center-list-icon"></div>
                <div class="weui-cell__bd weui-cell_primary">
                  <p class="center-list-txt">个人信息</p>
                </div>
                <span class="weui-cell__ft"></span>
              </a>
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


    <%-- pop弹窗--%>
    <div id="portraitEdit" class="weui-popup__container ">
        <div class="weui-popup__overlay"></div>
        <div class="weui-popup__modal">
            <div class="toolbar">
                <div class="toolbar-inner">
                    <a href="javascript:;" class="picker-button close-popup">关闭</a>
                    <h1 class="title">上传头像</h1>
                </div>
            </div>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <div class="weui-uploader">
                            <div class="weui-uploader__hd">
                                <p class="weui-uploader__title">头像上传</p>
                            </div>
                            <div class="weui-uploader__bd">
                                <div class="weui-uploader__input-box">
                                    <input id="uploaderInput" class="weui-uploader__input" onchange="fileType(this)" type="file" accept="image/*" multiple="">
                                </div>
                            </div>
                            <div id="ttt" style="height:150px;overflow:hidden; display: none">
                                <img alt="" src="" id="weui-cell__ft_test" style="width:100%;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <button class="weui-btn weui-btn_primary " id="upload" style="display: none">上传</button>
        </div>
    </div>
  
  
  
</div>

<!--底部导航-->
<div class="foot-black"></div>
  <!--底部导航-->
<%@ include file="/source/base/button.jsp"%>

<script src="${_ctx}/source/wx/lib/jquery-2.1.4.js"></script> 
<script src="${_ctx}/source/wx/lib/fastclick.js"></script>
<script src="${_ctx}/source/js/plugins/cropper/cropper.min.js"></script>
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

  $("#portrait").click(function(){
      $("#portraitEdit").popup();
  })

  function fileType(obj){
      $.cropper =false;
      var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
      if(fileType != '.gif' && fileType != '.png' && fileType != '.jpg' && fileType != '.jpeg'){
          $.alert("请上传图片格式的文件");
      }else{
          //裁剪图片
          $("#ttt").show();
          $("#upload").show();
          if (obj.files && obj.files[0])
          {
              var reader = new FileReader();
              reader.onload = function(evt){
                  $("#weui-cell__ft_test").attr("src",evt.target.result);
                  $('#weui-cell__ft_test').cropper("destroy");
                  $('#weui-cell__ft_test').cropper({
                      crop: function(data) {
                          //.toDataURL('image/jpeg', 1.0);
                      },
                      built: function (data) {

                      }
                  });
              }
              reader.readAsDataURL(obj.files[0]);
          }

          $.cropper = true;
          //$("#icon_tr").show();
      }
  }


  $("#upload").click(function(){
      var c = $("#weui-cell__ft_test").cropper('getCroppedCanvas',{
          width: 150,
          height:150
      });
     var  img =c.toDataURL('image/jpeg',0.8);

      $.ajax({
          url:"${_ctx}/userAction/editPortrait",
          type:"post",
          async:false,
          data:{"img":img},
          success:function(data){
              if(data.dataMap.portrait != ''){
                  $("#portrait").attr("src",data.dataMap.portrait);
                  $.closePopup();
              }else{
                $.alert("系统异常");
              }
          }
      });

  })
</script> 
<script src="${_ctx}/source/wx/js/jquery-weui.js"></script>
</body>
</html>