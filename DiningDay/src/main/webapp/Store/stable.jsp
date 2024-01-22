<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <style>
    	 .closeP{
    	 	width:100px !important; 
    	 	border: 1px solid red !important; 
    	 	font-size:22px !important; 
    	 	color:red !important;
    	 }
    	 
    	 .marginBox{
    	 	margin-right: 6% !important;
    	 }
    </style>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
		<main style="display: flex;  align-items: center; text-align: center; padding:20px;">
			<div class="mainContainer" style="width: 100%; justify-content: center; background:#f0f0f3; display: flex;  align-items: center; text-align: center; padding:20px; flex-direction: column">
				<h1>좌석 관리</h1>
				<div id="htmlTag" class="row mt-4" style="width: 95%; height: 95%; display: flex;  align-content: flex-start; margin-left: 4% !important;">
				</div>
			</div>
    	</main>	
	<%@ include file="/Template/store_sidevar_close.jsp"%>
	<script src="${ pageContext.request.contextPath }/resources/js/stable.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" /> 	
</html> 
