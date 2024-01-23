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
<c:set var="reviewDetail" value="${ requestScope.reviewDetail }"/>
<c:set var="reviewComment" value="${ requestScope.reviewComment }"/>

<link href="resources/css/variable_admin.css" rel="stylesheet">
<script src="resources/js/variableCode.js"></script>
<script src="resources/js/jquery.twbsPagination.min.js"></script>
<script src="Admin/js/delBtn.js"></script>
<script>
	$(()=>{
		paging("tbody tr" ,10, 1);
	})
</script>
<style type="text/css">
h4 {
	cursor: pointer;
}
h4:hover {
	color: gray;
}
</style>
</head>
<!-- main은 속성 값은 왠만하면 건들지x -->
<main
	style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; background: white;">
		<h4 style="text-align: left; padding: 20px 0 0 20px;" onclick="location.href='admin_reviewList.ad'">&lt; 전체 리뷰관리 &gt;</h4>
		<hr>
		<div class="row" style="padding: 10px 20% 10px 20%;">
			<div class="card card-margin search-form">
				<div class="card-body p-0">
					<form id="search-form" action="admin_reviewList.ad" method="get">
						<div class="row">
							<div class="col-12">
								<div class="row no-gutters">
									<div class="col-lg-3 col-md-3 col-sm-12 p-0">
										<label for="search-type" hidden>검색 유형</label> <select
											class="form-control" id="search-type" name="searchType">
											<option>작성자</option>
											<option>방문 식당명</option>
											<option>리뷰내용</option>
											<option>리뷰번호</option>
										</select>
									</div>
									<div class="col-lg-8 col-md-6 col-sm-12 p-0">
										<label for="search-value" hidden>검색어</label> <input
											type="text" placeholder="검색어..." class="form-control"
											id="search-value" name="searchValue">
									</div>
									<div class="col-lg-1 col-md-3 col-sm-12 p-0">
										<button type="submit" class="btn btn-base">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2"
												stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-search">
                                            <circle cx="11" cy="11"
													r="8"></circle>
                                            <line x1="21" y1="21"
													x2="16.65" y2="16.65"></line>
                                        </svg>
										</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<br>
		<div class="row" style="padding: 0 7% 0 7%;">
			<table class="table" id="article-table1">
				<thead>
					<tr class="table-success">
						<th class="title col-2 align-middle">리뷰번호</th>
						<th class="hashtag col-2 align-middle">작성자</th>
						<th class="hashtag col-3 align-middle">방문 식당명</th>
						<th class="user-id col-1 align-middle" colspan="2">리뷰내용</th>
						<th class="created-at col-2 align-middle">작성일자</th>
						<th class="created-at col-1 align-middle"></th>

					</tr>

				</thead>
				<tbody>
				<c:forEach var="reviewList" items="${reviewList}">
					<tr>
						<td class="title align-middle" >${reviewList.REV_NO}</td>
						<td class="hashtag align-middle">${reviewList.CUS_NICK}</td>
						<td class="hashtag align-middle">${reviewList.STORE_NAME}</td>
						<td class="user-id align-middle text-center"
							style="text-align: left;"><a href="upload/${reviewDetail.REV_IMAGE}" target="_blank"><img class="img-fluid rounded"
							src="upload/${reviewDetail.REV_IMAGE}" alt="${reviewDetail.REV_IMAGE}" style="width: 200px; height: 100px;"></a></td>
						<td class="user-id align-middle" style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis; table-layout: fixed;">${reviewList.REV_CONTENT}</td>
						<td class="created-at col-1 align-middle">${reviewList.REV_DATE}</td>
						<td class="created-at col-1 align-middle" rowspan="2" onclick="location.href='admin_reviewDetail.ad?REV_NO=${reviewList.REV_NO}'">상세<br>보기</td>
						
					</tr>
					<tr class="table">
						<td class="hashtag align-middle"><b>ㄴ</b></td>
						<td class="created-at col-1 align-middle" colspan="5" maxlength style="text-align: left; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="문자열이 길 경우 말줄임표를 사용하여 보여주고 마우스를 글자위에 올리면 title 속성을 이용하여 말풍선으로 전체 문자열을 보여줍니다.">
							<b>ㄴㅁㅇㅁㄴㅇ</b>
						</td>
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



