<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/Template/admin_sidebar_open.jsp"%> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>리뷰신고상세 | 다이닝데이</title>
<style type="text/css">
.star {
  position: relative;
  font-size: 32px;
  color: #ddd;
}

.star input {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  opacity: 0;
}

.star span {
/*   width	: 95%; */
  position: absolute;
  left: 0;
  color: red;
  overflow: hidden;
  pointer-events: none;
}

.table th {
	width: 350px;
}
</style>
<script src="resources/js/jquery.twbsPagination.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="Admin/js/delBtn.js"></script>
<script src="Admin/js/storeReport.js"></script>
</head>
<script type="text/javascript"> 
   const drawStar = (target) => {
     document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
   }
</script> 

    	<!-- main은 속성 값은 왠만하면 건들지x -->
<main style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; background: white;">
		<h4 style="text-align: left; padding: 20px 0 0 20px;">&lt; 고객 신고 상세내용 &gt;</h4>
		<hr>
		<div class="row2" style="padding: 0 13% 0 13%;">
		<hr>
		<p style="text-align: center;"><b>신고 상세내용</b></p>
		<hr>
			<table class="table table-hover" id="article-table1">
				<tbody>
				<c:set var="cRepDetail" value="${ requestScope.cRepDetail }"/>
					<tr class="tr1">
						<th class="title align-middle table-danger"><a>신고번호</a></th>
						<td class="user-id align-middle text-center" style="text-align: left;">${cRepDetail.RREP_NO}</td>
					</tr>
					<tr>
						<th class="title align-middle table-danger"><a>작성자</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">${cRepDetail.STORE_NAME}</td>
					</tr>
					<tr>
						<th class="title align-middle table-danger"><a>신고일자</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">${cRepDetail.RRDATE}</td>
					</tr>
					<tr style="height: 150px;">
						<th class="title align-middle table-danger col-3"><a>신고 내용</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">${cRepDetail.RREP_CONTENT}</td>
					</tr>
				</tbody>
			</table>
			<hr>
			<p style="text-align: center;"><b>원본 리뷰내용</b></p>
			<hr>
			<table class="table table-hover" id="article-table2">
				<tbody>
				<c:set var="cRepDetail" value="${ requestScope.cRepDetail }"/>
					<tr class="tr1">
						<th class="title align-middle table-warning"><a>리뷰 번호</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">${cRepDetail.REV_NO}</td>
					</tr>
					<tr>
						<th class="title align-middle table-warning"><a>별점 리뷰</a></th>
						<td class="user-id align-middle text-center" style="text-align: left;">
						
							<span class="star">
  								★★★★★
  								<span>${cRepDetail.REV_SCORE}</span>
							</span>
						</td>
					</tr>
					<tr>
						<th class="title align-middle table-warning"><a>작성일자</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">${cRepDetail.RDATE}</td>
					</tr>
					<tr style="height: 150px;">
						<th class="title align-middle table-warning col-3"><a>리뷰 내용</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">${cRepDetail.REV_CONTENT}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<div class="row" style="padding: 0px 20px;">
			<div class="d-grid gap-2 d-md-flex justify-content-md-center">
					<input type="button" class="btn btn-outline-dark" value="목록" onclick="location.href='admin_userReport.ad'">
					<input type="button" class="delBtn btn btn-outline-danger" value="삭제" >
			</div>
		</div>
		<br>
	</div>
</main>
	<%@ include file="/Template/admin_sidevar_close.jsp"%> 	
</html> 



