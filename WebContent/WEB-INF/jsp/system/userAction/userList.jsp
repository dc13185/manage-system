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

</head>

<body class="gray-bg">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>用户管理</h5>
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
		
		
		<!-- 新增修改菜单 -->
		<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated bounceInRight">
					<div class="modal-header">
					     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                         </button>
						 <h4 class="modal-title">新增用户</h4>
					</div>
					<div class="modal-body">
						 <form role="form">
						 	  <input type="hidden" id="systemId" name="systemId" >
                              <div class="form-group">
                                  <label>登陆名</label>
                                  <input type="text" id="username" name="username" placeholder="请输入登陆用户名" class="form-control">
                              </div>
                              <div class="form-group">
                                  <label>密码</label>
                                  <input type="password" id="password" name="password" placeholder="请输入登陆密码" class="form-control">
                              </div>
                              <div class="form-group">
                                  <label>姓名</label>
                                  <input type="text" id="name" name="name" placeholder="请输入姓名" class="form-control">
                              </div>
                              <div>
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

		<!-- 修改权限 -->
		<div class="modal inmodal" id="qxModal" tabindex="-1" role="dialog"	aria-hidden="true" >
			<div class="modal-dialog modal-sm">
				<div class="modal-content animated bounceInRight">
					<input type="hidden" id="editRoleUserId">
					<div class="modal-header">
					     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                         </button>
						 <h4 class="modal-title">修改权限</h4>
					</div>
					
					<div id="qxSetting" style="overflow:auto;height:300px;">
						<ul id="tree" class="tree" ></ul>
					</div>
					
					
					<div class="modal-footer">
	                     <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
	                     <button type="button" class="btn btn-primary editRole">保存</button>
	                </div>
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
    <script src="${_ctx}/source/js/plugins/zTree/2.6/jquery.ztree-2.6.min.js"></script>
	<script type="text/javascript">

		$(function(){
			
			//初始化Table
			var oTable = new TableInit();
			oTable.Init();
			
			
		})
		
		var TableInit = function () {

			var oTableInit = new Object();
			//初始化Table
			oTableInit.Init = function () {
				$('#exampleTableEvents').bootstrapTable({
					url:'${_ctx}/systemUser/findUsetListByPage',         //请求后台的URL（*）
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
					          
					          {title:'登录名',field: 'username',sortable:true },
					          {title:'登陆时间',field: 'last_login',sortable:true },
					          {title:'ip',field: 'ip',sortable:true },
					          {title:'姓名',field: 'name'},
					          {title:'操作',field:"Button",align:"center",formatter:function (value, row, index) {
					        	  return [
											'<i class="fa fa-edit editButton" style="cursor: pointer;" title="修改"></i>'+
					        	           '<button class="btn btn-info btn-xs qxButton " style="cursor: pointer;margin-left: 10px;" type="button"><i class="fa fa-paste"></i> 权限</button>'
											].join("")
					        	  
				              },events:operateEvents
					          }],
				});
			};

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
		
		
		
		
		
		
		
			  //修改
			window.operateEvents ={
					"click .editButton":function(e,value,row,index){
						  console.log(row);
						  $.ajax({
								type:"post",
								url:"${_ctx}/systemUser/findSystemUserById",
								data:{"user_id":row.user_id},
								success:function(res){
									$("#systemId").val(res.dataMap.systemUser.user_id);
									$("#username").val(res.dataMap.systemUser.username);
									$("#username").attr("disabled",true);
									$("#password").val(res.dataMap.systemUser.password);
									$("#name").val(res.dataMap.systemUser.name);
							    	$("#myModal").modal();	
								}
					    	});
					},
			  
			 //修改权限
			"click .qxButton":function(e,value,row,index){
				 $.post("${_ctx}/systemUser/editRoleByUser",{"user_id":row.user_id},function(data){
					 var setting = {
							    showLine: true,
							    checkable: true
							};
					 var zn = data.dataMap.menuList;
					 var zTreeNodes = eval(zn);
					 $.zTree = $("#tree").zTree(setting, zTreeNodes);
					 
					 
					 $("#editRoleUserId").val(row.user_id);
					 $("#qxModal").modal();
			    });
				}
			}
		
		
		  $(".editRole").click(function(){
			  var user_id= $("#editRoleUserId").val();
			    var nodes = $.zTree.getCheckedNodes();
			    var menuIds=new Array();
			    for(var i=0;i<nodes.length;i++){
			    	menuIds.push(nodes[i].id);
			    }
				var url = "${_ctx}/systemUser/toEditRoleByUser";
				var postData = {"user_id":user_id,"nodes":menuIds.toString()};
				$.post(url,postData,function(data){
					$("#qxModal").modal('hide');
				});
			  
		  })
		
		
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
	                    arrays.push(this.user_id);// cid为获得到的整条数据中的一列
	                });
	                var idcard = arrays.join(','); // 获得要删除的id
	                $.ajax({
						type:"post",
						url:"${_ctx}/systemUser/deleteSystemUser",
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
		  
		  
		    $("#addButton").on("click", function () {
		    	$("#username").val("");
		    	$("#password").val("");
		    	$("#name").val("");
		    	$("#username").attr("disabled",false);
		    	$("#myModal").modal();		
		    })
		    
		    $(".saveSubmit").on("click",function(){
		    	if(checkSaveUser()){
		    		var username = $("#username").val();
		    		var password =$("#password").val();
		    		var name =$("#name").val();
		    		var systemId =$("#systemId").val();
		    		
		    		if(systemId==""){
		    			$.ajax({
							type:"post",
							url:"${_ctx}/systemUser/addSystemUser",
							data:{"username":username,"password":password,"name":name},
							success:function(res){
								if(res.dataMap.status =="success"){
									$('#myModal').modal('hide');
									$('#exampleTableEvents').bootstrapTable(('refresh'));
								}else if(res.dataMap.status =="already"){
									//用户名已经存在
									$("#username").tips({
										side:3,
							            msg:'用户名已存在',
							            bg:'#AE81FF',
							            time:2
							        });
									$("#username").focus();
								}
							}
				    	});
		    		}else{
		    			$.ajax({
							type:"post",
							url:"${_ctx}/systemUser/deitSystemUser",
							data:{"systemId":systemId,"password":password,"name":name},
							success:function(res){
								if(res.dataMap.status =="success"){
									$('#myModal').modal('hide');
									$('#exampleTableEvents').bootstrapTable(('refresh'));
								}
							}
				    	});
		    		}
		    	}
		    })
		    
		    
		    function checkSaveUser(){
				 if($("#username").val().trim()==""){
						$("#username").tips({
							side:3,
				            msg:'请输入登陆名',
				            bg:'#AE81FF',
				            time:2
				        });
						$("#username").focus();
					 return false;
				 }
				 
				 if($("#password").val().trim()==""){
						$("#password").tips({
							side:3,
				            msg:'请输入密码',
				            bg:'#AE81FF',
				            time:2
				        });
						$("#password").focus();
					 return false;
				 }
				 
				 if($("#name").val().trim()==""){
						$("#name").tips({
							side:3,
				            msg:'请输入姓名',
				            bg:'#AE81FF',
				            time:2
				        });
						$("#name").focus();
					 return false;
				 }
				 return true;
			 }
		  
		  
		  

	</script>
	
	
	
	
	

</body>

</html>