<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	<link rel="stylesheet" href="static/html_UI/assets/css/jquery.gritter.css" />
	<link rel="stylesheet" href="static/ace/css/bootstrap-table.min.css">

	<%--表单--%>
	<link rel="stylesheet" href="static/css/form.css">
	<style>
    .input-group{
	    width:270px;
	 }
    .number{
	    width:70px;
	 }
    .search-label{
    	width:90px;
    	text-align: right;
	 }
	 .search-content{
	 	width: 149px;
	 }
</style>
</head>
<body class="no-skin" style="overflow: hidden;">
	
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container" style="position:absolute;width:100%; height:100%">
		<!-- /section:basics/sidebar -->
		<div id="mapDiv" style="position:absolute;z-index:0;width:100%; height:100%">
		</div>
		<!-- /.main-content -->	
		
		<div class="heading" id="map-search-data-toorbar">
		
			<!--  缪秀诚删除
			<button id="map-search-data-toorbar-djjc" type="button" class="btn btn-sm map-search-data-type">地基监测</button>  
	        <button id="map-search-data-toorbar-gjjc" type="button" class="btn btn-sm map-search-data-type">构件监测</button> 
	        <button id="map-search-data-toorbar-wfjd" type="button" class="btn btn-sm map-search-data-type">危房鉴定</button>
	        <button id="map-search-data-toorbar-fwcz" type="button" class="btn btn-sm map-search-data-type">房屋处置</button>
	          -->
	          
	        <button id="map-search-data-toorbar-fwgk" type="button" class="btn btn-sm">信息概况</button>  
	        <button id="map-search-data-toorbar-sxgx" type="button" class="btn btn-sm">信息更新</button>  
	        <button id="map-search-data-toorbar-qlr" type="button" class="btn btn-sm">添加治理方案</button> 
	        <!-- <button id="map-search-data-toorbar-ckjdjg" type="button" class="btn btn-sm">查看鉴定结果</button>  --> 
	      <!--   <button id="map-search-data-toorbar-hdcbg" type="button" class="btn btn-sm" >导出表格</button>  -->
	        <button id="map-search-data-toorbar-close" type="button" class="btn btn-sm">关闭</button>   
        </div>  
		<div id="map-search-data-div" class="" style="z-index:999;position: absolute;bottom: 0px;left: 0px;right: 0px;display: none;">										
			<table id="map-search-data" style="background-color: rgba(242, 242, 242, 0.9);" class="table table-striped table-bordered table-hover no-border-top">
			</table>						
		</div>
		<!--  缪秀诚删除
		<div class="heading" id="householder-map-search-data-toorbar">  
	        <button id="" type="button" class="btn btn-sm">更新户</button>  
	        <button id="" type="button" class="btn btn-sm">删除户</button>   
	        <button id="" type="button" class="btn btn-sm">导出表格</button>  
	        <button id="householder-map-search-data-toorbar-close" type="button" class="btn btn-sm">关闭</button>   
        </div> 
		<div id="householder-map-search-data-div" class="" style="z-index:999;height:30%;margin-top:30%;display: none;">					
			<table id="householder-map-search-data" style="opacity: 0.8;filter:alpha(opacity=70);" class="table table-striped table-bordered table-hover no-border-top">						  
			</table>					
		</div>	 -->
	</div>


	
		<!-- 图例 -->	
	<div class="" id="map-legend" style="opacity: 0.9;filter:alpha(opacity=90);;position:absolute;width:120px; height:200px;z-index:900; right:0px;bottom:0px">
		<button id="map-legend-btn" type="button" style="height: 35px;width: 120px;text-align: center;" class="btn">图例</button>						
		<div id="" class="sidebar">						 				

		   <%--原拆原建--%>
		   <div class="row" style="height: 20px;width: 160px;margin-top: 25px;margin-left:6px">
			
			   <img class="col-xs-6 col-sm-3" src="static/images/levelD.png"></img>
			   <label class="col-xs-6 col-sm-6">暂无</label>
		   </div>
		   
		   <%--修缮加固--%>
		   <div class="row" style="height: 20px;width: 160px;margin-top: 25px;margin-left:6px">
			 
			   <img class="col-xs-6 col-sm-3" src="static/images/levelB.png"></img>
			   <label class="col-xs-6 col-sm-6">搬迁避让</label>
		   </div>

		   <%--拆除--%>
		   <div class="row" style="height: 20px;width: 160px;margin-top: 25px;margin-left:6px">
		
			   <img class="col-xs-6 col-sm-3" src="static/images/levelC.png"></img>
			   <label class="col-xs-6 col-sm-6">工程治理</label>
		   </div>

		</div><!-- .sidebar -->
	</div>
	
