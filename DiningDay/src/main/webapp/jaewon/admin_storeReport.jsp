<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>식당신고 | 다이닝데이</title>
</head>
<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!-- main은 속성 값은 왠만하면 건들지x -->
<main
	style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; height: 850px; background: white;">
		<h4 style="text-align: left;">&lt; 식당신고 관리 &gt;</h4>
		<hr>
		<div class="row" style="padding: 0 7% 0 7%;">
			<table class="table" id="article-table">
				<thead>
					<tr class="table-success">
						<th class="title col-1 align-middle"><a>No</a></th>
						<th class="hashtag col-1 align-middle"><a>식당명</a></th>
						<th class="user-id col-3"><a>신고 내용</a></th>
						<th class="created-at col-1"><a>작성일자</a></th>
						<th class="created-at col-1"><a></a></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="title align-middle"><a>4</a></td>
						<td class="hashtag align-middle"><a href="admin_storeReportDetail.jsp" class="review">컴포즈 커피</a></td>
						<td class="user-id align-middle" style="text-align: left;">없는 매장이에요</td>
						<td class="created-at col-1 align-middle"><a><time>2022-01-04</time></a></td>
						<td class="align-middle">
							<button type="button" class="btn btn-outline-danger">삭제</button>
						</td>
					</tr>
					<tr>
						<td class="title align-middle"><a>3</a></td>
						<td class="hashtag align-middle"><a href="admin_storeReportDetail.jsp" class="review">더벤티</a></td>
						<td class="user-id align-middle" style="text-align: left;">가게가 없어요</td>
						<td class="created-at col-1 align-middle"><a><time>2022-01-03</time></a></td>
						<td class="align-middle">
							<button type="button" class="btn btn-outline-danger">삭제</button>
						</td>
					</tr>
					<tr>
						<td class="title align-middle"><a>2</a></td>
						<td class="hashtag align-middle"><a href="admin_storeReportDetail.jsp" class="review">더리터</a></td>
						<td class="user-id align-middle" style="text-align: left;">없는 매장이에요</td>
						<td class="created-at col-1 align-middle"><a><time>2022-01-02</time></a></td>
						<td class="align-middle">
							<button type="button" class="btn btn-outline-danger">삭제</button>
						</td>
					</tr>
					<tr>
						<td class="title align-middle"><a>1</a></td>
						<td class="hashtag align-middle"><a href="admin_storeReportDetail.jsp" class="review">텐퍼센트</a></td>
						<td class="user-id align-middle" style="text-align: left;">가게가 없어요;;</td>
						<td class="created-at col-1 align-middle"><a><time>2022-01-01</time></a></td>
						<td class="align-middle">
							<button type="button" class="btn btn-outline-danger">삭제</button>
						</td>
					</tr>
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
											<option>식당명</option>
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
					<li class="page-item"><a class="page-link" href="#" style="color: green;">이전</a></li>
					<li class="page-item"><a class="page-link" href="#" style="color: green;">1</a></li>
					<li class="page-item"><a class="page-link" href="#" style="color: green;">다음</a></li>
				</ul>
			</nav>
		</div>
	</div>
	

</main>
<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



