<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>리뷰신고 | 다이닝데이</title>
</head>
<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!-- main은 속성 값은 왠만하면 건들지x -->
<main
	style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; height: 850px; background: white;">
		<h4 style="text-align: left;">&lt; 고객 리뷰 신고관리 &gt;</h4>
		<hr>
		<div class="row" style="padding: 0 7% 0 7%;">
			<table class="table table-hover" id="article-table">
				<thead>
					<tr class="table-success">
						<th class="title col-1 align-middle"><a>번호</a></th>
						<th class="hashtag col-1 align-middle"><a>점주번호</a></th>
						<th class="user-id col-3"><a>신고 내용</a></th>
						<th class="hashtag col-1 align-middle"><a>작성일자</a></th>
						<th class="created-at col-1"> </th>

					</tr>

				</thead>
				<tbody>
					<c:set var="reviewReport" value="${ requestScope.reviewReport }"/>
						<c:forEach var="rReport" items="${reviewReport}">
							<tr style="height: 60px;" onClick="location.href='admin_userReportDetail.ad'">
								<td class="title align-middle">${rReport.CREP_NO}</td>
								<td class="hashtag align-middle">${rReport.OWN_NO}</td>
								<td class="created-at col-1 align-middle">${rReport.CREP_CONTENT}</td>
								<td class="created-at col-1 align-middle">${rReport.DATE}</td>
								<td><a href="contentWrite.jsp" class="btn btn-outline-danger">삭제</a></td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row" style="padding: 2% 20% 2% 20%;">
			<div class="card card-margin search-form">
				<div class="card-body p-0">
					<form id="search-form">
						<div class="row">
							<div class="col-12">
								<div class="row no-gutters">
									<div class="col-lg-3 col-md-3 col-sm-12 p-0">
										<label for="search-type" hidden>검색 유형</label> <select
											class="form-control" id="search-type" name="searchType">
											<option>리뷰 제목</option>
											<option>신고 내용</option>
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
		<hr>

		<div class="row">
			<nav id="pagination" aria-label="Page navigation">
				<ul class="panel panel-success pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						style="color: green;">이전</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: green;">1</a></li>
					<li class="page-item"><a class="page-link" href="#"
						style="color: green;">다음</a></li>
				</ul>
			</nav>
		</div>
	</div>

</main>
<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



