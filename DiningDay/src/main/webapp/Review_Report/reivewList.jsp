<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항 | 다이닝데이</title>
</head>
<%@ include file="/Template/header.jsp"%>
<!-- main은 속성 값은 웬만하면 건들지x -->
<
<main
	style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">
	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; height: 850px; background: white; margin-top: 100px;">
		<h4 style="text-align: left;">&lt; 공지사항 &gt;</h4>
		<hr>
		<div class="row" style="padding: 0 7% 0 7%;">
			<table class="table table-hover" id="article-table">
				<thead>
					<tr class="table-success">
						<th class="title col-1 align-middle">글번호</th>
						<th class="hashtag col-1 align-middle">제목</th>
						<th class="user-id col-2">내용</th>
						<th class="created-at col-1">작성일자</th>
					</tr>
				</thead>
				<tbody>
				<c:set var="noticeList" value="${ requestScope.noticeList }"/>
					<c:forEach var="notice" items="${noticeList }">
						<tr id="datalist" style="height: 60px;" align="center" onclick="location.href='admin_noticeDetail.ad?NOT_NO=${ notice.NOT_NO }'">
							<td class="title align-middle">${notice.NOT_NO}</td>
							<td class="hashtag align-middle">${notice.NOT_TITLE}</td>
							<td class="user-id align-middle" style="text-align: left;">${notice.NOT_CONTENT}</td>
							<td class="created-at col-1 align-middle" id="dateRegex">${notice.DATE}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row"  style="padding: 0px 20px;">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="admin_noticeWrite.ad" type="button" class="btn btn-outline-success">글쓰기</a>
			</div>
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
											<option>제목</option>
											<option>내용</option>
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
<%@ include file="/Template/footer.jsp"%>
</html>

<%
// 공지리스트 for문
// <c:forEach var="boardDTO" items="${boardList}">
// <tr>
// <td>${boardDTO.num}</td>
// <td>${boardDTO.name}</td>
// <td><a href="content.bo?num=${boardDTO.num}">${boardDTO.subject}</td>
// <td>${boardDTO.date}</td>
// <td>${boardDTO.readcount}</td>
// </tr>
// </c:forEach>
%>

