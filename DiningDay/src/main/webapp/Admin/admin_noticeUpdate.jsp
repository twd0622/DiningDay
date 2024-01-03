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
</head>

<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!-- main은 속성 값은 왠만하면 건들지x -->

<main style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; height: 850px; background: white;">
		<form method="post" action="admin_noticeUpdatePro.ad">
		<h4 style="text-align: left;">&lt; 공지사항 수정 &gt;</h4>
		<hr>
		<div class="row" style="padding: 0 10% 0 10%;">
			<table class="table table-hover" id="article-table">
				<tbody>
					<c:set var="noticeDetail" value="${ requestScope.noticeDetail }"/>
						<tr style="height: 60px;">
							<th class="title align-middle table-success">글번호</th>
							<td class="user-id align-middle text-center"
								style="text-align: left;"><input class="form-control" style="text-align: center;" value="${noticeDetail.NOT_NO}" readonly="readonly"></td>
						</tr>
						<tr style="height: 60px;">
							<th class="title align-middle table-success">제목</th>
							<td class="user-id align-middle text-center"
								style="text-align: left;"><textarea rows="1" cols="115" style="text-align: center;">${noticeDetail.NOT_TITLE}</textarea></td>
						</tr>
						<tr style="height: 60px;">
							<th class="title align-middle table-success">작성자</th>
							<td class="user-id align-middle text-center"
								style="text-align: left;"><input class="form-control" style="text-align: center;" value="관리자" readonly="readonly"></td>
						</tr>
						<tr style="height: 60px;">
							<th class="title align-middle table-success">작성일자</th>
							<td class="user-id align-middle text-center"
								style="text-align: left;"><input class="form-control" style="text-align: center;" value="${noticeDetail.DATE}" readonly="readonly"></td>
						</tr>
						<tr style="height: 150px;">
							<th class="title align-middle table-success col-3"><a>글	내용</a></th>
							<td class="user-id align-middle text-center"
								style="text-align: left;"><textarea rows="5" cols="115" style="text-align: center;">${noticeDetail.NOT_CONTENT}</textarea></td>
						</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<div class="row" style="padding: 0px 20px;">
			<div class="d-grid gap-2 d-md-flex justify-content-md-center">
				<a href="admin_noticeUpdate.ad?NOT_NO=${ noticeDetail.NOT_NO }" type="button"
					class="btn btn-outline-success">수정</a> 
				<input type="submit"
					class="btn btn-outline-success" value="수정"
					onclick="location.href='admin_noticeUpdate.ad?NOT_NO=${ noticeDetail.NOT_NO }'">
				
					<input type="button"
					class="btn btn-outline-dark" value="목록"
					onclick="window.history.back()">
			</div>
		</div>
		</form>
	</div>
</main>

<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



