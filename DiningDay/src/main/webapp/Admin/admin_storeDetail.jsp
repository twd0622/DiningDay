<!-- 12-15 18:14 이재원+식당 상세 조회 페이지 만듦 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>식당 상세조회</title>
<style type="text/css">
#pre1 {
  white-space: pre-wrap;
  word-break: break-all;
  overflow: auto;
}

.table th {
	width: 250px;
}
</style>
<link href="resources/css/variable_admin.css" rel="stylesheet">
<script src="resources/js/variableCode.js"></script>
<script src="resources/js/jquery.twbsPagination.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="Admin/js/delBtn.js"></script>
</head>

<!-- main은 속성 값은 웬만하면 건들지x -->
<main
	style="display: flex; align-items: left; text-align: center; padding: 20px 50px 50px 50px;">
	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 50%; background: white;">
			<h4 style="text-align: left; padding: 20px 0 0 20px;">&lt; 식당 상세조회 &gt;</h4>
			<hr>
			<h3>점주 정보</h3>
			<hr>
			<div class="container" style="padding: 0 7% 0 7%;">
				<br>
				<table class="table">
					<tbody>
					<c:set var="storeDetail" value="${ requestScope.storeDetail }"/>
						<tr>
							<th class="table-secondary">아이디</th>
							<td>${storeDetail.OWN_ID}</td>
						</tr>
						<tr>
							<th class="table-secondary">이메일</th>
							<td>${storeDetail.OWN_EMAIL}</td>
						</tr>
						<tr>
							<th class="table-secondary">전화번호</th>
							<td>${storeDetail.OWN_TEL}</td>
						</tr>
						<tr>
							<th class="table-secondary">사업자 번호</th>
							<td>${storeDetail.OWN_CRN}</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<th>식당번호</th> -->
<%-- 							<td>${storeDetail.STORE_NO}</td>					 --%>
<!-- 						</tr> -->
						<tr>
							<th class="table-secondary">식당명</th>
							<td>${storeDetail.STORE_NAME}</td>
						</tr>
						<tr>
							<th class="table-secondary">식당위치</th>
							<td>${storeDetail.STORE_LOCATION}</td>
						</tr>
						<tr>
							<th class="table-secondary">식당구분</th>
							<td>${storeDetail.STORE_CATEGORY}</td>
						</tr>
					</tbody>
				</table>
			</div>
	</div>

	<div class="mainContainer"
		style="width: 50%;background: white;">
		<form method="post" action="contentWriteProcess.jsp">
			<div class="container" id="div2" style="padding: 25px;">
				<br>
				<hr>
				<h3>식당 정보</h3>
				<hr>
				<p class="store_no" hidden="">${storeDetail.STORE_NO}</p>
				<b style="display: flex; align-items: left; text-align: center; padding-top: 20px; font-size: 20px;">${storeDetail.STORE_NAME}</b> <sup
					style="display: flex; align-items: left; padding-top: 15px; text-align: center;">${storeDetail.STORE_CATEGORY}</sup>
				<br> 

				<figure class="mb-4">
					<img class="img-fluid rounded"
						src="upload/${storeDetail.PHOTO_NAME }" alt="${storeDetail.PHOTO_NO}" style="width: 700px; height: 400px;">
				</figure>

				<table class="table table-striped">
					<tr style="text-align: left;">
						<td>
						<pre id="pre1" style="height:100px; overflow-y: scroll;">${storeDetail.STORE_INFO}</pre>
						<hr>
						<p>
							연락처　:	　${storeDetail.STORE_TEL} <br>
							영업시간:	　${storeDetail.STORE_ST} ~ ${storeDetail.STORE_ET} <br>
							추가시설: 　${storeDetail.STORE_PLUS}
							</p>	
							
						</td>
					</tr>
				</table>
			</div>
			<div style="display: flex; justify-content: flex-end; margin-right: 20px; ">
				<input type="button" class="btn btn-outline-dark" value="목록" onclick="location.href='admin_storeList.ad'"> &nbsp;&nbsp;
				<input type="button" class="delBtn btn btn-outline-danger" value="삭제" >
			</div>
				<br>
		</form>
	</div>
</main>
<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