<!-- 添加的模态框(灾害点概况) -->
  <div class="modal fade" id="account-Manager-add-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:360px;margin-top:68px;margin-left:0px">
		<div class="modal-content">
			<div class="modal-header" style="text-align:center;font-size:12px">
				<button type="button" class="close" data-dismiss="modal" id="fwgk-close" aria-hidden="true">&times;</button> 
				<h5 class="modal-title" id="">信息概况</h5>
			</div>
			<div class="modal-body" style="height: 100%;margin-right:10px">
				<form class="form-horizontal" role="form" id ="form-test">
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">计划时间:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "strplancompletiontime" class="form-control" readonly="readonly"> 
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">名称:</label>
						<input class="col-sm-6" style="height:26px" name = "name" type="text" class="form-control" readonly="readonly">
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">地址:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "location" class="form-control" readonly="readonly">
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">灾害类型:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "govertype" class="form-control" readonly="readonly">
					</div>
				  
				    <div style="text-align: right;" class="form-group">
						<label class="col-sm-5">规模:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "scale" class="form-control" readonly="readonly">
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">规模等级:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "scalegrad" class="form-control" readonly="readonly">
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">稳定性:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "thisstage" class="form-control" readonly="readonly"> 
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">治理进度(%):</label>
						<input class="col-sm-6" style="height:26px" name = "completion" type="text" class="form-control" readonly="readonly">
					</div>

				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<!-- 添加的模态框(属性更新) -->
  <div class="modal fade" id="account-Manager-add-dialog-sxgx" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:360px;margin-top:68px;margin-left:0px">
		<div class="modal-content">
			<div class="modal-header" style="text-align:center;font-size:12px">
				<button type="button" class="close" data-dismiss="modal" id="sxgx-close" aria-hidden="true">&times;</button> 
				<h5 class="modal-title" id="">信息更新</h5>
			</div>
			<div class="modal-body" style="height: 100%;margin-right:10px">
				<form class="form-horizontal" role="form" id ="form-sxgx">
					<div style="text-align: right;display: none" class="form-group" >
						<label class="col-sm-5">ID:</label>
						<input class="col-sm-6" style="height:26px" name = "id" type="text" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">计划时间:</label>
						<input class="col-sm-6 date-picker" name="strplancompletiontime" id="" type="text" data-date-format="yyyy-mm-dd" style="height:26px;" placeholder="请输入计划时间" class="form-control"/>
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">名称:</label>
						<input class="col-sm-6" style="height:26px" name = "name" type="text" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">地址:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "location" class="form-control"  >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">灾害类型:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "govertype" class="form-control" >
					</div>
				  
				    <div style="text-align: right;" class="form-group">
						<label class="col-sm-5">规模:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "scale" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">规模等级:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "scalegrad" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">稳定性:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "thisstage" class="form-control" > 
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">治理进度(%):</label>
						<input class="col-sm-6" style="height:26px" name = "completion" type="text" class="form-control" >
					</div>
					<div class="modal-footer" style="text-align: center;background:white;">
						<button type="button" class="btn btn-info btn-sm"  id="save-submit">更新</button>
		                <button type="button" class="btn btn-info btn-sm"  id="add-submit" style="margin-left:0px">添加治理方案</button>
				   </div>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<!-- 添加的模态框(治理方案) -->
  <div class="modal fade" id="account-Manager-add-dialog-result" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:360px;margin-top:68px;margin-left:0px">
		<div class="modal-content">
			<div class="modal-header" style="text-align:center;font-size:12px">
				<button type="button" class="close" data-dismiss="modal" id="ckjdjg-close" aria-hidden="true">&times;</button> 
				<h5 class="modal-title" id="">添加治理方案</h5>
			</div>
			<div class="modal-body" style="height: 100%;margin-right:10px">
				<form class="form-horizontal" role="form" id ="form-test-result">
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">计划时间:</label>
						<input class="col-sm-6 date-picker" name="create_time" id="" type="text" data-date-format="yyyy-mm-dd" style="height:26px;" placeholder="请输入计划时间" class="form-control"/>
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">名称:</label>
						<input class="col-sm-6" style="height:26px" name = "name" type="text" class="form-control" >
					</div>
					
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">基本情况:</label>
						<input class="col-sm-6" style="height:26px" type="text" name ="basicInfo" class="form-control"  >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">防治情况:</label>
						<input class="col-sm-6" style="height:26px" type="text" name ="governanceInfo" class="form-control" >
					</div>
				  
				    <div style="text-align: right;" class="form-group">
						<label class="col-sm-5">治理方式:</label>
						<select style="height: 26px;width:171px" id="" name="governancetype" class="form-control" >
				 	   		<option value="1">搬迁避让</option>
				 	   		<option value="2">工程治理</option>
		 	   		    </select>
					</div>
				 <div style="text-align: right;" class="form-group">
						<label class="col-sm-5">进度(%):</label>
						<input class="col-sm-6" style="height:26px" name = "progress" type="text" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">备注:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "remark" class="form-control" > 
					</div>
					<div class="modal-footer" style="text-align:center;background:white;">
 						<button type="button" class="btn btn-sm btn-info" id="add-save-submit">添加</button>	
			        </div>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<!-- 搬迁避让模态框 -->
   <div class="modal fade" id="account-Manager-add-dialog-bqbr" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:420px;margin-top:68px;margin-left:0px">
		<div class="modal-content">
			<div class="modal-header" style="text-align:center;font-size:12px">
				<button type="button" class="close" data-dismiss="modal" id="bqbr-close" aria-hidden="true">&times;</button> 
				<h5 class="modal-title" id="">信息更新</h5>
			</div>
			<div class="modal-body" style="height: 100%;margin-right:10px">
				<form class="form-horizontal" role="form" id ="form-bqbr">
				    <div style="text-align: right;display: none" class="form-group" >
						<label class="col-sm-5">ID:</label>
						<input class="col-sm-6" style="height:26px" name = "id" type="text" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">计划时间:</label>
						<input class="col-sm-6 date-picker" name="create_time" id="" type="text" data-date-format="yyyy-mm-dd" style="height:26px;" placeholder="请输入计划时间" class="form-control"/>
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">隐患点名称:</label>
						<input class="col-sm-6" style="height:26px" name = "hiddendanger_name" type="text" class="form-control" readonly="readonly">
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">名称:</label>
						<input class="col-sm-6" style="height:26px" name = "name" type="text" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">基本情况:</label>
						<input class="col-sm-6" style="height:26px" type="text" name ="basicInfo" class="form-control"  >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">防治情况:</label>
						<input class="col-sm-6" style="height:26px" type="text" name ="governanceInfo" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">进度(%):</label>
						<input class="col-sm-6" style="height:26px" type="text" name ="progress" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">备注:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "remark" class="form-control" > 
					</div>
					<div class="modal-footer" style="text-align: center;background:white;">
						<button type="button" class="btn btn-info btn-sm"  id="bqbr-save-submit">信息更新</button>
						<button type="button" class="btn btn-info btn-sm"  id="bqbr-person-submit">搬迁人员</button>
		                <button type="button" class="btn btn-info btn-sm"  id="bqbr-add-submit" style="margin-left:0px">资料上传</button>
				   		<button type="button" class="btn btn-info btn-sm"  id="bqbr-download-submit">资料下载</button>
				   </div>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
	 <!-- 查看搬迁人员的模态框 -->
