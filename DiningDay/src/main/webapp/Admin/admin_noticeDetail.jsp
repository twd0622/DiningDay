<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="org.apache.catalina.startup.ClassLoaderFactory.Repository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지상세 | 다이닝데이</title>
</head>

<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!-- main은 속성 값은 왠만하면 건들지x -->

<main style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; height: 850px; background: white;">
		<h4 style="text-align: left;">&lt; 공지사항 상세조회 &gt;</h4>
		<hr>
		<div class="row" style="padding: 0 7% 0 7%;">
			<table class="table table-hover" id="article-table">
				<tbody>
					<c:set var="noticeDetail" value="${ requestScope.noticeDetail }"/>
						<c:forEach var="notDetail" items="${noticeDetail}">
						${notDetail.NOT_NO} ${notDetail.NOT_CONTENT }
						</c:forEach>
					<tr>
						<th class="title align-middle table-success"><a>글 제목</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">공지 제목1</td>
					</tr>
					<tr>
						<th class="title align-middle table-success"><a>작성자</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">관리자</td>
					</tr>
					<tr>
						<th class="title align-middle table-success"><a>작성일자</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;"><time>2023-12-21</time></td>
					</tr>
					<tr>
						<th class="title align-middle table-success"><a>첨부파일</a></th>
						<td ><img src="Admin/img/itwill.jpg"
							style="width: 60%; height: 60%;"> <script>
							
				</script></td>
					</tr>
					<tr style="height: 150px;">
						<th class="title align-middle table-success col-3"><a>글
								내용</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">공지 내용1</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<div class="row" style="padding: 0px 20px;">
			<div class="d-grid gap-2 d-md-flex justify-content-md-center">
				<a href="admin_noticeUpdate.ad" type="button"
					class="btn btn-outline-success">수정</a> <input type="button"
					class="btn btn-outline-dark" value="목록"
					onclick="window.history.back()">
			</div>
		</div>
	</div>
</main>

<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



