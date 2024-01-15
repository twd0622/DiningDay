<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>식당조회 | 다이닝데이</title>

<style type="text/css">
pre{
    background-color: #E6E6FA;
    padding:10px;
    overflow: auto;
    white-space: pre-wrap;
}  

button{
  width: 250px;
  background-color: black;
  color: white;
}

img{
  width: 100px;
}
</style>
<link href="resources/css/variable_admin.css" rel="stylesheet">
<script src="resources/js/variableCode.js"></script>
<script src="resources/js/jquery.twbsPagination.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

// var store_no = $(this).parent("td").siblings(".title").text();
	
$(()=>{
	paging("tbody tr" ,5);
		
// 		$(".delBtn").on("click", function() {
			
// 			if(confirm('정말 삭제하시겠습니까?')){
// 				location.href = "admin_storeDelete.ad?STORE_NO="+store_no;
// 			}
// 		})
		
	$(".delBtn").on("click", function() {
		Swal.fire({	
			title: "정말 삭제하시겠습니까?",
			text: "다시 되돌릴 수 없습니다.",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor: "#d33",
			cancelButtonColor: "#3085d6",
			confirmButtonText: "삭제",
			cancelButtonText: "취소",
			showCancelButton: true,
			showConfirmButton: true,
			})
			.then((result) => {
				if (result.isConfirmed) {
					Swal.fire({
						title: "삭제됨",
					    icon: "success",
					})
					.then((result) => {
			    		var store_no = $(this).parent("td").siblings(".title").text();
				    	location.href = "admin_storeDelete.ad?STORE_NO="+store_no;
					})
				}
			});
	})	
	
})
	
		
	
// 	main
	
</script>

</head>
<!-- main은 속성 값은 왠만하면 건들지x -->
<main
	style="display: flex; align-items: center; text-align: center; padding: 20px 50px 20px 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; background: white;">
		<h4 style="text-align: left; padding: 20px 0 0 20px;" onclick="location.href='admin_storeList.ad'">&lt; 식당 조회 &gt;</h4>
		<hr>
		<div class="row" style="padding: 10px 20% 10px 20%;">
			<div class="card card-margin search-form">
				<div class="card-body p-0">
					<form id="search-form" action="admin_storeList.ad" method="get">
						<div class="row">
							<div class="col-12">
								<div class="row no-gutters">
									<div class="col-lg-3 col-md-3 col-sm-12 p-0">
										<label for="search-type" hidden>검색 유형</label> <select
											class="form-control" id="search-type" name="searchType">
											<option>식당명</option>
											<option>식당 정보</option>
											<option>식당번호</option>
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
		<c:set var="storeList" value="${ requestScope.storeList }"/>
		<div class="row" style="padding: 1% 7% 1% 7%;" id="storeTable">
			<table class="table table-hover" id="article-table">
				<thead>
					<tr class="table-success">
						<th class="title col-1 align-middle"><a>식당번호</a></th>
						<th class="hashtag col-2 align-middle"><a>식당명</a></th>
						<th class="user-id col-3 align-middle"><a>식당 정보</a></th>
						<th class="created-at col-2"> </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="store" items="${storeList}">
						<tr class="store_no" id="${store.STORE_NO}" style="height: 60px;">
							<td class="title align-middle" onClick="location.href='admin_storeDetail.ad?STORE_NO=${store.STORE_NO}'">${store.STORE_NO}</td>
							<td class="align-middle" onClick="location.href='admin_storeDetail.ad?STORE_NO=${store.STORE_NO}'">${store.STORE_NAME}</td>
							<td class="created-at col-1 align-middle text-start" onClick="location.href='admin_storeDetail.ad?STORE_NO=${store.STORE_NO}'">															
								<b>구분</b> : ${store.STORE_CATEGORY} <br>
								<b>전화</b> : ${store.STORE_TEL} <br>
								<b>위치</b> : ${store.STORE_LOCATION}
							</td>
<%-- 							<td class="align-middle"><a href="admin_storeDelete.ad?STORE_NO=${store.STORE_NO}" onclick="return confirm('정말 삭제하시겠습니까?');" class="align-middle btn btn-outline-danger">삭제</a></td> --%>
<!-- 							<td class="align-middle"><div><button id="confirmAlert" class="align-middle btn btn-outline-danger">삭제</button></div></td> -->
							<td class="align-middle"><input type="button" class="delBtn btn btn-outline-danger" value="삭제" ></td>
<%-- 								<td class="align-middle"><input class="btn btn-outline-danger" id="confirmAlert" type="button" value="삭제" onclick="del('${store.STORE_NO}');"></td> --%>
<!-- 								<td><a href="javascript:check();" class="btn btn-outline-danger">삭제</a></td> -->
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
		<br>
	</div>
</main>
<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



