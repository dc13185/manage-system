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
                <h5>代码生成(实体属性、数据库字段、备注必须一一对应！！！)</h5>
            </div>
         <div class="ibox-content">
             <div class="modal-content animated bounceInRight ">
                 <div class="modal-body ">
                     <form role="form">
                         <div class="form-group">
                             <label>.java文件输出路径</label>
                             <input type="text" id="srcCodePath" name="storeName"  placeholder="如 F:\eclipse_repository\ManagSystem\src\com\ms （* ms后面不需要 '\'）" class="form-control">
                         </div>
                         <div class="form-group">
                             <label> jsp文件输出路径</label>
                             <input type="text"  id="jspCodePath"  placeholder="F:\eclipse_repository\ManagSystem\WebContent\WEB-INF\jsp （* jsp后面不需要 '\'）" class="form-control">
                         </div>
                         <div class="form-group">
                             <label> 主题 </label>
                             <input type="text"  id="theme"  placeholder="如 员工管理 ： 只需要输入 员工 即可" class="form-control">
                         </div>
                         <div class="form-group">
                             <label> 业务类型 </label>
                             <input type="text"  id="type"  placeholder="只有两种类型 business、system" class="form-control">
                         </div>
                         <div class="form-group">
                             <label> 类名 </label>
                             <input type="text"  id="entityName"  placeholder="如 User、Person、Customer" class="form-control">
                         </div>
                     </form>
                 </div>
             </div>
	      	  <div class="modal-content animated bounceInRight col-sm-4" >
					<div class="modal-body " id="modal-columns">
                      <label>实体属性名(*第一项必须为主键)</label>
                      <div class="form-group">
                          <input type="text"  name="storeName"  placeholder="请输入实体字段名(如 personName)" class="form-control columns">
                      </div>
					</div>
                   <button type="button" class="btn btn-block btn-outline btn-primary columnsBtn">+ 新增属性</button>
              </div>

              <div class="modal-content animated bounceInRight col-sm-4" >
                 <div class="modal-body" id="modal-db-columns">
                     <label>数据库字段名(*第一项必须为主键)</label>
                     <div class="form-group">
                         <input type="text"  name="storeName" placeholder="请输入数据库字段名(如 perso_name)" class="form-control db-columns">
                     </div>
                 </div>
                  <button type="button" class="btn btn-block btn-outline btn-primary dbColumnsBtn">+ 新增属性</button>
             </div>

             <div class="modal-content animated bounceInRight col-sm-4" >
                 <div class="modal-body" id="modal-remarks">
                     <label>备注</label>
                     <div class="form-group">
                         <input type="text"  name="storeName"  placeholder="请输入备注 如 (员工姓名)" class="form-control remarks">
                     </div>
                 </div>
                 <button type="button" class="btn btn-block btn-outline btn-primary remarksBtn">+ 备注</button>
             </div>
         </div>
	</div>
    <div class="modal-footer">
        <button type="button" class="btn btn-primary saveSubmit">生成代码</button>
    </div>


    <div id="code-model" style="display: none">
        <div class="form-group column">
            <input type="text"  name="storeName"  placeholder="请输入实体字段名(如 personName)" class="form-control columns">
        </div>
        <div class="form-group db-column">
            <input type="text"  name="storeName" placeholder="请输入数据库字段名(如 perso_name)" class="form-control db-columns">
        </div>
        <div class="form-group remark">
            <input type="text "  name="storeName"  placeholder="请输入备注 如 (员工姓名)" class="form-control remarks">
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
	    var srcCodePath = $("#srcCodePath").val();
        var jspCodePath = $("#jspCodePath").val();
        var theme = $("#theme").val();
        var entityName = $("#entityName").val();
        var type = $("#type").val();
        var columArrays = new Array();
        var dbColumArrays = new Array();
        var remarks = new Array();
        for (var i = 0; i <$(".columns").length ; i++) {
            debugger;
            columArrays.push($(".columns").eq(i).val());
            dbColumArrays.push($(".db-columns").eq(i).val());
            remarks.push($(".remarks").eq(i).val());
        }

      /*  $(".columns").each(function () {// 通过获得别选中的来进行遍历
            if($(this).val() != ''){
                columArrays.push($(this).val());
            }
        });
        $(".db-columns").each(function () {// 通过获得别选中的来进行遍历
            if($(this).val() != ''){
                dbColumArrays.push($(this).val());
            }
        });
        $(".remarks").each(function () {// 通过获得别选中的来进行遍历
            if($(this).val() != '') {
                remarks.push($(this).val());
            }
        });*/

        var columStr = columArrays.join(',');
        var dbColumStr = dbColumArrays.join(',');
        var remarkStr = remarks.join(',');
    	$.post("${_ctx}/generateAction/generateCode",{
    	    "type":type,"srcCodePath":srcCodePath,"jspCodePath":jspCodePath,"theme":theme,"entityName":entityName,"columArrays":columStr,"dbColumArrays":dbColumStr,"remarks":remarkStr
        },function(data){
    	    if(data.dataMap.status == "success"){
    	        alert("代码生成成功");
            }else{
    	        alert("系统错误");
            }
    	});
    })

    $(".columnsBtn").click(function () {
        addModelByType("columns");
    })

    $(".dbColumnsBtn").click(function () {
        addModelByType("db-columns");
    })

    $(".remarksBtn").click(function () {
        addModelByType("remarks");
    })

    function addModelByType(type){
        var model;
        if(type == "columns"){
            model = $("#code-model").find(".column").clone();
            $("#modal-columns").append(model);
        }else if(type=="db-columns"){
            model = $("#code-model").find(".db-column").clone();
            $("#modal-db-columns").append(model);
        }else{
            model = $("#code-model").find(".remark").clone();
            $("#modal-remarks").append(model);
        }
    }
	
        
	
	
	</script>
	

</body>

</html>