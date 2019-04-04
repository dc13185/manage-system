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
    <div class="wy-header-icon-back"><span></span></div>
    <div class="wy-header-title">修改个人信息</div>
</header>
<div class="weui-content">
    <div class="weui-cells weui-cells_form wy-address-edit">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label wy-lab">昵称</label></div>
            <div class="weui-cell__bd"><input class="weui-input" type="number" pattern="[0-9]*" placeholder="陈大鹏"></div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label wy-lab">性别</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="number" pattern="[0-9]*" placeholder="男">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label wy-lab">学院</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="number" pattern="[0-9]*" placeholder="软件技术学院">
            </div>
        </div>

        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label wy-lab">个人简介</label></div>
            <div class="weui-cell__bd">
                <textarea class="weui-textarea" placeholder="我是一只丑小鸭"></textarea>
            </div>
        </div>


        <div class="weui-cell">
            <div class="weui-cell__hd"><label for="name" class="weui-label wy-lab">所在地区</label></div>
            <div class="weui-cell__bd"><input class="weui-input" id="address" type="text" value="湖北省 武汉市 武昌区" readonly="" data-code="420106" data-codes="420000,420100,420106"></div>
        </div>
    </div>
    <div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips">保存</a>
    </div>

</div>

<script src="lib/jquery-2.1.4.js"></script>
<script src="lib/fastclick.js"></script>
<script type="text/javascript" src="js/jquery.Spinner.js"></script>
<script>
    $(function() {
        FastClick.attach(document.body);
    });
</script>

<script src="js/jquery-weui.js"></script>
<script src="js/city-picker.js"></script>
<script>
    $("#address").cityPicker({
        title: "选择出发地",
        onChange: function (picker, values, displayValues) {
            console.log(values, displayValues);
        }
    });
</script>
</body>
</html>