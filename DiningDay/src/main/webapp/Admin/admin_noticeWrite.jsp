<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="org.apache.catalina.startup.ClassLoaderFactory.Repository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지작성 | 다이닝데이</title>

<script src="resources/js/jquery.twbsPagination.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!-- main은 속성 값은 왠만하면 건들지x -->

<main style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">
	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; background: white;">
		<form method="post" action="admin_noticeWritePro.ad">
			<h4 style="text-align: left; padding: 20px 0 0 20px;">&lt; 공지사항 작성 &gt;</h4>
			<hr>
			<div class="container" style="padding: 0 7% 0 7%;">
				<table class="table table-hover">
					<tbody>
					<c:set var="admin" value="${ requestScope.admin }"/>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="${admin.ADM_NAME }" name="admin_id" maxlength="40" readonly="readonly"></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td><input type="text" class="form-control" -->
<!-- 								placeholder="제목명" name="NOT_TITLE" maxlength="40"></td> -->
<!-- 						</tr> -->
						<tr>
							<td><textarea type="text" class="form-control"
									placeholder="제목명" name="NOT_TITLE" maxlength="100"
									style="height: 20px;"></textarea></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td><input type="file" class="form-control" -->
<!-- 								placeholder="파일첨부" name="NOT_FILE" maxlength="40"></td> -->
<!-- 						</tr> -->
						<tr>
							<td><textarea type="text" class="form-control"
									placeholder="글 내용을 작성하세요" name="NOT_CONTENT" maxlength="1000"
									style="height: 400px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<hr>
				<input type="submit" class="writeBtn btn btn-outline-success" value="등록">
				<input type="button" class="btn btn-outline-dark" value="취소" onclick="window.history.back()">
			</div>
			<br>
		</form>
	</div>
</main>

<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



