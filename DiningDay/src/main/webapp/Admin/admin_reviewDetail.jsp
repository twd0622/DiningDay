<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/Template/admin_sidebar_open.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>리뷰상세 | 다이닝데이</title>
<script type="text/javascript">
	var rev_no = document.getElementById("answer_content").innerText
	
	localStorage.setItem('rev_no', rev_no);
</script>
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
<link href="resources/css/variable_admin.css" rel="stylesheet">
<link href="resources/css/variable_admin.css" rel="stylesheet">
<link>
<script src="resources/js/variableCode.js"></script>
<script src="resources/js/jquery.twbsPagination.min.js"></script>
<script src="Admin/js/delBtn.js"></script>
</head>
<script type="text/javascript"> 
   const drawStar = (target) => {
     document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
   }
</script> 
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    	<!-- main은 속성 값은 왠만하면 건들지x -->
<main style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; background: white;">
		<h4 style="text-align: left; padding: 20px 0 0 20px;">&lt; 리뷰 상세내용 &gt;</h4>
		<hr>
		<div class="row2" style="padding: 0 13% 0 13%;">
		<hr>
		<p style="text-align: center;"><b>리뷰 상세내용</b></p>
		<hr>
			<table class="table table-hover" id="article-table1">
				<tbody>
				<c:set var="reviewDetail" value="${ requestScope.reviewDetail }"/>
					<tr class="tr1">
						<th class="title align-middle table-warning"><a>리뷰 번호</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">${reviewDetail.REV_NO}</td>
					</tr>
					<tr>
						<th class="title align-middle table-warning"><a>닉네임</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">${reviewDetail.CUS_NICK}</td>
					</tr>
					<tr>
						<th class="title align-middle table-warning"><a>별점 리뷰</a></th>
						<td class="user-id align-middle text-center" style="text-align: left;">
								
								
							<span class="star">
  								★★★★★
  								<span>${reviewDetail.REV_SCORE}</span>
							</span>
						</td>
					</tr>
					<tr>
						<th class="title align-middle table-warning"><a>작성일자</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">${reviewDetail.REV_DATE}</td>
					</tr>
					<c:choose> 
						<c:when test="${reviewDetail.REV_IMAGE eq null}"></c:when>
						<c:otherwise> 
							<tr>
								<th class="title align-middle table-warning"><a>파일첨부</a></th>
								<td class="user-id align-middle text-center"
									style="text-align: left;"><a href="upload/${reviewDetail.REV_IMAGE}" target="_blank"><img class="img-fluid rounded"
									src="upload/${reviewDetail.REV_IMAGE}" alt="${reviewDetail.REV_IMAGE}" style="width: 400px; height: 200px;"></a></td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr style="height: 150px;">
						<th class="title align-middle table-warning col-3"><a>리뷰 내용</a></th>
						<td class="user-id align-middle text-center"
							style="text-align: left;">${reviewDetail.REV_CONTENT}</td>
					</tr>
				</tbody>
			</table>
			<hr>
			<c:set var="reviewComment" value="${ requestScope.reviewComment }"/>
			<p style="text-align: center;"><b>식당 답글내용</b></p>
			<hr>
			<c:choose> 
				<c:when test="${reviewComment.ANSWER_CONTENT eq null}">
					<table class="table" id="article-table" >
						<tr>
							<td class="title align-middle table-secondary" style="height: 80px;"><big>아직 답글을 작성하지 않았습니다.</big></td>
						</tr>
					</table>
					<hr hidden="">
				</c:when>
				<c:otherwise> 
					<table class="table table-hover" id="article-table">
						<tbody>
							<tr>
								<th class="title align-middle table-success"><a>식당번호</a></th>
								<td class="user-id align-middle text-center"
									style="text-align: left;">${reviewComment.STORE_NO}</td>
							</tr>
							<tr>
								<th class="title align-middle table-success"><a>식당명</a></th>
								<td class="user-id align-middle text-center"
									style="text-align: left;">${reviewComment.STORE_NAME}</td>
							</tr>
							<tr>
								<th class="title align-middle table-success"><a>작성일자</a></th>
								<td class="user-id align-middle text-center"
									style="text-align: left;">${reviewComment.DATE}</td>
							</tr>
							<tr>
								<th class="title align-middle table-success"><a>답글 내용</a></th>
								<td class="user-id align-middle text-center"
									style="text-align: left;" id="answer_content">${reviewComment.ANSWER_CONTENT}</td>
							</tr>
					
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
		<hr>
		<div class="row" style="padding: 0px 20px;">
			<div class="d-grid gap-2 d-md-flex justify-content-md-center">
					<input type="button" class="btn btn-outline-dark" value="목록" onclick="location.href='admin_reviewList.ad'">
					<input type="button" class="delBtn btn btn-outline-danger" value="삭제" >
			</div>
		</div>
		<br>
	</div>
</main>
	<%@ include file="/Template/admin_sidevar_close.jsp"%> 	
</html> 



