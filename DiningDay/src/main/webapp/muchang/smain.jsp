<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀</title>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
	
		<h1>UI 만들기 전에 한 번 실핼해보세요.</h1>
    	<h2>테스트용 무조건 가운데 정렬</h2>
    	<h3>본인이 원하는 대로 정렬 바꿔도 됨 단, 관리자 및 식당 페이지는 가라로 만들어서 가운데 정렬하는거 추천</h3>
    	
		<main class="" style="display: flex; justify-content: center; align-items: center; text-align: center;">
    		여기 넣으면 무조건 가운데 정렬
    	</main>	
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 
<%--   * @FileType : 관리자, 사장 전용  --%>

<%--   * @작성자 : 김무창 --%>

<!--   * @프로그램 설명 : head -> include 태그 사이에 내용 넣기  -->

<!--   * @간략설명 : 사이에 body #절대 넣지말아주세요, 추가로 필요한 css/js/jquery 등등 파일은 경로지정 해서 사용하시면 됩니다.-->