<div class="modal fade" id="House-Manager-bqry-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog" style="width: 550px;margin-top:68px;margin-left:0px; ">
				<div class="modal-content" id="House-bqry-data-div">
				<div class="modal-header" style="text-align:center;font-size:14px">
				<button type="button" class="close" data-dismiss="modal" id="bqry-close" aria-hidden="true">&times;</button> 
				<h5 class="modal-title" id="">搬迁人员一览表</h5>
			</div>
			<div class="modal-body" style="hieght:800px;">
			 <div id="settlement-monitor-table" style="margin-top: -30px;">
			     <div class="heading btn-group" id="settlement-monitor-data-toorbar">				         
					 <button id="settlement-monitor-toorbar-add" type="button" class="btn btn-sm">添加人员</button> 							    
				 </div>
				 <div id="House-bqry-data-div" class="settlemrnt-ob-data">
					<table id="House-bqry-data"  style="background-color: rgba(242, 242, 242, 0.9);" class="table table-striped table-bordered table-hover no-border-top scrolltable">
					</table>
				 </div>
			 </div>
			</div>
		</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

	<!-- 修改搬迁人员 -->
	<div class="modal fade" id="settlement-monitor-bq-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 450px;margin-top:68px;margin-left:0px;">
			<div class="modal-content">
				<div class="modal-header" style="text-align:center;font-size:14px">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h5 class="modal-title" id="myModalLabel">编辑搬迁人员</h5>
				</div>
				<div class="modal-body">
					<form role="form" id="add-settlement-form" class="form-horizontal" style="hieght:800px;">
				        <div style="text-align:right;" class="form-group">
						<label class="col-sm-4">计划时间:</label>
						<input class="col-sm-4 date-picker" name="relocate_time" id="" type="text" data-date-format="yyyy-mm-dd" style="height:26px;" placeholder="请输入计划时间" class="form-control"/>
						</div>
						<div style="text-align:right;" class="form-group">
							<label class="col-sm-4">姓名:</label>
							<input class="col-sm-4" style="height:26px" name = "name" type="text" class="form-control">
						</div>
						<div style="text-align: right;" class="form-group">
							<label class="col-sm-4">人数:</label>
							<input class="col-sm-4" style="height:26px" name = "family" type="text" class="form-control" >
						</div>
						<div style="text-align: right;" class="form-group">
							<label class="col-sm-4">是否搬迁:</label>
							<select name="relocate_flag" id="relocate_flag" style="height: 26px;width:151px;" class="form-control" required>
							    <option value="0">未搬迁</option>
							    <option value="1">已搬迁</option>
				   		    </select>
						</div>
						 
				    </form>
				</div>
				<div class="modal-footer" style="text-align: center;">
					<button class="btn btn-info btn-sm" type="submit" id="settlement-add-dq-btn">
	                    <i class="ace-icon fa fa-check bigger-110"></i> 确定
	                </button>
	                <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">
	                	<i class="ace-icon fa fa-times bigger-110"></i> 关闭
	                </button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
	
	
	
