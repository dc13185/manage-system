<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/taglibs.jsp"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


   <!--  <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术"> -->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${_ctx}/source/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${_ctx}/source/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${_ctx}/source/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${_ctx}/source/css/animate.css" rel="stylesheet">
    <link href="${_ctx}/source/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${_ctx}/source/js/plugins/zTree/2.6/zTreeStyle.css" rel="stylesheet">
    <link href="${_ctx}/source/js/plugins/cropper/cropper.min.css" rel="stylesheet">
    
    <link href="${_ctx}/source/css/inputUpload.css" rel="stylesheet">

</head>

<body class="gray-bg">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>系统设置</h5>
            </div>
         <div class="ibox-content">
	      	<div class="modal-content  bounceInRight">
					<div class="modal-body">
						 <form role="form">
						 	  <input type="hidden" id="storeId" name="storeId" >
                               <div class="form-group">
                                  <label>系统名</label>
                                  <input type="text" id="systemName" name="systemName" value="${systemIp.systemName}" placeholder="请输入系统名" class="form-control">
                              </div>
                              <div class="form-group">
                                  <label>IP</label>
                                  <input type="text" id="systemIp" name="systemIp" value="${systemIp.ip}" placeholder="请输入系统IP" class="form-control">
                              </div>
                           </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary saveSubmit">更改</button>
					</div>
				</div>	
	
		</div>
	</div>


               

    <!-- 全局js -->
    <script src="${_ctx}/source/js/jquery.min.js?v=2.1.4"></script>
    <script src="${_ctx}/source/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="${_ctx}/source/js/content.js?v=1.0.0"></script>


    <!-- Bootstrap table -->
    <script src="${_ctx}/source/js/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="${_ctx}/source/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script> 
    <script src="${_ctx}/source/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script> 
    <script src="${_ctx}/source/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${_ctx}/source/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${_ctx}/source/js/plugins/tips/jquery.tips.js"></script>
    <script src="${_ctx}/source/js/plugins/cropper/cropper.min.js"></script>
    <script type="text/javascript">
    $(".saveSubmit").click(function(){
    	var systemName =$("#systemName").val();
    	var systemIp =$("#systemIp").val();
    	
    	$.post("${_ctx}/systemAction/editSystem",{"systemName":systemName,"systemIp":systemIp,"id":'${systemIp.id}'},function(data){
    	});
    })
    
    
    </script>
	
	
	
	

</body>

</html>