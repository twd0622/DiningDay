<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>식당신고상세 | 다이닝데이</title>
</head>
<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!-- main은 속성 값은 왠만하면 건들지x -->
<main
	style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">
	<!-- 예시div style속성 값 조절해서 사용! -->

	<div class="mainContainer"
		style="width: 100%; height: 850px; background: white;">
		<h4 style="text-align: left;">&lt; 식당 신고 상세내용&gt;</h4>
		<hr>
		<div class="container" style="padding: 0 7% 0 7%;">
			<table class="table table-hover">

				<tbody>
				<c:set var="sRepDetail" value="${ requestScope.sRepDetail }"/>
					<tr>
						<th>글 제목</th>
						<td>${sRepDetail.SREP_TITLE}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${sRepDetail.CUS_NO}</td>
					</tr>
					<tr>
						<th>작성일자</th>
						<td>${sRepDetail.DATE}</td>
					</tr>
					<tr>
						<td colspan="2"><img src="Admin/img/${sRepDetail.SREP_FILE}" disabled='disabled'
							style="max-width: 50%; max-height: 50%;"> <script>
				</script></td>
					</tr>
					<tr>
						<th>글 내용</th>
						<td>${sRepDetail.SREP_CONTENT}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<input type="button" class="btn btn-outline-dark" value="목록"
			onclick="window.history.back()">
	</div>
</main>
<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