<!-- 资料上传(搬迁避让) -->
  <div class="modal fade" id="account-Manager-add-dialog-bqbr-zlsc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:600px;height:600px;margin-top:68px;margin-left:0px">
		<div class="modal-content">
			<div class="modal-header" style="text-align:center;font-size:12px">
				<button type="button" class="close" data-dismiss="modal" id="bqbr-zlsc-close" aria-hidden="true">&times;</button> 
				<h5 class="modal-title" id="">上传文件</h5>
			</div>
			<div class="modal-body" style="width:100%;height:600px;">
				<iframe name="fileConframe"  style="width:100%;height:100%;"class="Conframe" id="fileConframe" frameborder=0 src="<%=basePath%>UpLoadFile">
				 </iframe>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 资料下载(搬迁避让) -->
<div class="modal fade" id="account-Manager-add-dialog-bqbr-zlxz" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:1000px;height:700px;margin-top:68px;margin-left:0px">
		<div class="modal-content">
			<div class="modal-header" style="text-align:center;font-size:12px">
				<button type="button" class="close" data-dismiss="modal" id="bqbr-zlxz-close" aria-hidden="true">&times;</button> 
				<h5 class="modal-title" id="">下载文件</h5>
			</div>
			<div class="modal-body" style="width:100%;height:700px;">
				<iframe name="treeConframe"  style="width:100%;height:100%;"class="Conframe" id="treeConframe" frameborder=0 src="<%=basePath%>TreeNode">
				 </iframe>
			</div>
		</div>
	</div>
</div>


