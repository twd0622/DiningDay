<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>아이티윌 2강 1조</title> 
</head>

<%@ include file="/Template/header.jsp"%> 
	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; align-items: center; text-align: center; padding: 125px 50px 0 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; background: white;">
		<h4 style="text-align: left; padding: 20px 0 0 20px;">&lt; 공지사항 상세조회 &gt;</h4>
		<hr>
		<div class="row" style="padding: 0 15% 0 15%;">
			<table class="table table-hover" id="article-table">
				<tbody>
					<c:set var="noticeDetail" value="${ requestScope.noticeDetail }"/>
						<tr style="height: 60px;">
							<th class="title align-middle table-warning">글번호</th>
							<td class="user-id align-middle text-center"
								style="text-align: left;">${noticeDetail.NOT_NO}</td>
						</tr>
						<tr style="height: 60px;">
							<th class="title align-middle table-warning">제목</th>
							<td class="user-id align-middle text-center"
								style="text-align: left;">${noticeDetail.NOT_TITLE}</td>
						</tr>
						<tr style="height: 60px;">
							<th class="title align-middle table-warning">작성자</th>
							<td class="user-id align-middle text-center"
								style="text-align: left;">관리자</td>
						</tr>
						<tr style="height: 60px;">
							<th class="title align-middle table-warning">작성일자</th>
							<td class="user-id align-middle text-center"
								style="text-align: left;">${noticeDetail.DATE}</td>
						</tr>
						<tr style="height: 150px;">
							<th class="title align-middle table-warning col-3"><a>글	내용</a></th>
							<td class="user-id align-middle text-center"
								style="text-align: left;">${noticeDetail.NOT_CONTENT}</td>
						</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<div class="row" style="padding: 0px 20px;">
			<div class="d-grid gap-2 d-md-flex justify-content-md-center">
				<input type="button" class="btn btn-outline-dark" value="목록" onclick="window.history.back()">
			</div>
		</div>
		<br>
	</div>
</main>
<%@ include file="/Template/footer.jsp"%>
</html> 