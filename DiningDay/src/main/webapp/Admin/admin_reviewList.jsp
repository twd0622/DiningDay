<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>리뷰관리 | 다이닝데이</title>
<c:set var="reviewList" value="${ requestScope.reviewList }"/>
<link href="resources/css/variable_admin.css" rel="stylesheet">
<script src="resources/js/variableCode.js"></script>
<script src="resources/js/jquery.twbsPagination.min.js"></script>
<script>
	$(()=>{
		paging("tbody tr" ,10, 1);
	})
</script>
</head>

<!-- main은 속성 값은 왠만하면 건들지x -->
<main
	style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; background: white;">
		<h4 style="text-align: left; padding: 20px 0 0 20px;" onclick="location.href='admin_reviewList.ad'">&lt; 전체 리뷰관리 &gt;</h4>
		<hr>
		<div class="row" style="padding: 0 7% 0 7%;">
			<table class="table table-hover" id="article-table">
				<thead>
					<tr class="table-success">
						<th class="title col-1 align-middle">리뷰번호</th>
						<th class="hashtag col-1 align-middle">작성자</th>
						<th class="hashtag col-1 align-middle">방문 식당명</th>
						<th class="user-id col-3 align-middle">리뷰내용</th>
						<th class="created-at col-1 align-middle">작성일자</th>
						<th class="created-at col-1 align-middle"></th>

					</tr>

				</thead>
				<tbody>
				<c:forEach var="reviewList" items="${reviewList}">
					<tr>
						<td class="title align-middle" onclick="location.href='admin_reviewDetail.ad'">${reviewList.REV_NO}</td>
						<td class="hashtag align-middle" onclick="location.href='admin_reviewDetail.ad'">${reviewList.CUS_NICK}</td>
						<td class="hashtag align-middle" onclick="location.href='admin_reviewDetail.ad'">${reviewList.STORE_NAME}</td>
						<td class="user-id align-middle" style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis; table-layout: fixed;" onclick="location.href='admin_reviewDetail.ad'">${reviewList.REV_CONTENT}</td>
						<td class="created-at col-1 align-middle" onclick="location.href='admin_reviewDetail.ad'">${reviewList.REV_DATE}</td>
						<td class="align-middle"><a href="contentWrite.jsp" class="btn btn-outline-danger">삭제</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<hr>
		<div class="demo">
	    <nav class="pagination-outer"  aria-label="Page navigation">
	        <ul class="pagination" id="pagination"></ul>
	    </nav>
		</div> 
		<br>
	</div>


</main>
<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



