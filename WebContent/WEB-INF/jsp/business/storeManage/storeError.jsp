<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/taglibs.jsp"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->



    <link rel="shortcut icon" href="favicon.ico">
    <link href="${_ctx}/source/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${_ctx}/source/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${_ctx}/source/css/animate.css" rel="stylesheet">
    <link href="${_ctx}/source/css/style.css?v=4.1.0" rel="stylesheet">
    

</head>

<body class="gray-bg">
    <div class="row  border-bottom white-bg dashboard-header">
        <div class="col-sm-12">
            <blockquote class="text-warning" style="font-size:14px">
            	<c:if test="${!empty store}">
            	  <c:if test="${store.status == -1}">
            	    <h4 class="text-danger">该店铺已被删除</h4>
            	 </c:if>  
            	 <c:if test="${store.status == 0}">
            	    <h4 class="text-danger">该店铺已被冻结</h4>
            	 </c:if>
            	</c:if>
               <c:if test="${empty store}">
            	 <h4 class="text-danger">改店铺已被删除</h4>
            	</c:if>
            </blockquote>

            <hr>
        </div>
      </div>

    <!-- 全局js -->
    <script src="${_ctx}/source/js/jquery.min.js?v=2.1.4"></script>
    <script src="${_ctx}/source/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${_ctx}/source/js/plugins/layer/layer.min.js"></script>
    <!-- 自定义js -->
    <script src="${_ctx}/source/js/content.js"></script>
    <!-- 欢迎信息 -->
    <script src="${_ctx}/source/js/welcome.js"></script>
</body>

</html>
