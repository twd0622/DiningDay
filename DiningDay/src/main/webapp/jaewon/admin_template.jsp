<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀</title>
</head>
	<%@ include file="/Template/admin_sidebar_open.jsp"%> 	
    	<!-- main은 속성 값은 왠만하면 건들지x -->
		<main style="display: flex;  align-items: center; text-align: center; padding:20px;">
			
			<!-- 예시div style속성 값 조절해서 사용! -->
			<div class="mainContainer" style="border: 1px solid black; width: 100%; height: 850px; background:white; ">
				<h1> 테스트 문구 </h1>
			</div>
			
    	</main>	
	<%@ include file="/Template/admin_sidevar_close.jsp"%> 	
</html> 