<!-- 工程治理模态框 -->
  <div class="modal fade" id="account-Manager-add-dialog-gczl-sxgx" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:360px;margin-top:68px;margin-left:0px">
		<div class="modal-content">
			<div class="modal-header" style="text-align:center;font-size:12px">
				<button type="button" class="close" data-dismiss="modal" id="gczl-sxgx-close" aria-hidden="true">&times;</button> 
				<h5 class="modal-title" id="">信息更新</h5>
			</div>
			<div class="modal-body" style="height: 100%;margin-right:10px">
				<form class="form-horizontal" role="form" id ="form-gczl">
				    <div style="text-align: right;display: none" class="form-group" >
						<label class="col-sm-5">ID:</label>
						<input class="col-sm-6" style="height:26px" name = "id" type="text" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">计划时间:</label>
						<input class="col-sm-6 date-picker" name="create_time" id="" type="text" data-date-format="yyyy-mm-dd" style="height:26px;" placeholder="请输入计划时间" class="form-control"/>
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">隐患点名称:</label>
						<input class="col-sm-6" style="height:26px" name = "hiddendanger_name" type="text" class="form-control" readonly="readonly">
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">名称:</label>
						<input class="col-sm-6" style="height:26px" name = "name" type="text" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">基本情况:</label>
						<input class="col-sm-6" style="height:26px" type="text" name ="basicInfo" class="form-control"  >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">防治情况:</label>
						<input class="col-sm-6" style="height:26px" type="text" name ="governanceInfo" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">进度(%):</label>
						<input class="col-sm-6" style="height:26px" type="text" name ="progress" class="form-control" >
					</div>
					<div style="text-align: right;" class="form-group">
						<label class="col-sm-5">备注:</label>
						<input class="col-sm-6" style="height:26px" type="text" name = "remark" class="form-control" > 
					</div>
					<div class="modal-footer" style="text-align: center;background:white;">
						<button type="button" class="btn btn-info btn-sm"  id="gczl-save-submit">信息更新</button>
		                <button type="button" class="btn btn-info btn-sm"  id="gczl-add-submit" style="margin-left:0px">资料上传</button>
				   		<button type="button" class="btn btn-info btn-sm"  id="gczl-download-submit">资料下载</button>
				   </div>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
 
 
 <!-- 资料上传(工程治理) -->
  <div class="modal fade" id="account-Manager-add-dialog-gczl-zlsc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:600px;height:600px;margin-top:68px;margin-left:0px">
		<div class="modal-content">
			<div class="modal-header" style="text-align:center;font-size:12px">
				<button type="button" class="close" data-dismiss="modal" id="gczl-zlsc-close" aria-hidden="true">&times;</button> 
				<h5 class="modal-title" id="">上传文件</h5>
			</div>
			<div class="modal-body" style="width:100%;height:600px;">
				<iframe name="fileConframe1"  style="width:100%;height:100%;"class="Conframe" id="fileConframe1" frameborder=0 src="<%=basePath%>UpLoadFile">
				 </iframe>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 资料下载(工程治理) -->
<div class="modal fade" id="account-Manager-add-dialog-gczl-zlxz" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:1000px;height:700px;margin-top:68px;margin-left:0px">
		<div class="modal-content">
			<div class="modal-header" style="text-align:center;font-size:12px">
				<button type="button" class="close" data-dismiss="modal" id="gczl-zlxz-close" aria-hidden="true">&times;</button> 
				<h5 class="modal-title" id="">下载文件</h5>
			</div>
			<div class="modal-body" style="width:100%;height:700px;">
				<iframe name="treeConframe1"  style="width:100%;height:100%;"class="Conframe" id="treeConframe1" frameborder=0 src="<%=basePath%>TreeNode">
				 </iframe>
			</div>
		</div>
	</div>
