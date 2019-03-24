<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/source/base/taglibs.jsp"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>财务统计</title>
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
    <style>
        .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
    </style>
</head>
<body class="gray-bg">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>财务统计</h5>
            </div>
         <div class="ibox-content">
             <div class="modal-content animated bounceInRight ">
                 <div class="modal-body ">
                     <input type="text" class="demo-input" placeholder="请选择日期" id="data-range">
                     <button type="button" class="btn btn-primary saveSubmit">查询</button>
                 </div>
                 <div class="modal-body ">
                     <div id="container" style="height: 700px;"></div>
                 </div>
             </div>
	</div>

</div>

               

    <!-- 全局js -->
    <!-- 印日日期控件js -->
    <script src="${_ctx}/source/js/plugins/laydate/laydate.js"></script>
    <script src="${_ctx}/source/js/jquery.min.js?v=2.1.4"></script>
    <script src="${_ctx}/source/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="${_ctx}/source/js/content.js?v=1.0.0"></script>
    <script src="${_ctx}/source/js/plugins/echarts/echarts.min.js"></script>
    <!-- 印日日期控件js -->
    <!-- Bootstrap table -->
    <script src="${_ctx}/source/js/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="${_ctx}/source/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script> 
    <script src="${_ctx}/source/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script> 
    <script src="${_ctx}/source/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${_ctx}/source/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${_ctx}/source/js/plugins/tips/jquery.tips.js"></script>
    <script src="${_ctx}/source/js/plugins/cropper/cropper.min.js"></script>


	<script type="text/javascript">
    $(function(){
        showDates('');  //初始化 按照最近一个月起
        laydate.render({
            elem: '#data-range',
            event: 'focus',
            range: true
        });

        $(".saveSubmit").click(function(){
            var dataRange = $("#data-range").val();
            if(dataRange == ""){
                alert("请选择时间范围");
            }else{
                showDates(dataRange);
            }
        })
    });

    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    app.title = '坐标轴刻度与标签对齐';

    option = {
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                axisTick: {
                    alignWithLabel: true
                }
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'消费金额(¥)',
                type:'bar',
                barWidth: '60%',
            }
        ]
    };

    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }



    function showDates(dataRange){

        $.ajax({
            type:"post",
            url:"${_ctx}/financeAction/statisticalData",
            data:{"dataRange":dataRange},
            success:function(res){
                debugger;
                var totalSum = res.dataMap.totalSum;
                var xDatas = [];
                var yDatas = [];
                for (var i = 0; i <totalSum.length ; i++) {
                    var money =parseInt(totalSum[i][0]);
                    yDatas.push(money/100);
                    xDatas.push(totalSum[i][1])
                }
                myChart.setOption({
                    xAxis:{
                        data:xDatas
                    },
                    series:{
                        data:yDatas
                    }
                })
            }
        });
    }
	</script>


</body>

</html>