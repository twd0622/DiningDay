<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="org.apache.catalina.startup.ClassLoaderFactory.Repository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지수정 | 다이닝데이</title>
<style type="text/css">
.table th {
	width: 350px;
}
</style>
</head>

<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!-- main은 속성 값은 왠만하면 건들지x -->

<main style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">
	<c:set var="noticeDetail" value="${ requestScope.noticeDetail }"/>
	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; background: white;">
		<form method="post" action="admin_noticeUpdatePro.ad">
		<h4 style="text-align: left; padding: 20px 0 0 20px;">&lt; 공지사항 수정 &gt;</h4>
		<hr>
		<div class="row" style="padding: 0 10% 0 10%;">
			<table class="table" id="article-table">
				<tbody>
					
						<tr style="height: 60px;">
							<th class="title align-middle table-success">글번호</th>
							<td class="user-id align-middle text-center"
								style="text-align: left;"><input class="form-control"  style="text-align: center; color: gray;" value="${noticeDetail.NOT_NO}" readonly="readonly"></td>
						</tr>
						<tr style="height: 60px;">
							<th class="title align-middle table-success">제목</th>
							<td class="user-id align-middle text-center"
								style="text-align: left;"><input class="form-control" name="NOT_TITLE" style="text-align: center;" value="&lt;수정&gt; ${noticeDetail.NOT_TITLE}"></td>
						</tr>
						<tr style="height: 60px;">
							<th class="title align-middle table-success">작성자</th>
							<td class="user-id align-middle text-center"
								style="text-align: left;"><input class="form-control" style="text-align: center; color: gray;" value="관리자" readonly="readonly"></td>
						</tr>
						<tr style="height: 60px;">
							<th class="title align-middle table-success">작성일자</th>
							<td class="user-id align-middle text-center"
								style="text-align: left;"><input class="form-control" style="text-align: center; color: gray;" value="${noticeDetail.DATE}" readonly="readonly"></td>
						</tr>
						<tr style="height: 150px;">
							<th class="title align-middle table-success col-3"><a>글	내용</a></th>
							<td class="user-id align-middle text-center"
								style="text-align: left;"><pre><textarea type="text" class="form-control"
									placeholder="글 내용을 작성하세요" name="NOT_CONTENT" maxlength="1024"
									style="height: 600px;">${noticeDetail.NOT_CONTENT}</textarea></pre></td>
						</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<div class="row" style="padding: 0px 20px;">
			<div class="d-grid gap-2 d-md-flex justify-content-md-center">
				<input type="submit" class="btn btn-outline-success" value="수정">
				<input type="button" class="btn btn-outline-dark" value="목록" onclick="window.history.back()">
			</div>
		</div>
		</form>
		<br>
	</div>
</main>

<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



