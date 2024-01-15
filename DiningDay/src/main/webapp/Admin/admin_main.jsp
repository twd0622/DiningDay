<!-- 12-19 12시 이재원_메인페이지 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 메인</title>
<style>
/* 그리드 레이아웃 설정 */
.grid-container {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-template-rows: repeat(2, 1fr);
	height: 100vh;
	margin: 0;
	padding: 0;
}
/* 각 영역 스타일 설정 */
.grid-item {
/* 	border: 1px solid gray; */
	width: 100%;
	height: 100%;
}
/* 각 영역 ID 설정 */
#item1, #item2, #item3, #item4 {
	overflow: hidden;
	
}

#item1 {
	grid-row: 1/2;
	grid-column: 1/2;
}

#item2 {
	grid-row: 1/2;
	grid-column: 2/3;
}

#item3 {
	grid-row: 2/3;
	grid-column: 1/2;
}

#item4 {
	grid-row: 2/3;
	grid-column: 2/3;
}

.noticeSection, .storeSection, .sRepSection, .cRepSection 
	{ max-height: 250px;
	  padding: 1rem;
	  overflow-x: hidden;
	  overflow-y: auto;
	  direction: ltr;
}
/* -------------스크롤------------- */
.noticeSection::-webkit-scrollbar {
  width: 15px;
}
.noticeSection::-webkit-scrollbar-thumb {
  background-color: white;
  border-radius: 10px;
  background-clip: padding-box;
  border: 3px solid transparent;
}
.noticeSection::-webkit-scrollbar-track {
  background-color: #D1E7DD;
  border-radius: 10px;
}

.storeSection::-webkit-scrollbar {
  width: 15px;
}
.storeSection::-webkit-scrollbar-thumb {
  background-color: white;
  border-radius: 10px;
  background-clip: padding-box;
  border: 3px solid transparent;
}
.storeSection::-webkit-scrollbar-track {
  background-color: #D1E7DD;
  border-radius: 10px;
}

.sRepSection::-webkit-scrollbar {
  width: 15px;
}
.sRepSection::-webkit-scrollbar-thumb {
  background-color: white;
  border-radius: 10px;
  background-clip: padding-box;
  border: 3px solid transparent;
}
.sRepSection::-webkit-scrollbar-track {
  background-color: #D1E7DD;
  border-radius: 10px;
}

.cRepSection::-webkit-scrollbar {
  width: 15px;
}
.cRepSection::-webkit-scrollbar-thumb {
  background-color: white;
  border-radius: 10px;
  background-clip: padding-box;
  border: 3px solid transparent;
}
.cRepSection::-webkit-scrollbar-track {
  background-color: #D1E7DD;
  border-radius: 10px;
}
/* -------------스크롤------------- */

/* ----------------------------- */
#notice { color: black; }
#notice:hover { color: gray; }

#store { color: black; }
#store:hover { color: gray; }

#sRep { color: black; }
#sRep:hover { color: gray; }

#cRep { color: black; }
#cRep:hover { color: gary; }

/* ----------------------------- */

a:link {
	color: white;
}

a:visited {
	color: white;
}

a:hover {
	color: gray;
}

a:active {
	color: gray;
}

