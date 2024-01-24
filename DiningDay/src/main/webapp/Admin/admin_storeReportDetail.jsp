<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>식당신고상세 | 다이닝데이</title>
<style type="text/css">
#sRepTable {
	max-height: 650px;
	padding: 1rem;
	overflow-y: auto;
	direction: ltr;
	scrollbar-color: #d4aa70 #e4e4e4;
	scrollbar-width: thin;
}

.table th {
	width: 350px;
}

.storeName{
	color : #40A2D8;
	text-decoration: underline;
}

.storeName:hover{
	cursor: pointer;
}
</style>
<script src="resources/js/jquery.twbsPagination.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="Admin/js/delBtn.js"></script>
<script src="Admin/js/storeReportDetail.js"></script>
</head>

<!-- main은 속성 값은 왠만하면 건들지x -->
<main
	style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">
	<!-- 예시div style속성 값 조절해서 사용! -->

	<div class="mainContainer"
		style="width: 100%; background: white;">
		<h4 style="text-align: left; padding: 20px 0 0 20px;">&lt; 식당 신고 상세내용&gt;</h4>
		<hr>
		<div class="container" style="padding: 0 7% 0 7%;" id="sRepTable">
			<table class="table">

				<tbody>
				<c:set var="sRepDetail" value="${ requestScope.sRepDetail }"/>
					<tr class="tr1">
						<th class="title1 align-middle table-danger">신고번호</th>
						<td id="sRep_no">${sRepDetail.SREP_NO}</td>
					</tr>
					<tr>
						<th class="title1 align-middle table-danger">신고대상</th>
						<td id="sRep_no"><span id="${sRepDetail.STORE_NO}" class="storeName">${sRepDetail.STORE_NAME}</span></td>
					</tr>
					<tr>
						<th class="title2 align-middle table-danger">글 제목</th>
						<td>${sRepDetail.SREP_TITLE}</td>
					</tr>
					<tr>
						<th class="title3 align-middle table-danger">작성자</th>
						<td>${sRepDetail.CUS_NO}</td>
					</tr>
					<tr>
						<th class="title4 align-middle table-danger">작성일자</th>
						<td>${sRepDetail.DATE}</td>
					</tr>
					<c:choose> 
						<c:when test="${sRepDetail.SREP_FILE eq null}"></c:when>
						<c:otherwise> 
							<tr>
								<th class="title align-middle table-danger" style="vertical-align: middle;">첨부파일</th>
								<td><a href="upload/${sRepDetail.SREP_FILE}" target="_blank"><img src="upload/${sRepDetail.SREP_FILE}" alt="${sRepDetail.SREP_FILE}" disabled='disabled'
									style="max-width: 50%; max-height: 50%;"></a>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
					
					
					
					<tr>
						<th class="title align-middle table-danger">글 내용</th>
						<td>${sRepDetail.SREP_CONTENT}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<div class="row" style="padding: 0px 20px;">
			<div class="d-grid gap-2 d-md-flex justify-content-md-center">
				<input type="button" class="btn btn-outline-dark" value="목록" onclick="location.href='admin_storeReport.ad'">
				<input type="button" class="delBtn btn btn-outline-danger" value="삭제">
			</div>
		</div>
		<br>
	</div>
</main>
<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



