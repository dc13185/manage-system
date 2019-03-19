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
	<style type="text/css">
	.clickStyle{
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    display: block;
	    color: #222222;
	    line-height: 32px;
	    height: 32px;
	    padding-left: 10px;
	    border-radius: 4px;
	}
	
	</style>
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
        	
        <table id="rowModel" style="display: none">
        		<tr class="rowModel" >
					<td class="bs-checkbox "></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;" model_menuName></td>
					<td style="text-align: center;" model_menuOrder></td>
					<td style="text-align: center;"><i model_menuFont	style="cursor: pointer; margin-right: 10px"></i></td>
					<td style="text-align: center; width: 160px;" model_menuUrl ></td>
					<td style="text-align: center;">
						<i	class="fa fa-edit editSonButton" style="cursor: pointer; margin-right: 10px" title="修改" ></i>
						<i class="glyphicon glyphicon-trash deleteSonButton"  style="cursor: pointer; margin-right: 10px" title="删除"></i>
					</td>
				</tr>
        
        </table>	

		<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated bounceInRight">
					<div class="modal-header">
					     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                         </button>
						 <h4 class="modal-title" id="saveOrEditModal">新增菜单</h4>
					</div>
					<div class="modal-body">
						 <form role="form">
						 	  <input type="hidden" id="menuId" name="menuId" >
                              <div class="form-group">
                                  <label>上级菜单</label>
                                  <select class="form-control m-b" name="account" id="menu_parent">
                                        
                                   </select>
                              </div>
                               <div class="form-group">
                                  <label>序号</label>
                                  <input type="number" id="menu_order" name="menu_order" placeholder="请输入菜单序号" class="form-control">
                              </div>
                              <div class="form-group">
                                  <label>菜单名</label>
                                  <input type="text" id="menu_name" name="menu_name" placeholder="请输入菜单名" class="form-control">
                              </div>
                              <div class="form-group">
                                  <label>链接</label>
                                  <input type="text" id="menu_url" name="menu_url" placeholder="请输入链接" class="form-control" disabled="true">
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
		
		
		<div class="modal inmodal" id="imgModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div id="deitMenuId"></div>
				<div class="modal-content animated bounceInRight">
					<div class="modal-header">
					     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                         </button>
						 <h4 class="modal-title">修改图标</h4>
					</div>
					<div class="modal-body">
						<div class="row fontawesome-icon-list">



                                <div class="fa-hover col-md-3 col-sm-4"><a href="#adjust"><i class="fa fa-adjust"></i> adjust</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#anchor"><i class="fa fa-anchor"></i> anchor</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#archive"><i class="fa fa-archive"></i> archive</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#area-chart"><i class="fa fa-area-chart"></i> area-chart</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#arrows"><i class="fa fa-arrows"></i> arrows</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#arrows-h"><i class="fa fa-arrows-h"></i> arrows-h</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#arrows-v"><i class="fa fa-arrows-v"></i> arrows-v</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#asterisk"><i class="fa fa-asterisk"></i> asterisk</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#at"><i class="fa fa-at"></i> at</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#car"><i class="fa fa-automobile"></i> automobile <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#balance-scale"><i class="fa fa-balance-scale"></i> balance-scale</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#ban"><i class="fa fa-ban"></i> ban</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#university"><i class="fa fa-bank"></i> bank <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bar-chart"><i class="fa fa-bar-chart"></i> bar-chart</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bar-chart"><i class="fa fa-bar-chart-o"></i> bar-chart-o <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#barcode"><i class="fa fa-barcode"></i> barcode</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bars"><i class="fa fa-bars"></i> bars</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#battery-empty"><i class="fa fa-battery-0"></i> battery-0 <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#battery-quarter"><i class="fa fa-battery-1"></i> battery-1 <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#battery-half"><i class="fa fa-battery-2"></i> battery-2 <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#battery-three-quarters"><i class="fa fa-battery-3"></i> battery-3 <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#battery-full"><i class="fa fa-battery-4"></i> battery-4 <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#battery-empty"><i class="fa fa-battery-empty"></i> battery-empty</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#battery-full"><i class="fa fa-battery-full"></i> battery-full</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#battery-half"><i class="fa fa-battery-half"></i> battery-half</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#battery-quarter"><i class="fa fa-battery-quarter"></i> battery-quarter</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#battery-three-quarters"><i class="fa fa-battery-three-quarters"></i> battery-three-quarters</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bed"><i class="fa fa-bed"></i> bed</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#beer"><i class="fa fa-beer"></i> beer</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bell"><i class="fa fa-bell"></i> bell</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bell-o"><i class="fa fa-bell-o"></i> bell-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bell-slash"><i class="fa fa-bell-slash"></i> bell-slash</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bell-slash-o"><i class="fa fa-bell-slash-o"></i> bell-slash-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bicycle"><i class="fa fa-bicycle"></i> bicycle</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#binoculars"><i class="fa fa-binoculars"></i> binoculars</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#birthday-cake"><i class="fa fa-birthday-cake"></i> birthday-cake</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bolt"><i class="fa fa-bolt"></i> bolt</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bomb"><i class="fa fa-bomb"></i> bomb</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#book"><i class="fa fa-book"></i> book</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bookmark"><i class="fa fa-bookmark"></i> bookmark</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bookmark-o"><i class="fa fa-bookmark-o"></i> bookmark-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#briefcase"><i class="fa fa-briefcase"></i> briefcase</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bug"><i class="fa fa-bug"></i> bug</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#building"><i class="fa fa-building"></i> building</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#building-o"><i class="fa fa-building-o"></i> building-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bullhorn"><i class="fa fa-bullhorn"></i> bullhorn</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bullseye"><i class="fa fa-bullseye"></i> bullseye</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bus"><i class="fa fa-bus"></i> bus</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#taxi"><i class="fa fa-cab"></i> cab <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#calculator"><i class="fa fa-calculator"></i> calculator</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#calendar"><i class="fa fa-calendar"></i> calendar</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#calendar-check-o"><i class="fa fa-calendar-check-o"></i> calendar-check-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#calendar-minus-o"><i class="fa fa-calendar-minus-o"></i> calendar-minus-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#calendar-o"><i class="fa fa-calendar-o"></i> calendar-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#calendar-plus-o"><i class="fa fa-calendar-plus-o"></i> calendar-plus-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#calendar-times-o"><i class="fa fa-calendar-times-o"></i> calendar-times-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#camera"><i class="fa fa-camera"></i> camera</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#camera-retro"><i class="fa fa-camera-retro"></i> camera-retro</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#car"><i class="fa fa-car"></i> car</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#caret-square-o-down"><i class="fa fa-caret-square-o-down"></i> caret-square-o-down</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#caret-square-o-left"><i class="fa fa-caret-square-o-left"></i> caret-square-o-left</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#caret-square-o-right"><i class="fa fa-caret-square-o-right"></i> caret-square-o-right</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#caret-square-o-up"><i class="fa fa-caret-square-o-up"></i> caret-square-o-up</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cart-arrow-down"><i class="fa fa-cart-arrow-down"></i> cart-arrow-down</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cart-plus"><i class="fa fa-cart-plus"></i> cart-plus</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cc"><i class="fa fa-cc"></i> cc</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#certificate"><i class="fa fa-certificate"></i> certificate</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#check"><i class="fa fa-check"></i> check</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#check-circle"><i class="fa fa-check-circle"></i> check-circle</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#check-circle-o"><i class="fa fa-check-circle-o"></i> check-circle-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#check-square"><i class="fa fa-check-square"></i> check-square</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#check-square-o"><i class="fa fa-check-square-o"></i> check-square-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#child"><i class="fa fa-child"></i> child</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#circle"><i class="fa fa-circle"></i> circle</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#circle-o"><i class="fa fa-circle-o"></i> circle-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#circle-o-notch"><i class="fa fa-circle-o-notch"></i> circle-o-notch</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#circle-thin"><i class="fa fa-circle-thin"></i> circle-thin</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#clock-o"><i class="fa fa-clock-o"></i> clock-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#clone"><i class="fa fa-clone"></i> clone</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#times"><i class="fa fa-close"></i> close <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cloud"><i class="fa fa-cloud"></i> cloud</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cloud-download"><i class="fa fa-cloud-download"></i> cloud-download</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cloud-upload"><i class="fa fa-cloud-upload"></i> cloud-upload</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#code"><i class="fa fa-code"></i> code</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#code-fork"><i class="fa fa-code-fork"></i> code-fork</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#coffee"><i class="fa fa-coffee"></i> coffee</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cog"><i class="fa fa-cog"></i> cog</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cogs"><i class="fa fa-cogs"></i> cogs</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#comment"><i class="fa fa-comment"></i> comment</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#comment-o"><i class="fa fa-comment-o"></i> comment-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#commenting"><i class="fa fa-commenting"></i> commenting</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#commenting-o"><i class="fa fa-commenting-o"></i> commenting-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#comments"><i class="fa fa-comments"></i> comments</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#comments-o"><i class="fa fa-comments-o"></i> comments-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#compass"><i class="fa fa-compass"></i> compass</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#copyright"><i class="fa fa-copyright"></i> copyright</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#creative-commons"><i class="fa fa-creative-commons"></i> creative-commons</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#credit-card"><i class="fa fa-credit-card"></i> credit-card</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#crop"><i class="fa fa-crop"></i> crop</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#crosshairs"><i class="fa fa-crosshairs"></i> crosshairs</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cube"><i class="fa fa-cube"></i> cube</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cubes"><i class="fa fa-cubes"></i> cubes</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cutlery"><i class="fa fa-cutlery"></i> cutlery</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#tachometer"><i class="fa fa-dashboard"></i> dashboard <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#database"><i class="fa fa-database"></i> database</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#desktop"><i class="fa fa-desktop"></i> desktop</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#diamond"><i class="fa fa-diamond"></i> diamond</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#dot-circle-o"><i class="fa fa-dot-circle-o"></i> dot-circle-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#download"><i class="fa fa-download"></i> download</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#pencil-square-o"><i class="fa fa-edit"></i> edit <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#ellipsis-h"><i class="fa fa-ellipsis-h"></i> ellipsis-h</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#ellipsis-v"><i class="fa fa-ellipsis-v"></i> ellipsis-v</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#envelope"><i class="fa fa-envelope"></i> envelope</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#envelope-o"><i class="fa fa-envelope-o"></i> envelope-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#envelope-square"><i class="fa fa-envelope-square"></i> envelope-square</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#eraser"><i class="fa fa-eraser"></i> eraser</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#exchange"><i class="fa fa-exchange"></i> exchange</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#exclamation"><i class="fa fa-exclamation"></i> exclamation</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#exclamation-circle"><i class="fa fa-exclamation-circle"></i> exclamation-circle</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#exclamation-triangle"><i class="fa fa-exclamation-triangle"></i> exclamation-triangle</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#external-link"><i class="fa fa-external-link"></i> external-link</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#external-link-square"><i class="fa fa-external-link-square"></i> external-link-square</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#eye"><i class="fa fa-eye"></i> eye</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#eye-slash"><i class="fa fa-eye-slash"></i> eye-slash</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#eyedropper"><i class="fa fa-eyedropper"></i> eyedropper</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#fax"><i class="fa fa-fax"></i> fax</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#rss"><i class="fa fa-feed"></i> feed <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#female"><i class="fa fa-female"></i> female</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#fighter-jet"><i class="fa fa-fighter-jet"></i> fighter-jet</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-archive-o"><i class="fa fa-file-archive-o"></i> file-archive-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-audio-o"><i class="fa fa-file-audio-o"></i> file-audio-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-code-o"><i class="fa fa-file-code-o"></i> file-code-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-excel-o"><i class="fa fa-file-excel-o"></i> file-excel-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-image-o"><i class="fa fa-file-image-o"></i> file-image-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-video-o"><i class="fa fa-file-movie-o"></i> file-movie-o <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-pdf-o"><i class="fa fa-file-pdf-o"></i> file-pdf-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-image-o"><i class="fa fa-file-photo-o"></i> file-photo-o <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-image-o"><i class="fa fa-file-picture-o"></i> file-picture-o <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-powerpoint-o"><i class="fa fa-file-powerpoint-o"></i> file-powerpoint-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-audio-o"><i class="fa fa-file-sound-o"></i> file-sound-o <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-video-o"><i class="fa fa-file-video-o"></i> file-video-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-word-o"><i class="fa fa-file-word-o"></i> file-word-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#file-archive-o"><i class="fa fa-file-zip-o"></i> file-zip-o <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#film"><i class="fa fa-film"></i> film</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#filter"><i class="fa fa-filter"></i> filter</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#fire"><i class="fa fa-fire"></i> fire</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#fire-extinguisher"><i class="fa fa-fire-extinguisher"></i> fire-extinguisher</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#flag"><i class="fa fa-flag"></i> flag</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#flag-checkered"><i class="fa fa-flag-checkered"></i> flag-checkered</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#flag-o"><i class="fa fa-flag-o"></i> flag-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bolt"><i class="fa fa-flash"></i> flash <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#flask"><i class="fa fa-flask"></i> flask</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#folder"><i class="fa fa-folder"></i> folder</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#folder-o"><i class="fa fa-folder-o"></i> folder-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#folder-open"><i class="fa fa-folder-open"></i> folder-open</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#folder-open-o"><i class="fa fa-folder-open-o"></i> folder-open-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#frown-o"><i class="fa fa-frown-o"></i> frown-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#futbol-o"><i class="fa fa-futbol-o"></i> futbol-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#gamepad"><i class="fa fa-gamepad"></i> gamepad</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#gavel"><i class="fa fa-gavel"></i> gavel</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cog"><i class="fa fa-gear"></i> gear <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#cogs"><i class="fa fa-gears"></i> gears <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#gift"><i class="fa fa-gift"></i> gift</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#glass"><i class="fa fa-glass"></i> glass</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#globe"><i class="fa fa-globe"></i> globe</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#graduation-cap"><i class="fa fa-graduation-cap"></i> graduation-cap</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#users"><i class="fa fa-group"></i> group <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hand-rock-o"><i class="fa fa-hand-grab-o"></i> hand-grab-o <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hand-lizard-o"><i class="fa fa-hand-lizard-o"></i> hand-lizard-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hand-paper-o"><i class="fa fa-hand-paper-o"></i> hand-paper-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hand-peace-o"><i class="fa fa-hand-peace-o"></i> hand-peace-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hand-pointer-o"><i class="fa fa-hand-pointer-o"></i> hand-pointer-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hand-rock-o"><i class="fa fa-hand-rock-o"></i> hand-rock-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hand-scissors-o"><i class="fa fa-hand-scissors-o"></i> hand-scissors-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hand-spock-o"><i class="fa fa-hand-spock-o"></i> hand-spock-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hand-paper-o"><i class="fa fa-hand-stop-o"></i> hand-stop-o <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hdd-o"><i class="fa fa-hdd-o"></i> hdd-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#headphones"><i class="fa fa-headphones"></i> headphones</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#heart"><i class="fa fa-heart"></i> heart</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#heart-o"><i class="fa fa-heart-o"></i> heart-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#heartbeat"><i class="fa fa-heartbeat"></i> heartbeat</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#history"><i class="fa fa-history"></i> history</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#home"><i class="fa fa-home"></i> home</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#bed"><i class="fa fa-hotel"></i> hotel <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hourglass"><i class="fa fa-hourglass"></i> hourglass</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hourglass-start"><i class="fa fa-hourglass-1"></i> hourglass-1 <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hourglass-half"><i class="fa fa-hourglass-2"></i> hourglass-2 <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hourglass-end"><i class="fa fa-hourglass-3"></i> hourglass-3 <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hourglass-end"><i class="fa fa-hourglass-end"></i> hourglass-end</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hourglass-half"><i class="fa fa-hourglass-half"></i> hourglass-half</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hourglass-o"><i class="fa fa-hourglass-o"></i> hourglass-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#hourglass-start"><i class="fa fa-hourglass-start"></i> hourglass-start</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#i-cursor"><i class="fa fa-i-cursor"></i> i-cursor</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#picture-o"><i class="fa fa-image"></i> image <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#inbox"><i class="fa fa-inbox"></i> inbox</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#industry"><i class="fa fa-industry"></i> industry</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#info"><i class="fa fa-info"></i> info</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#info-circle"><i class="fa fa-info-circle"></i> info-circle</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#university"><i class="fa fa-institution"></i> institution <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#key"><i class="fa fa-key"></i> key</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#keyboard-o"><i class="fa fa-keyboard-o"></i> keyboard-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#language"><i class="fa fa-language"></i> language</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#laptop"><i class="fa fa-laptop"></i> laptop</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#leaf"><i class="fa fa-leaf"></i> leaf</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#gavel"><i class="fa fa-legal"></i> legal <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#lemon-o"><i class="fa fa-lemon-o"></i> lemon-o</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#level-down"><i class="fa fa-level-down"></i> level-down</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#level-up"><i class="fa fa-level-up"></i> level-up</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#life-ring"><i class="fa fa-life-bouy"></i> life-bouy <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#life-ring"><i class="fa fa-life-buoy"></i> life-buoy <span class="text-muted">(alias)</span></a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#life-ring"><i class="fa fa-life-ring"></i> life-ring</a></div>

                                <div class="fa-hover col-md-3 col-sm-4"><a href="#life-ring"><i class="fa fa-life-saver"></i> life-saver <span class="text-muted">(alias)</span></a></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary saveMenuFont">保存</button>
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
	<script type="text/javascript">
	
		$(function(){
			echoMenu();
			//初始化Table
			var oTable = new TableInit();
			oTable.Init();		
			
		})
		
		var TableInit = function () {

			var oTableInit = new Object();
			//初始化Table
			oTableInit.Init = function () {
				$('#exampleTableEvents').bootstrapTable({
					url:'${_ctx}/menuAction/findMenuList',         //请求后台的URL（*）
					method: 'post',                      //请求方式（*）
					toolbar: '#exampleTableEventsToolbar',                //工具按钮用哪个容器
					striped: true,                      //是否显示行间隔色
					cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
					pagination: false,                   //是否显示分页（*）
					sortable: false,                     //是否启用排序
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
					showExport: false,                     //是否显示导出
					buttonsAlign:"right",  //按钮位置
			        exportDataType: "selected",              //basic', 'all', 'selected'.
			        exportTypes:['excel','txt','json', 'xml'],  //导出文件类型   //'json', 'xml', 'csv', 'txt', 'sql', 'excel'
			        Icons:'glyphicon-export',
					responseHandler:function(res) {
						  return {
			                    //"total": res.menus.total,//总页数
			                    "rows": res.dataMap.menus   //数据
			                 };
					},
				/*  	icons: {
					        refresh: 'glyphicon-repeat',
					        toggle: 'glyphicon-list-alt',
					        columns: 'glyphicon-list'
					}, */
					columns: [
					          {checkbox: true },
					          {
					              title: '序号',
					              field: '',
					              align: 'center',
					              formatter: function (value, row, index) {
					                  return index+1;
					              }
					          },
					          
					          {title:'菜单名',field: 'menu_name',align:"center",sortable:true },
					          {title:'排序号',field: 'menu_order',align:"center",sortable:true },
					          {title:'图标',field: 'menu_font',align:"center",sortable:true,formatter:function (value, row, index) {
					        	  return [
											'<i class="'+row.menu_font+'" style="cursor: pointer;margin-right: 10px"  ></i>'
					        	          ].join("")
					        	  
				              } },
					          {title:'链接',field: 'menu_url',align:"center",sortable:true },
					          {title:'操作',field:"Button",align:"center",formatter:function (value, row, index) {
					        	  return [
											'<i class="fa fa-folder-open-o openButton" style="cursor: pointer;margin-right: 10px" title="展开" ></i>'+
											'<i class="fa fa-edit editButton" style="cursor: pointer; margin-right: 10px" title="修改" ></i> '+
											'<i class="fa fa-file-image-o imgButton" style="cursor: pointer; margin-right: 10px" title="选择图标" ></i> '
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
					//修改方法
					"click .editButton":function(e,value,row,index){
						editMenu(row.menu_id);
					},
					//修改图标
					"click .imgButton":function(e,value,row,index){
						  console.log(row);
						  $(".fa-hover").children().css("background-color","")
						  $.MENU_FONT="";
						  $("#deitMenuId").val(row.menu_id);
						  $("#imgModal").modal();
					},
					//展开菜单
					"click .openButton":function(e,value,row,index){
						//fa fa-chevron-up
						openMenu(row,index);
					}
				
			}
	    //修改菜单方法
	    function editMenu(menu_id){
			 $.post("${_ctx}/menuAction/findMenuById",{"menu_id":menu_id},function(data){
				 	 $("#menuId").val(data.dataMap.menu.menu_id);
				 	 $("#menu_parent").val(data.dataMap.menu.parent_id);
				 	 $("#menu_name").val(data.dataMap.menu.menu_name);
				     $("#menu_url").val(data.dataMap.menu.menu_url);
				     $("#menu_order").val(data.dataMap.menu.menu_order);
				     $("#saveOrEditModal").text("修改菜单");
					 $("#myModal").modal();	
			    });
	    } 
			  
		//展开菜单方法
		function openMenu(row,index){
			 if(row!='null'){
				 $.ROW = row;
			 }
			 $.post("${_ctx}/menuAction/findMenuByParentId",{"parent_id":$.ROW.menu_id},function(data){
				 var sonMenus = data.dataMap.sonMenus;
				 for(var i=0;i<sonMenus.length;i++){
					 var rowModel = $("#rowModel").find(".rowModel").clone();
					 rowModel.attr("class",sonMenus[i].parentMenu.menu_id);
					 rowModel.attr("id",sonMenus[i].menu_id);
					 rowModel.children("[model_menuName]").text(sonMenus[i].menu_name);
					 rowModel.children("[model_menuOrder]").text(sonMenus[i].menu_order);
					 //rowModel.find("#model_menuFont").text(sonMenus[i].menu_name);
					 rowModel.children("[model_menuUrl]").text(sonMenus[i].menu_url);
					 $("[data-index='"+index+"']")[0].after(rowModel[0]);
					 rowModel.find(".deleteSonButton").attr("onclick","deleteButton('"+sonMenus[i].menu_id+"')")	
					 rowModel.find(".editSonButton").attr("onclick","editMenu('"+sonMenus[i].menu_id+"')")
				 }
		    });
			 $("[data-index='"+index+"']").find(".openButton").removeClass("fa-folder-open-o");
			 $("[data-index='"+index+"']").find(".openButton").addClass("fa-chevron-up");
			 $("[data-index='"+index+"']").find(".openButton").attr("title","折叠");
			 $("[data-index='"+index+"']").find(".openButton").unbind('click');
			 $("[data-index='"+index+"']").find(".openButton").attr("onClick","take('"+$.ROW.menu_id+"','"+index+"')");
			 
         	 
		}
		
		
		
		//菜单回显方法
		function echoMenu(){
			$.post("${_ctx}/menuAction/echoMenu",function(data){
				var  menus = data.dataMap.menus;
				$("#menu_parent").find("option").remove();
				$("#menu_parent").append('<option value="0">作为顶级菜单</option>'); 
				for(var i=0;i<menus.length;i++){
					var model='<option value="'+menus[i][0]+'">'+menus[i][1]+'</option>';
					$("#menu_parent").append(model);
				}
			 })
			
		}
		//折叠方法
		function take(parent_id,index){
			$("."+parent_id).remove();
			$("[data-index='"+index+"']").find(".openButton").removeClass("fa-chevron-up");
			$("[data-index='"+index+"']").find(".openButton").addClass("fa-folder-open-o");
		    $("[data-index='"+index+"']").find(".openButton").attr("title","展开");
			$("[data-index='"+index+"']").find(".openButton").unbind('click');
			$("[data-index='"+index+"']").find(".openButton").attr("onClick","openMenu('null','"+index+"')");
			
		} 
		
		
		 $("#menu_parent").on("change",function(){
			if($(this).val()=='0'){
				 $("#menu_url").attr("disabled",true)
			 }else{
				 $("#menu_url").removeAttr("disabled")	
			 }
		 })
			
		  //删除
		  function deleteButton(id){
			 var idcard
				if(!id){
		            // $("#table").bootstrapTable('getSelections');为bootstrapTable自带的，所以说一定要使用bootstrapTable显示表格,#table：为table的id
		            var rows = $("#exampleTableEvents").bootstrapTable('getSelections');
		            console.log(rows);
		            if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
		                alert("请先选择要删除的记录!");
		                return;
		            }else {
		                var arrays = new Array();// 声明一个数组
		                $(rows).each(function () {// 通过获得别选中的来进行遍历
		                    arrays.push(this.menu_id);// cid为获得到的整条数据中的一列
		                });
		                idcard= arrays.join(','); // 获得要删除的id
		            }
	            }else{
	            	idcard=id;
	            }
	                
	                $.ajax({
						type:"post",
						url:"${_ctx}/menuAction/deleteMenus",
						data:{"idcard":idcard},
						success:function(res){
							if(res.dataMap.status =="success"){
								//删除成功
								if(!id){
									$('#exampleTableEvents').bootstrapTable(('refresh'));
								}else{
									$('#'+id).remove();
									
								}
							}
						}
			    	});   
	           
	            }

		
		  $("#deleteButton").on("click", function () {
			  deleteButton();
		  })
		
		  
		  
		    $("#addButton").on("click", function () {
		    	echoMenu();
		    	$("#menu_name").val("");
		    	$("#menu_url").val("");
		    	$("#menu_order").val("");
		    	$("#menuId").val("");
		    	$("#saveOrEditModal").text("新增菜单");
		    	$("#myModal").modal();		
		    })
		    
		    $(".saveSubmit").on("click",function(){
		    	saveOrEdit();
		    })
		    
		    function saveOrEdit(){
				if(checkSaveUser()){
		    		var name = $("#menu_name").val();
		    		var url =$("#menu_url").val();
		    		var order =$("#menu_order").val();
		    		var menuId =$("#menuId").val();
		    		var menu_parent =$("#menu_parent").val();
		    		$(".saveSubmit").unbind();	
		    		$.ajax({
						type:"post",
						url:"${_ctx}/menuAction/saveOrEditMenu",
						data:{"name":name,"order":order,"url":url,"menuId":menuId,"menu_parent":menu_parent},
						success:function(res){
							if(res.dataMap.status =="success"){
								$(".saveSubmit").bind('click',saveOrEdit);
								$('#myModal').modal('hide');
								$('#exampleTableEvents').bootstrapTable(('refresh'));
							}
						}
			    	});
		    	}
				  
			  }
		    
		    
		    function checkSaveUser(){
				 if($("#menu_name").val().trim()==""){
						$("#menu_name").tips({
							side:3,
				            msg:'请输入菜单名',
				            bg:'#AE81FF',
				            time:2
				        });
						$("#username").focus();
					 return false;
				 }
				 
				 if($("#menu_order").val().trim()==""){
						$("#menu_order").tips({
							side:3,
				            msg:'请输入序号',
				            bg:'#AE81FF',
				            time:2
				        });
						$("#password").focus();
					 return false;
				 }
				 
				 return true;
			 }
		  
		  
		  
	//选择图标模块
	$(".fa-hover").click(function(e){
		$(".fa-hover").children().css("background-color","")
		$(this).children().css("background-color","#1d9d74");
		$.MENU_FONT = $(this).children().find(".fa").attr("class");
	})
	
	$(".saveMenuFont").click(function(){
		var deitMenuId =$("#deitMenuId").val();
		if($.MENU_FONT==""){
			alert("请选择图标");
		}
		$.ajax({
			url:"${_ctx}/menuAction/deitMenuFont",
			type:"post",
			data:{"deitMenuId":deitMenuId,"menu_font":$.MENU_FONT},
			success:function(res){
				$('#imgModal').modal('hide');
				$('#exampleTableEvents').bootstrapTable(('refresh'));
			}
    	});
		
		
	})
	
	</script>
	
	
	
	
	

</body>

</html>