	<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항 | 다이닝데이</title>
<c:set var="noticeList" value="${ requestScope.noticeList }"/>
<script>
function delBtn(){
	alert("정말 삭제하시겠습니까?")
}
</script>
<style type="text/css">
#noticeTable {
	max-height: 650px;
	padding: 1rem;
	overflow-y: auto;
	direction: ltr;
	scrollbar-color: #d4aa70 #e4e4e4;
	scrollbar-width: thin;
}
</style>
</head>
<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!-- main은 속성 값은 웬만하면 건들지x -->
<main
	style="display: flex; align-items: center; text-align: center; padding: 20px 50px 20px 50px;">
	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; height: 100%; background: white;">
		<h4 style="text-align: left; padding: 20px 0 0 20px;">&lt; 공지사항 &gt;</h4>
		<hr>
		<div class="row" style="padding: 1% 7% 1% 7%;" id="noticeTable">
			<table class="table table-hover" id="article-table">
				<thead>
					<tr class="table-success">
						<th class="title col-1 align-middle">글번호</th>
						<th class="hashtag col-1 align-middle">제목</th>
						<th class="user-id col-2">내용</th>
						<th class="created-at col-1">작성일자</th>
						<th class="created-at col-1"></th>
					</tr>
				</thead>
				<tbody>
<%-- 				<c:set var="noticeList" value="${ requestScope.noticeList }"/> --%>
					<c:forEach var="notice" items="${noticeList }">
						<tr id="datalist" style="height: 60px;" align="center" >
							<td class="title align-middle" onclick="location.href='admin_noticeDetail.ad?NOT_NO=${ notice.NOT_NO }'">${notice.NOT_NO}</td>
							<td class="hashtag align-middle" onclick="location.href='admin_noticeDetail.ad?NOT_NO=${ notice.NOT_NO }'">${notice.NOT_TITLE}</td>
							<td class="user-id align-middle" style="text-align: left;" onclick="location.href='admin_noticeDetail.ad?NOT_NO=${ notice.NOT_NO }'">${notice.NOT_CONTENT}</td>
							<td class="created-at col-1 align-middle" id="dateRegex" onclick="location.href='admin_noticeDetail.ad?NOT_NO=${ notice.NOT_NO }'">${notice.DATE}</td>
<%-- 							<td class="align-middle "><a href="admin_noticeDelete.ad?NOT_NO=${notice.NOT_NO}" class="btn btn-outline-danger">삭제</a></td> --%>
<!-- 							<td><input class="align-middle btn btn-outline-danger" type="button" value="삭제" id="btnLogin"></td> -->
							<td><input type="button" class="align-middle btn btn-outline-danger" value="삭제" onclick="delBtn(); location.href='admin_noticeDelete.ad?NOT_NO=${notice.NOT_NO}'"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row"  style="padding: 0 100px 0 0;">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="admin_noticeWrite.ad" type="button" class="btn btn-outline-success">글쓰기</a>
			</div>
		</div>

		<hr>

		<div class="row">
			<nav id="pagination" aria-label="Page navigation">
				<ul class="panel panel-success pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						style="color: green;">이전</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: green;">1</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: green;">다음</a></li>

				</ul>
			</nav>
		</div>
		<br>
	</div>



</main>
<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>

