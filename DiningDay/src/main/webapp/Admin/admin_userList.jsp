<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>고객목록 | 다이닝데이</title>
<c:set var="userList" value="${ requestScope.userList }"/>
<link href="resources/css/variable_admin.css" rel="stylesheet">
<script src="resources/js/variableCode.js"></script>
<script src="resources/js/jquery.twbsPagination.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	$(()=>{
		paging("tbody tr" ,5, 1);
	})
</script>
<script src="Admin/js/delBtn.js"></script>
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
<c:set var="userList" value="${ requestScope.userList }"/>
<main
	style="display: flex; align-items: center; text-align: center; padding: 20px 50px 20px 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; background: white;">
		<h4 style="text-align: left; padding: 20px 0 0 20px;" onclick="location.href='admin_userList.ad'">&lt; 고객 목록 &gt;</h4>
		<hr>
		<div class="row" style="padding: 10px 20% 10px 20%;">
			<div class="card card-margin search-form">
				<div class="card-body p-0">
					<form id="search-form" action="admin_userList.ad" method="get">
						<div class="row">
							<div class="col-12">
								<div class="row no-gutters">
									<div class="col-lg-3 col-md-3 col-sm-12 p-0">
										<label for="search-type" hidden>검색 유형</label> <select
											class="form-control" id="search-type" name="searchType">
											<option>고객명</option>
											<option>고객ID</option>
											<option>닉네임</option>
											<option>가입정보</option>
											<option>고객번호</option>
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
		<div class="row" style="padding: 1% 7% 1% 7%;" id="userTable">
			<table class="table table-hover" id="article-table">
				<thead>
					<tr class="table-success">
						<th class="title col-1 align-middle"><a>고객번호</a></th>
						<th class="hashtag col-1 align-middle"><a>고객ID(닉네임)</a></th>
						<th class="user-id col-3 align-middle"><a>가입정보</a></th>
						<th class="user-id col-1 align-middle"><a>가입날짜</a></th>
						<th class="created-at col-1 align-middle"> </th>
					</tr>
				</thead>
				<tbody>
						<c:forEach var="user" items="${userList}">
							<tr class="cus_no" id="${user.CUS_NO}" style="height: 60px;">
								<td class="title align-middle">${user.CUS_NO}</td>
								<td class="hashtag align-middle"><small>${user.CUS_ID}</small> <br> (${user.CUS_NICK})</td>
								<td class="created-at col-1 align-middle text-start">
									<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 60px;">
										<span><b>　고객명 　: </b></span><span>${user.CUS_NAME} (${user.CUS_GENDER})</span>
									</div>
									<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 60px;">
										<span><b>생년월일 　: </b></span><span>${user.CUS_BIRTH}</span>
									</div>
									<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 60px;">
										<span><b>전화번호 　: </b></span><span>${user.CUS_TEL}</span>
									</div>
									<div style="display: flex; flex-direction: row; justify-content: space-between; padding: 0 60px;">
										<span><b>　이메일 　: </b></span><span>${user.CUS_EMAIL}</span>
									</div>
								</td>
								<td class="created-at col-1 align-middle">${user.DATE}</td>
								<td class="align-middle"><input type="button" class="delBtn btn btn-outline-danger" value="삭제" ></td>
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
<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



