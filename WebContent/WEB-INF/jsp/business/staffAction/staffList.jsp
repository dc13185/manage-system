<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                <h5>员工管理</h5>
            </div>
         <div class="ibox-content">
           <!-- 表格 -->
			 <div class="row row-lg">
				<div class="col-sm-12">
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
	</div>

        <!-- 新增修改菜单 -->
        <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated bounceInRight">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                        </button>
                        <h4 class="modal-title">新增员工</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form">
                            <input type="hidden" id="staffId" name="staffId" >
                            <div class="form-group">
                                <label>员工名</label>
                                <input type="text" id="staffName" name="staffName" placeholder="请输入员工名字" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>员工职位</label>
                                <input type="text" id="staffPosition" name="staffPosition" placeholder="请输入员工职位" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>员工住址</label>
                                <input type="text" id="staffAddress" name="staffAddress" placeholder="请输入家庭地址" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>员工电话</label>
                                <input type="text" id="phone" name="phone" placeholder="请输入员工电话" class="form-control">
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
	 var widths=136;
	 var heights=150;
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
					url:'${_ctx}/staffAction/findStaffListByPage',         //请求后台的URL（*）
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
					pageSize: 5,                       //每页的记录行数（*）
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
					          
					          {title:'员工编号',field: 'staffId',sortable:true ,align:"center" },
					          // {title:'价格',field: 'money',align:"center",sortable:true ,formatter: function (value, row, index) {
					        	//   var price = parseInt(value)/100
					        	//   return price;
				              // }
					          // },
                              {title:'姓名',align:"center",align:"center",field: 'staffName'},
                              {title:'员工职位',align:"center",align:"center",field: 'staffPosition'},
					          {title:'家庭地址',align:"center",align:"center",field: 'staffAddress'},
					          {title:'电话号码',align:"center",align:"center",field: 'phone'},
					          {title:'创建时间',align:"center",align:"center",field: 'createDate',formatter: function (value, row, index) {
                                      return  (value.split("T"))[0];
                                          }},
                              {title:'操作',field:"Button",align:"center",formatter:function (value, row, index) {
                                        return [
                                            '<i class="fa fa-edit editButton" style="cursor: pointer;" ></i>'
                                        ].join("")

                                    },events:operateEvents
                              }
					      ],
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
							$("#staffId").val(row.staffId);
							$("#staffName").val(row.staffName);
							$("#staffPosition").val(row.staffPosition);
							$("#staffAddress").val(row.staffAddress);
                            $("#phone").val(row.phone);
                            $("#createDate").val(row.createDate);
							if($.cropper){
								$('#weui-cell__ft_test').cropper("destroy");
							}
					    	$("#myModal").modal();
					}
			  }
		
		
		
		
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
	                    arrays.push(this.staffId);// cid为获得到的整条数据中的一列
	                });
	                var idcard = arrays.join(','); // 获得要删除的id
	                $.ajax({
						type:"post",
						url:"${_ctx}/staffAction/deleteStaffByIds",
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
		    	$("#staffName").val("");
                $("#staffId").val("");
		    	$("#staffPosition").val("");
		    	$("#staffAddress").val("");
		    	$("#phone").val("");
				//$(this).parents(".uploader").find(".filename").val($(this).val());
		    	$("#myModal").modal();
		    })
		    
		    $(".saveSubmit").on("click",function(){
		    	var staffId = $("#staffId").val();
		    	var staffName = $("#staffName").val();
		    	var staffPosition=$("#staffPosition").val();
		       	var phone =$("#phone").val();
                var staffAddress =$("#staffAddress").val();

		       	if(staffName==''){
		       		$("#staffName").tips({
						side:2,
			            msg:'请填写员工姓名',
			            bg:'#AE81FF',
			            time:2
			        });
		       	}
		       	if(staffId == null || staffId==""){
                    $.post("${_ctx}/staffAction/addStaff",{"staffId":staffId,"staffName":staffName,"staffPosition":staffPosition,"phone":phone,"staffAddress":staffAddress},function(data){
                        $("#myModal").modal('hide');
                        $('#exampleTableEvents').bootstrapTable(('refresh'));
                    });
                }else{
                    $.post("${_ctx}/staffAction/editStaffInfo",{"staffId":staffId,"staffName":staffName,"staffPosition":staffPosition,"phone":phone,"staffAddress":staffAddress},function(data){
                        $("#myModal").modal('hide');
                        $('#exampleTableEvents').bootstrapTable(('refresh'));
                    });
                }

		       	
		    	
		    })
		    
	

	</script>
	
	
	
	
	

</body>

</html>