</style>
</head>
<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!-- main은 속성 값은 왠만하면 건들지x -->
<main
	style="display: flex; align-items: center; text-align: center; padding: 20px 50px 20px 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<c:set var="noticeList" value="${ requestScope.noticeList }"/>
	<c:set var="storeList" value="${ requestScope.storeList }"/>
	<c:set var="storeReport" value="${ requestScope.storeReport }"/>
	<c:set var="reviewReport" value="${ requestScope.reviewReport }"/>
	<div class="grid-container"
		style="width: 100%; height: 100%; background: white; padding: 50px 80px 50px 80px;">
		<div class="grid-item" id="item1" style="padding: 30px;">
		<h4><a href="admin_noticeList.ad" id="notice">&lt; 공지사항 &gt;</a></h4>
		<hr>
			<div class="noticeSection">
 			<table class="table table-hover" id="article-table">
				<thead>
					<tr class="table-success">
						<th class="title col-1 align-middle">글번호</th>
						<th class="hashtag col-3 align-middle">제목</th>
						<th class="created-at col-1">작성일자</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach var="notice" items="${noticeList }">
						<tr id="datalist" style="height: 60px;" align="center" onclick="location.href='admin_noticeDetail.ad?NOT_NO=${ notice.NOT_NO }'">
							<td class="title align-middle">${notice.NOT_NO}</td>
							<td class="hashtag align-middle">${notice.NOT_TITLE}</td>
							<td class="created-at col-1 align-middle" id="dateRegex">${notice.DATE}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<div class="grid-item" id="item2" style="padding: 30px;">
		<h4><a href="admin_storeList.ad" id="store">&lt; 식당 조회 &gt;</a></h4>
		<hr>
			<div class="storeSection">
			<table class="table table-hover" id="article-table">
				<thead>
					<tr class="table-success">
						<th class="title col-1 align-middle"><a>식당번호</a></th>
						<th class="hashtag col-1 align-middle"><a>식당명</a></th>
						<th class="user-id col-4 align-middle"><a>식당 정보</a></th>
					</tr>
				</thead>
				<tbody>
				<c:set var="storeList" value="${ requestScope.storeList }"/>
					<c:forEach var="store" items="${storeList }">
						<tr style="height: 60px;" onClick="location.href='admin_storeDetail.ad?STORE_NO=${store.STORE_NO}'">
							<td class="title align-middle">${store.STORE_NO}</td>
							<td class="align-middle">${store.STORE_NAME}</td>
							<td class="created-at col-1 align-middle text-start">															
								<b>구분</b> : ${store.STORE_CATEGORY} <br>
								<b>전화</b> : ${store.STORE_TEL} <br>
								<b>위치</b> : ${store.STORE_LOCATION}
							</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		
		<div class="grid-item" id="item3" style="padding: 30px;">
		<h4><a href="admin_storeReport.ad" id="sRep">&lt; 식당 신고 &gt;</a></h4>
		<hr>
			<div class="sRepSection">
 			<table class="table table-hover" id="article-table">
				<thead>
					<tr class="table-success">
						<th class="title col-1 align-middle"><a>번호</a></th>
						<th class="hashtag col-1 align-middle"><a>식당명</a></th>
						<th class="user-id col-2"><a>글 제목</a></th>
						<th class="created-at col-1"><a>신고일자</a></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="sReport" items="${storeReport}">
						<tr style="height: 60px;" onClick="location.href='admin_storeReportDetail.ad?SREP_NO=${sReport.SREP_NO}&CUS_NO=${sReport.CUS_NO}&STORE_NO=${sReport.STORE_NO}'">
							<td class="title align-middle" id="td1">${sReport.SREP_NO}</td>
							<td class="hashtag align-middle" id="td1">${sReport.STORE_NAME}</td>
							<td class="user-id align-middle" style="text-align: left;" id="td1"> ${sReport.SREP_TITLE}</td>
							<td class="created-at col-1 align-middle" id="td1">${sReport.DATE}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>

		<div class="grid-item" id="item4" style="padding: 30px;">
		<h4><a href="admin_userReport.ad" id="sRep">&lt; 리뷰 신고 &gt;</a></h4>
		<hr>
			<div class="cRepSection">
 			<table class="table table-hover" id="article-table">
				<thead>
					<tr class="table-success">
						<th class="title col-1 align-middle"><a>번호</a></th>
						<th class="hashtag col-1 align-middle"><a>점주번호</a></th>
						<th class="user-id col-3"><a>신고 제목</a></th>
						<th class="hashtag col-1 align-middle"><a>신고일자</a></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cReport" items="${reviewReport}">
						<tr style="height: 60px;" onClick="location.href='admin_userReportDetail.ad?CREP_NO=${cReport.CREP_NO}&REV_NO=${cReport.REV_NO}&OWN_NO=${cReport.OWN_NO}'">
							<td class="title align-middle">${cReport.CREP_NO}</td>
							<td class="hashtag align-middle">${cReport.OWN_NO}</td>
							<td class="created-at col-1 align-middle">${cReport.CREP_TITLE}</td>
							<td class="created-at col-1 align-middle">${cReport.DATE}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</main>
<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



