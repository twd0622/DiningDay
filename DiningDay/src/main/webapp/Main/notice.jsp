<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/Template/header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항 | 다이닝데이</title> 
<c:set var="noticeList" value="${ requestScope.noticeList }"/>
<link href="resources/css/variable_adminMain.css" rel="stylesheet">
<script src="resources/js/variableCode.js"></script>
<script src="resources/js/jquery.twbsPagination.min.js"></script>
<script>
	$(()=>{
		paging("tbody tr", 5, 1);
	})
</script>
<style type="text/css">
.page-item.active .page-link {
	background-color: white !important;
}
</style>
</head>

	<!-- main은 속성 값은 왠만하면 건들지x -->
<main style="display: flex; align-items: center; text-align: center; padding: 125px 50px 0 50px;">
	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; height: 100%; background: white;">
		<h4 style="text-align: left; padding: 20px 0 0 20px;" onclick="location.href='notice.ad'">&lt; 공지사항 &gt;</h4>
		<hr>
		<div class="row" style="padding: 10px 20% 10px 20%;">
			<div class="card card-margin search-form">
				<div class="card-body p-0">
					<form id="search-form" action="notice.ad" method="get">
						<div class="row">
							<div class="col-12">
								<div class="row no-gutters">
									<div class="col-lg-3 col-md-3 col-sm-12 p-0">
										<label for="search-type" hidden>검색 유형</label> <select
											class="form-control" id="search-type" name="searchType">
											<option>제목</option>
											<option>글번호</option>
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
		<div class="row" style="padding: 1% 7% 1% 7%;" id="noticeTable">
			<table class="table table-hover" id="article-table">
				<thead>
					<tr class="table-warning">
						<th class="title col-1 align-middle">글번호</th>
						<th class="hashtag col-4 align-middle">제목</th>
						<th class="created-at col-1">작성일자</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="notice" items="${noticeList }">
						<tr id="datalist" style="height: 60px;" align="center" onclick="location.href='noticeDetail.ad?NOT_NO=${ notice.NOT_NO }'">
							<td class="title align-middle">${notice.NOT_NO}</td>
							<td class="hashtag align-middle">${notice.NOT_TITLE}</td>
							<td class="created-at col-1 align-middle" id="dateRegex">${notice.DATE}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="demo">
	    <nav class="pagination-outer"  aria-label="Page navigation">
	        <ul class="pagination" id="pagination"></ul>
	    </nav>
		</div> 
		<hr>
	</div>

</main>
<%@ include file="/Template/footer.jsp"%>
</html> 