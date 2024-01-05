<!-- 12-15 18:14 이재원+식당 상세 조회 페이지 만듦 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
</head>
<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!-- main은 속성 값은 웬만하면 건들지x -->
<main
	style="display: flex; align-items: left; text-align: center; padding: 20px 50px 50px 50px;">
	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 50%; background: white;">
			<h4 style="text-align: left; padding: 20px 0 0 20px;">&lt; 식당 상세조회 &gt;</h4>
			<hr>
			<div class="container" style="padding: 0 7% 0 7%;">

				<h3>점주 정보</h3>
				<br>
				<table class="table table-hover">
					<tbody>
					<c:set var="storeDetail" value="${ requestScope.storeDetail }"/>
						<tr>
							<th>아이디</th>
							<td>${storeDetail.OWN_ID}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${storeDetail.OWN_EMAIL}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${storeDetail.OWN_TEL}</td>
						</tr>
						<tr>
							<th>사업자 번호</th>
							<td>${storeDetail.OWN_CRN}</td>
						</tr>
						<tr>
							<th>사업장명</th>
							<td>${storeDetail.STORE_NAME}</td>
						</tr>
						<tr>
							<th>사업장 위치</th>
							<td>${storeDetail.STORE_LOCATION}</td>
						</tr>
						<tr>
							<th>사업장 구분</th>
							<td>${storeDetail.STORE_CATEGORY}</td>
						</tr>
					</tbody>
				</table>
			</div>
	</div>

	<div class="mainContainer"
		style="width: 50%;background: white;">
		<form method="post" action="contentWriteProcess.jsp">
			<div class="container" style="padding: 30px;">
				<hr>
				<h3>식당 정보</h3>
				<b
					style="display: flex; align-items: left; text-align: center; padding-top: 20px; font-size: 20px;">${storeDetail.STORE_NAME}</b> <sup
					style="display: flex; align-items: left; padding-top: 15px; text-align: center;">${storeDetail.STORE_CATEGORY}</sup>
				<br>

				<figure class="mb-4">
					<img class="img-fluid rounded"
						src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="...">
				</figure>

				<table class="table table-striped">
					<tr style="text-align: left;">
						<td>
						<pre id="pre1">${storeDetail.STORE_INFO}</pre>
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
				<input type="button" class="btn btn-outline-dark" value="목록" onclick="window.history.back()">
			</div>
		</form>
	</div>

</main>
<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



