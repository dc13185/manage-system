<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/taglibs.jsp"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - Bootstrap Table</title>
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
                <h5>食品列表</h5>
            </div>
         <div class="ibox-content">
           <!-- 表格 -->
			<div class="row row-lg">
				<div class="col-sm-12">
					<!-- Example Events -->
					<div class="example-wrap">
						<div class="example">
							<div class="btn-group hidden-xs" id="exampleTableEventsToolbar"
								role="group">
								<button type="button" class="btn btn-outline btn-default" id="addButton">
									<i class="glyphicon glyphicon-plus"  aria-hidden="true"></i>
								</button>
								<button type="button" class="btn btn-outline btn-default" id="deleteButton">
									<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
								</button>
							</div>
							<table id="exampleTableEvents" data-height="400"   >
							</table>
						</div>
					</div>
				</div>
			</div>
        </div>
        	<!-- 表格结束 -->

		<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated bounceInRight">
					<div class="modal-header">
					     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                         </button>
						 <h4 class="modal-title">新增菜品</h4>
					</div>
					<div class="modal-body">
						 <form role="form">
						 	  <input type="hidden" id="food_menu_id" name="food_menu_id" >
                              <div class="form-group">
                                  <label>食物名称</label>
                                  <input type="text" id="food_menu_foodname" name="food_menu_foodname" placeholder="请输入食物名" class="form-control">
                              </div>
                              <div class="form-group">
                                  <label>食物价格</label>
                                  <input type="text" id="food_menu_foodprice" name="food_menu_foodprice" placeholder="请输入食物价格" class="form-control">
                              </div>
                              <div class="form-group">
                              	  <label>上架时间</label><br/>
                                  <input id="food_menu_foodtime" class="laydate-icon form-control layer-date " name="food_menu_foodtime">
                              </div>
                              
                               <div class="form-group">
                                   <label>类型</label>
                                   <select class="form-control m-b" name="account" id="storeType">
                                   		 <option value="">请选择类型</option>
                                   		 <c:if test="${! empty storeTypes}">
                                   		 	<c:forEach items="${storeTypes}"  var="storeType">
                                   		 			<option value="${storeType.storeType_id}">${storeType.storeType_name}</option>
                                   		 	</c:forEach>
                                   		 </c:if>
                                   </select>
                              </div>
                              
                              <div class="form-group">
                                  <label>图片</label><br>
                                  <div class="uploader white">
									<input type="text" class="filename" readonly="readonly"/>
									<input type="button" name="file" class="button" value="选择图片" />
									<input type="file" size="30" onchange="fileType(this)" id="tp"/>
								  </div>
                             </div>
                             <div id="ttt" style="height:300px;overflow:hidden; display: none">
					         		  <img alt="" src="" id="weui-cell__ft_test" style="width:100%;">
					         </div>
                              
                           </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary saveSubmit">保存</button>
					</div>
				</div>
			</div>
		</div>

	</div>


               

    <!-- 全局js -->
    <script src="${_ctx}/source/js/jquery.min.js?v=2.1.4"></script>
    <script src="${_ctx}/source/js/bootstrap.min.js?v=3.3.6"></script>
	 <!-- 印日日期控件js -->
    <script src="${_ctx}/source/js/plugins/laydate/laydate.js"></script>
    
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
		var widths=300;
		var heights=300;
		$(function(){
			$.cropper =false;
			//初始化Table
			var oTable = new TableInit();
			oTable.Init();		
			
		})
		
		function fileType(obj){
		$.cropper =false;
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(fileType != '.gif' && fileType != '.png' && fileType != '.jpg' && fileType != '.jpeg'){
	    	$("#tp").tips({
				side:3,
	            msg:'请上传图片格式的文件',
	            bg:'#AE81FF',
	            time:3
	        });
	    	$("#tp").val('');
	    }else{
	    	//裁剪图片
	    	$("#ttt").show();
	    	$("#tp").parents(".uploader").find(".filename").val($("#tp").val());
	    	 if (obj.files && obj.files[0])  
	    	 {  
	    		 var reader = new FileReader();  
	    		 reader.onload = function(evt){  
	    			 $("#weui-cell__ft_test").attr("src",evt.target.result);
		    		 $('#weui-cell__ft_test').cropper("destroy");
		    		 $('#weui-cell__ft_test').cropper({
		    			 aspectRatio: widths /heights,
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
		
		var TableInit = function () {

			var oTableInit = new Object();
			//初始化Table
			oTableInit.Init = function () {
				$('#exampleTableEvents').bootstrapTable({
					url:'${_ctx}/foodMenu/findFoodMenuListByPage',         //请求后台的URL（*）
					method: 'post',                      //请求方式（*）
					toolbar: '#exampleTableEventsToolbar',                //工具按钮用哪个容器
					striped: true,                      //是否显示行间隔色
					cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
					pagination: true,                   //是否显示分页（*）
					sortable: true,                     //是否启用排序
					sortName:"id",
					sortOrder: "desc",                   //排序方式
					queryParams: oTableInit.queryParams,//传递参数（*）
					queryParamsType: 'limit',
					sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
					pageNumber:1,                       //初始化加载第一页，默认第一页
					pageSize: 10,                       //每页的记录行数（*）
					pageList: [10, 15, 20, 50],        //可供选择的每页的行数（*）
					search: true,                       //是否显示表格搜索
					strictSearch: true,
					showColumns: true,                  //是否显示所有的列
					showRefresh: true,                  //是否显示刷新按钮
					minimumCountColumns: 2,             //最少允许的列数
					clickToSelect: true,                //是否启用点击选中行
					//height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
					uniqueId: "id",                     //每一行的唯一标识，一般为主键列
					showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
					cardView: false,                    //是否显示详细视图
					detailView: false,                   //是否显示父子表
					iconSize: 'outline',
					contentType: "application/x-www-form-urlencoded", //解决POST提交问题
					showExport: true,                     //是否显示导出
					buttonsAlign:"right",  //按钮位置
			        exportDataType: "selected",              //basic', 'all', 'selected'.
			        exportTypes:['excel','txt','json', 'xml'],  //导出文件类型   //'json', 'xml', 'csv', 'txt', 'sql', 'excel'
			        Icons:'glyphicon-export',
					responseHandler:function(res) {
						  return {
			                    "total": res.page.total,//总页数
			                    "rows": res.page.rows   //数据
			                 };
					},
				  	icons: {
					        refresh: 'glyphicon-repeat',
					        toggle: 'glyphicon-list-alt',
					        columns: 'glyphicon-list'
					}, 
					columns: [
					          {checkbox: true },
					          {
					              title: '序号',
					              field: '',
					              align: 'center',
					              formatter: function (value, row, index) {
					                  var pageSize = $('#exampleTableEvents').bootstrapTable('getOptions').pageSize;     //通过table的#id 得到每页多少条
					                  var pageNumber = $('#exampleTableEvents').bootstrapTable('getOptions').pageNumber; //通过table的#id 得到当前第几页
					                  return pageSize * (pageNumber - 1) + index + 1;    // 返回每条的序号： 每页条数 *（当前页 - 1 ）+ 序号
					              }
					          },
					          {title:'图片',field: 'food_menu_foodpic',align:"center",sortable:true ,formatter: function (value, row, index) {
					        	  return [
											'<img  src="'+row.food_menu_foodpic+'?='+Math.random()+'" style="width:150px;" >'
											].join("") 
				              }},
					          
					          {title:'食物名',field: 'food_menu_foodname',sortable:true },
					          {title:'时间',field: 'food_menu_foodtime',formatter: function (value, row, index) {
				                  return  (value.split("T"))[0]; 
				              }},
					     
					          {title:'价格',field: 'food_menu_foodprice', formatter: function (value, row, index) {
				                  return (value/100).toFixed(2)+"元";   
				              }},
					          {title:'操作',field:"Button",align:"center",formatter:function (value, row, index) {
					        	  return [
											'<i class="fa fa-edit editButton" style="cursor: pointer;" ></i>'
					        	          ].join("")
					        	  
				              },events:operateEvents
					          }],
				});
			};
			
			//过滤类型
	

			//得到查询的参数
			oTableInit.queryParams = function (params) {
				var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
						pageSize: params.limit,   //页面大小
						pageNumber:params.pageNumber, //页码
						sortName: params.sort,	//排序列名
						sortOrder:params.order,	//排序方式
						searchText:params.search//搜索框参数 
				};
				return temp;
			};
			return oTableInit;
			
		}

		        //外部js调用
		        laydate({
		            elem: '#food_menu_foodtime', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
		            event: 'focus' //响应事件。如果没有传入event，则按照默认的click
		        });
		
			  //修改
			window.operateEvents ={
					"click .editButton":function(e,value,row,index){
						  $.ajax({
								type:"post",
								url:"${_ctx}/foodMenu/findFoodMenuListById",
								data:{"food_menu_id":row.food_menu_id},
								success:function(res){
									$("#storeType").val(row.type_id);
									$("#food_menu_id").val(res.dataMap.FoodMenu.food_menu_id);
									$("#food_menu_foodname").val(res.dataMap.FoodMenu.food_menu_foodname);
									$("#food_menu_foodprice").val((res.dataMap.FoodMenu.food_menu_foodprice/100).toFixed(2));
									$("#food_menu_foodtime").val(res.dataMap.FoodMenu.food_menu_foodtime);
									$("#tp").parents(".uploader").find(".filename").val("点击修改图片");
									$("#ttt").show();
									if($.cropper){
										$('#weui-cell__ft_test').cropper("destroy");
									}
									$("#weui-cell__ft_test").attr("src",row.food_menu_foodpic);
									$("#weui-cell__ft_test").css({"width":widths,"height":heights});
							    	$("#myModal").modal();	
								}
					    	});
						  
						  
						  
					}
			}
		
		
		//删除
		  $("#deleteButton").on("click", function () {
	            // $("#table").bootstrapTable('getSelections');为bootstrapTable自带的，所以说一定要使用bootstrapTable显示表格,#table：为table的id
	            var rows = $("#exampleTableEvents").bootstrapTable('getSelections');
	            console.log(rows);
	            if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
	                alert("请先选择要删除的记录!");
	                return;
	            }else {
	                var arrays = new Array();// 声明一个数组
	                $(rows).each(function () {// 通过获得别选中的来进行遍历
	                    arrays.push(this.food_menu_id);// cid为获得到的整条数据中的一列
	                });
	                var idcard = arrays.join(','); // 获得要删除的id
	                $.ajax({
						type:"post",
						url:"${_ctx}/foodMenu/deleteFoodByIds",
						data:{"idcard":idcard},
						success:function(res){
							if(res.dataMap.status =="success"){
								//删除成功
								$('#exampleTableEvents').bootstrapTable(('refresh'));
							}
						}
			    	});   
	                
	           
	            }

		  })
		  
		  
		    $("#addButton").on("click", function (){
		    	$("#storeType").val();
		    	$("#food_menu_id").val("");
		    	$("#tp").parents(".uploader").find(".filename").val("请选择图片文件");
				if($.cropper){
					$("#ttt").hide();
				}
		    	$("#food_menu_foodname").val("");
		    	//$("#food_menu_foodtime").val("");
		    	$("#food_menu_foodprice").val("");
		    	$("#food_menu_foodtime").val("");
		    	$("#myModal").modal();
			 })
		    
		    $(".saveSubmit").on("click",function(){
		    		var storeType_id=$("#storeType").val();
			    	var storeType_name=$("#storeType").find("option:selected").text();;
		    		var food_menu_id =$("#food_menu_id").val();
		    		var food_menu_foodname = $("#food_menu_foodname").val();
		    		var food_menu_foodprice =$("#food_menu_foodprice").val();
		    		var food_menu_foodtime =$("#food_menu_foodtime").val();
		    		var url = "${_ctx}/foodMenu/addFood";
		    		var img;
		    		if($.cropper){
				    	var c = $("#weui-cell__ft_test").cropper('getCroppedCanvas',{
				    		width: widths,
							height:heights	
				    	});
				    	img =c.toDataURL('image/jpeg',0.8);
			    	}
		    		
		    		//${_ctx}/systemUser/deitSystemUser
		    		if(food_menu_id && food_menu_id != ""){
		    			url = "${_ctx}/foodMenu/editFoodMenu";
		    		}
		    			$.ajax({
							type:"post",
							url:url,
							data:{"storeType_name":storeType_name,"storeType_id":storeType_id,"food_menu_id":food_menu_id,"food_menu_foodname":food_menu_foodname,"food_menu_foodprice":food_menu_foodprice,"food_menu_foodtime":food_menu_foodtime,"food_menu_foodpic":img},
							success:function(res){
								if(res.dataMap.status =="success"){
									$('#myModal').modal('hide');
									$('#exampleTableEvents').bootstrapTable(('refresh'));
								}else if(res.dataMap.status =="already"){
									//食物名已经存在
									$("#food_menu_foodname").tips({
										side:3,
							            msg:'食物名已存在',
							            bg:'#AE81FF',
							            time:2
							        });
									$("#food_menu_foodname").focus();
								}
							}
				    	});

		    })
		    
		    
		  
		  
		  

	</script>
	
	
	
	
	

</body>

</html>