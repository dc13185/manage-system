<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/wxTablib.jsp"%>

<!DOCTYPE html>
<html>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>二维码</title>
    <link href="${_ctx}/source/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${_ctx}/source/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${_ctx}/source/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${_ctx}/source/css/animate.css" rel="stylesheet">
    <link href="${_ctx}/source/css/style.css?v=4.1.0" rel="stylesheet">   
    <script src="${_ctx}/source/js/jquery.min.js?v=2.1.4"></script>
</head>
<body class="gray-bg">
	<div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>二维码</h5>
            </div>
         <div class="ibox-content">
	      	<div class="  bounceInRight">
					<div class="modal-body">
						 <form role="form">
						 	  <input type="hidden" id="storeId" name="storeId" >
                               <div class="form-group">
                                 <div id="qrcode" ></div>
                              </div>
                             
                           </form>
					</div>
				</div>	
	
		</div>
	</div>
	<!--/主体内容-->

	
	  <!-- 全局js -->
    <script src="${_ctx}/source/js/jquery.min.js?v=2.1.4"></script>
    <script src="${_ctx}/source/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- Recommended Script Positioning -->
    <script src="${_ctx}/source/wx/js/modernizr-2.8.3.js" type="text/javascript"></script>
    <script src="${_ctx}/source/js/plugins/qrcode/qrcode.min.js"  type="text/javascript"></script>
    
    
    
    <script type="text/javascript">
       
        $(function(){
        	 // 设置 qrcode 参数
            var qrcode = new QRCode('qrcode', {
                text: '${_ctx}/wxLoginAction/toLogin',
                width: 400,
                height: 400,
                colorDark: '#000000',
                colorLight: '#ffffff',
                correctLevel: QRCode.CorrectLevel.H
            });
        	 
        	 $("#qrcode").find("img").css("margin","0 auto");
        	
        	
        })
        
        
    </script>
</body>
</html>	