</div>

 <!-- 添加的模态框(照片展示) -->
  <div class="modal fade" id="account-Manager-add-dialog-photo"  aria-hidden="true" >
	<div class="modal-dialog" style="margin-right:4px;">
		<div class="modal-content">
		<div class="modal-header" style="text-align:center;font-size:12px">
				<button type="button" class="close" data-dismiss="modal" id="photo-close" aria-hidden="true">&times;</button> 
				<h5 class="modal-title" id="">照片预览</h5>
			</div>
			<div >
				<img id="viewer" src="" alt="" style="width:590px;margin-top:4px;margin-left:4px;height:608px">
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
	<!-- 房屋检测    （缪秀诚的测试）
			<div class="container" id="house-fwjc" style="width:400px;margin-top:10px;margin-bottom:10px;margin-left:20px;overflow-y:scroll;height:300px;display:none">
				<div class="row">
					<div class="col-xs-12">
						PAGE CONTENT BEGINS
						<form class="form-horizontal" role="form" id="house-info-form">
							#section:elements.form
							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="form-field-1">房屋编号</label>

								<div class="col-xs-8">
									<label class="form-control-static" id="house-info-no">0</label>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right">经纬度</label>

								<div class="col-xs-8">
									<label class="form-control-static" id="house-info-lat-lon"></label>
									<input type="hidden" name="x" id="house-info-lon"/>
									<input type="hidden" name="y" id="house-info-lat"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right field-required" for="house-info-build-year">建筑年代</label>

								<div class="col-xs-8">
									<select class="form-control" id="house-info-build-year" name="jznd">
										
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-type">住房类别</label>

								<div class="col-xs-8">
									<select class="form-control" id="house-info-type" name="zflb">
										
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right field-required" for="house-info-floor-num">层数</label>
								<div class="col-xs-8">
									<input type="number" id="house-info-floor-num" placeholder="请输入层数" class="col-xs-10 form-control" name="cs"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right field-required" for="form-field-1-1">间数</label>
								<div class="col-xs-8">
									<input type="number" id="house-info-rooms-num" placeholder="请输入间数" class="col-xs-10 form-control" name="js"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right field-required" for="house-info-and-area">占地面积(㎡)</label>
								<div class="col-xs-8">
									<input type="number" id="house-info-land-area" placeholder="请输入占地面积" class="col-xs-10 form-control" name="zdmj"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right field-required" for="house-info-build-area">建筑面积(㎡)</label>
								<div class="col-xs-8">
									<input type="number" id="house-info-build-area" placeholder="请输入建筑面积" class="col-xs-10 form-control" name="jzmj"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-use-situation">住房使用情况</label>

								<div class="col-xs-8">
									<select class="form-control" id="house-info-use-situation" name="zfsyqk">
										<option value=""></option>
										
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-land-nature">土地性质</label>
								<div class="col-xs-8">
									<select class="form-control" id="house-info-land-nature" name="tdxz">
										<option value=""></option>
										
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right">乡镇街道</label>
								<div class="col-xs-8">
									<label class="form-control-static" id="house-info-street"></label>
									<input type="hidden" id="house-info-street-name" name="xzjd"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-village">所属村</label>
								<div class="col-xs-8">
									<label class="form-control-static" id="house-info-village"></label>
									<input type="hidden" id="house-info-village-name" name="ssc"/>
									<input type="hidden" id="house-info-village-id" name="villageId"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-houseNo">门牌号</label>

								<div class="col-xs-8">
									<input type="number" id="house-info-houseNo" placeholder="" class="col-xs-10 form-control" name="mph" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-structure-type">结构类型</label>

								<div class="col-xs-8">
									<select class="form-control" id="house-info-structure-type" name="jglx">
										<option value=""></option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-danger-level">危险性等级</label>

								<div class="col-xs-8">
									<label class="form-control-static" id="house-info-village">待定</label>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="form-field-1-1">房产证</label>

								<div class="col-xs-8">
									<input type="text" id="house-info-certificates-no" placeholder="请输入房产证号" class="form-control col-xs-10" name="fcz"/>
									
								</div>
							</div>
							<div class="validate-tips">
								<label class="validate-tips-label"></lebel>
							</div>
							<div class="clearfix form-actions">
								<div class="col-md-12" style="display: flex;justify-content: space-around;">
									<button class="btn btn-info save-house-btn" type="submit">
										<i class="ace-icon fa fa-check bigger-110"></i>
										确定
									</button>
									<button class="btn" type="reset">
										<i class="ace-icon fa fa-undo bigger-110"></i>
										重置
									</button>
									<button class="btn close-panel-btn" type="reset">
										<i class="ace-icon fa fa-times"></i>
										取消
									</button>
								</div>
							</div>								
						</form>
					</div>
				</div>
			</div> 
		-->
	
	<!-- 查询工具栏 -->
	<div id="search-form-group" class="row" style="position:absolute;height:70px;z-index:999;left:0px;right:0px;top:0px;display: block;">					
		<form id="search-form-group-condition" class="form-inline search-form" role="form">
			<div class="well" style="margin-top: -10px;">
			    <div style="padding-right: 20px;" class="input-group">
					<label class="search-label">选择区域:</label>
					<select name="district" style="height: 25px;" class="selectpicker show-tick search-content">
					    <option></option>
					    <option>柯城区</option>
					    <option>衢江区</option>
					    <option>龙游县</option>
					    <option>江山市</option>
					    <option>开化县</option>
				    </select>
		 	   </div> 
		 	   <div style="padding-right: 20px;" class="input-group">
		 	   	   <label class="search-label">名称:</label>
		 	  	   <input type="text" style="height: 25px;" class="search-content" name="name">
		 	   </div>
		 	   <div style="padding-right: 20px;" class="input-group">
		 	   	   <label class="search-label">治理类型:</label>
		 	  	   <select name="governancetype" style="height: 25px;" class="selectpicker show-tick search-content">
					    <option></option>
					    <option value="0">暂无</option>
					    <option value="1">拆迁避让</option>
					    <option value="2">工程治理</option>
				    </select>
		 	   </div>	
		
		 	    <div style="padding-right: 20px;" class="input-group">
		 	   	   <label class="search-label">规模等级:</label>
		 	  	   <select name="scalegrad" style="height: 25px;" class="selectpicker show-tick search-content">
					    <option></option>
					    <option>小型</option>
					    <option>中型</option>
					    <option>大型</option>
				    </select>
		 	   </div>
		 	   <div style="padding-right: 20px;" class="input-group">
		 	   	   <label class="search-label">稳定性:</label>
		 	  	   <select name="thisstage" style="height: 25px;" class="selectpicker show-tick search-content">
					    <option></option>
					    <option>好</option>
					    <option>较好</option>
					    <option>差</option>
					    <option>较差</option>
					    <option>低易发</option>
					    <option>中易发</option>
					    <option>稳定</option>
				    </select>
		 	   </div>  
		 	   <div style="padding-right: 20px;margin-top: 5px;margin-left:-26px" class="input-group">
			 	   <button id="search-form-group-search-btn" type="button" class="btn btn-sm btn-success form-group">
						<span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
						搜索
				   </button>	 
			   </div>
			   <!-- 	<div style="padding-right: 20px;display: none;" class="input-group" >
		 	   		<label class="search-label"></label>
		 	  	   <input type="text" style="height: 25px;" class="search-content" name="governancetype" value="0">
		 	   </div> -->
	 	  </div> 																		
		</form>	 
	</div>
	

	
	<%--添加房屋的面板--%>
	<div class="widget-box widget-color-pink" id="house-info-panel" style="position:absolute;width:400px; height:100%;z-index:999; right:-400px;top:0px;display:none;">
		<div class="widget-header widget-header-small">
			<h6 class="widget-title">
				添加房屋
			</h6>

			<div class="widget-toolbar">

				<a href="javascript:void(0)" class="panel-close-icon">
					<i class="ace-icon fa fa-times"></i>
				</a>
			</div>
		</div>

		<div class="widget-body" style="height:100%;">
			<style>
				#house-info-panel .form-group{
					margin-bottom: 8px;
				}
			</style>
			<div class="widget-main container" style="width:400px;overflow-y:scroll;height:100%;">
				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<form class="form-horizontal" role="form" id="house-info-form">
							<!-- #section:elements.form -->
							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="form-field-1">房屋编号</label>

								<div class="col-xs-8">
									<label class="form-control-static" id="house-info-no">0</label>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right">经纬度</label>

								<div class="col-xs-8">
									<label class="form-control-static" id="house-info-lat-lon"></label>
									<input type="hidden" name="x" id="house-info-lon"/>
									<input type="hidden" name="y" id="house-info-lat"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right field-required" for="house-info-build-year">建筑年代</label>

								<div class="col-xs-8">
									<select class="form-control" id="house-info-build-year" name="jznd">
										
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-type">住房类别</label>

								<div class="col-xs-8">
									<select class="form-control" id="house-info-type" name="zflb">
										
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right field-required" for="house-info-floor-num">层数</label>
								<div class="col-xs-8">
									<input type="number" id="house-info-floor-num" placeholder="请输入层数" class="col-xs-10 form-control" name="cs"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right field-required" for="form-field-1-1">间数</label>
								<div class="col-xs-8">
									<input type="number" id="house-info-rooms-num" placeholder="请输入间数" class="col-xs-10 form-control" name="js"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right field-required" for="house-info-and-area">占地面积(㎡)</label>
								<div class="col-xs-8">
									<input type="number" id="house-info-land-area" placeholder="请输入占地面积" class="col-xs-10 form-control" name="zdmj"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right field-required" for="house-info-build-area">建筑面积(㎡)</label>
								<div class="col-xs-8">
									<input type="number" id="house-info-build-area" placeholder="请输入建筑面积" class="col-xs-10 form-control" name="jzmj"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-use-situation">住房使用情况</label>

								<div class="col-xs-8">
									<select class="form-control" id="house-info-use-situation" name="zfsyqk">
										<option value=""></option>
										
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-land-nature">土地性质</label>
								<div class="col-xs-8">
									<select class="form-control" id="house-info-land-nature" name="tdxz">
										<option value=""></option>
										
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right">乡镇街道</label>
								<div class="col-xs-8">
									<label class="form-control-static" id="house-info-street"></label>
									<input type="hidden" id="house-info-street-name" name="xzjd"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-village">所属村</label>
								<div class="col-xs-8">
									<label class="form-control-static" id="house-info-village"></label>
									<input type="hidden" id="house-info-village-name" name="ssc"/>
									<input type="hidden" id="house-info-village-id" name="villageId"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-houseNo">门牌号</label>

								<div class="col-xs-8">
									<input type="number" id="house-info-houseNo" placeholder="" class="col-xs-10 form-control" name="mph" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-structure-type">结构类型</label>

								<div class="col-xs-8">
									<select class="form-control" id="house-info-structure-type" name="jglx">
										<option value=""></option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="house-info-danger-level">危险性等级</label>

								<div class="col-xs-8">
									<label class="form-control-static" id="house-info-village">待定</label>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-4 control-label no-padding-right" for="form-field-1-1">房产证</label>

								<div class="col-xs-8">
									<input type="text" id="house-info-certificates-no" placeholder="请输入房产证号" class="form-control col-xs-10" name="fcz"/>
									
								</div>
							</div>
							<div class="validate-tips">
								<label class="validate-tips-label"></lebel>
							</div>
							<div class="clearfix form-actions">
								<div class="col-md-12" style="display: flex;justify-content: space-around;">
									<button class="btn btn-info save-house-btn" type="submit">
										<i class="ace-icon fa fa-check bigger-110"></i>
										确定
									</button>
									<button class="btn" type="reset">
										<i class="ace-icon fa fa-undo bigger-110"></i>
										重置
									</button>
									<button class="btn close-panel-btn" type="reset">
										<i class="ace-icon fa fa-times"></i>
										取消
									</button>
								</div>
							</div>								
						</form>
					</div>
				</div>
			</div>
		
		
		</div>
	</div>


 </div>
	 
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
<script type="text/javascript" src="static/ace/js/jquery.js"></script>
	<!-- 删除时确认窗口 -->
 	<!-- <script src="static/ace/js/jquery.form.min.js"></script>   -->
	<script src="static/ace/js/bootbox.js"></script>
	<script src="static/ace/js/bootstrap.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	
	
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>

	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--工具栏-->
	
	<script src="static/ace/js/ace/elements.scroller.js"></script>
	<script src="static/ace/js/ace/ace.widget-box.js"></script>
	<script src="static/ace/js/ace/ace.sidebar.js"></script>
	<script src="static/ace/js/ace/elements.aside.js"></script>
	<script src="static/ace/js/ace/ace.sidebar-scroll-1.js"></script>
	<script src="static/ace/js/ace/ace.submenu-hover.js"></script>
	<script src="static/ace/js/ace/elements.wizard.js"></script>
	<script src="static/ace/js/ace/elements.typeahead.js"></script>
	<script src="static/ace/js/ace/elements.wysiwyg.js"></script>

	<!-- 弹出提示消息 -->
	<script src="static/html_UI/assets/js/jquery.gritter.js"></script>
	<script src="static/bootstrap-growl/jquery.bootstrap-growl.js"></script>
	<!-- jquery验证 -->
	<script src="static/ace/js/jquery.validate.js"></script>
	<!-- 表格 -->	
	<script src="static/ace/js/dataTables/bootstrap-table.js"></script>
	<script src="static/ace/js/dataTables/bootstrap-table-zh-CN.js"></script>
	<!--提示框-->
	<!-- 天地图API -->
	<script src=" http://api.tianditu.com/api?v=4.0" type="text/javascript"></script>
	<script src="static/js/common/commonUtils.js" type="text/javascript"></script>

	<%--js文件--%>
    <script src="static/js/history/map.js" type="text/javascript"></script>
	<script src="static/js/history/addHouse.js" type="text/javascript"></script> 
	<script src="static/js/history/conditionSearch.js" type="text/javascript"></script>
	<script src="static/js/history/monitor.js" type="text/javascript"></script>
	</body>

 	<script type="text/javascript">
		$(top.hangge());
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}

			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//导出excel
<%-- 		function toExcel(){
			window.location.href='<%=basePath%>history/excel';
		} --%>
	</script>
</html>
