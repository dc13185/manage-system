<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>编辑地址</title>
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
    <div class="wy-header-icon-back">
        <span id="redirect">  </span>
    </div>
    <div class="wy-header-title">修改个人信息</div>
</header>
<div class="weui-content">
    <div class="weui-cells weui-cells_form wy-address-edit">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label wy-lab">昵称</label></div>
            <div class="weui-cell__bd"><input class="weui-input" id="nickName" value="${user.nickName}" type="text" ></div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label wy-lab">性别</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" id="sex" type="text">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label wy-lab">学院</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" id="department" value="${user.department}" type="text" >
            </div>
        </div>

        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label wy-lab">个人简介</label></div>
            <div class="weui-cell__bd">
                <textarea class="weui-textarea" id="introduction" maxlength="200"> ${user.introduction}  </textarea>
            </div>
        </div>


    </div>
    <div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" id="saveMine">保存</a>
    </div>

</div>

<script src="${_ctx}/source/wx/lib/jquery-2.1.4.js"></script>
<script src="${_ctx}/source/wx/lib/fastclick.js"></script>
<script type="text/javascript" src="${_ctx}/source/wx/js/jquery.Spinner.js"></script>
<script>
    $(function() {
        FastClick.attach(document.body);

        $("#sex").val('${user.sex}');

        $("#sex").select({
            title: "性别",
            items: [
                {
                    title: "男",
                    value: "0",
                },
                {
                    title: "女",
                    value: "1",
                }
            ]
        });


        $("#saveMine").click(function () {
            var nickName = $("#nickName").val();
            var sex = $("#sex").val();
            var department = $("#department").val();
            var introduction = $("#introduction").val();

            $.ajax({
                url:"${_ctx}/userAction/editUserInfo",
                type:"post",
                async:false,
                data:{"nickName":nickName,"sex":sex,"department":department,"introduction":introduction},
                success:function(data){
                    if(data.dataMap.status == "success"){
                        $.alert("修改信息成功");
                    }else{
                        $.alert("系统异常");
                    }
                }
            });
        })

        $("#redirect").click(function () {
            window.location.href="${_ctx}/userAction/toMine";
        })

    });
</script>

<script src="${_ctx}/source/wx/js/jquery-weui.js"></script>
<script src="${_ctx}/source/wx/js/city-picker.js"></script>
<script>

</script>
</body>
</html>