<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>전체리뷰목록 | 다이닝데이</title>
<style>
.search-form {
	width: 80%;
	margin: 0 auto;
	margin-top: 1rem;
}

.search-form input {
	height: 100%;
	background: transparent;
	border: 0;
	display: block;
	width: 100%;
	padding: 1rem;
	height: 100%;
	font-size: 1rem;
}

.search-form select {
	background: transparent;
	border: 0;
	padding: 1rem;
	height: 100%;
	font-size: 1rem;
}

.search-form select:focus {
	border: 0;
}

.search-form button {
	height: 100%;
	width: 100%;
	font-size: 1rem;
}

.search-form button svg {
	width: 24px;
	height: 24px;
}

.card-margin {
	margin-bottom: 1.875rem;
}

@media ( min-width : 992px) {
	.col-lg-2 {
		flex: 0 0 16.66667%;
		max-width: 16.66667%;
	}
}

.card {
	border: 0;
	box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
	-webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
	-moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
	-ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #ffffff;
	background-clip: border-box;
	border: 1px solid #e6e4e9;
	border-radius: 8px;
}
</style>
</head>
<%@ include file="/Template/store_sidebar_open.jsp"%>

<!-- main은 속성 값은 왠만하면 건들지x -->
<main
	style="display: flex; align-items: center; text-align: center; padding: 60px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; height: 850px; background: white;">
		<h4 style="text-align: left;">&lt; 전체 리뷰 목록 &gt;</h4> <br>
		<div class="row">
			<table class="table" id="article-table">
				<thead>
					<tr class="table-success">
						<th class="title col-1 align-middle"><a>No</a></th>
						<th class="hashtag col-1 align-middle"><a>고객명</a></th>
						<th class="user-id col-3" colspan="2"><a>리뷰내용</a></th>
						<th class="created-at col-1"><a>작성일자</a></th>
						<th class="created-at col-1"><a></a></th>

					</tr>
					
				</thead>
				<tbody>
					<tr>
						<td class="title align-middle"><a>3</a></td>
						<td class="hashtag align-middle">고객3</td>
  						<td>
 							<img src="img/gogi.jpg" width="200px" height="200px">
  						</td>
						<td class="user-id align-middle" style="text-align: left;">고기 JMTGR</td>
						<td class="created-at col-1 align-middle"><a><time>2022-01-03</time></a></td>
						<td class="align-middle"><button type="button" class="btn btn-outline-success">답글</button>
							<button type="button" class="btn btn-outline-danger">신고</button>
						</td>
					</tr>
					<tr>
						<td class="title align-middle"><a>2</a></td>
						<td class="hashtag align-middle">고객2</td>
  						<td>
 							<img src="img/rice.jpg" width="200px" height="200px">
  						</td>
						<td class="user-id align-middle" style="text-align: left;">존맛탱</td>
						<td class="created-at col-1 align-middle"><a><time>2022-01-01</time></a></td>
						<td class="align-middle"><button type="button" class="btn btn-outline-success">답글</button>
							<button type="button" class="btn btn-outline-danger">신고</button>
						</td>
					</tr>
					<tr>
						<td class="title align-middle"><a>1</a></td>
						<td class="hashtag align-middle">고객1</td>
  						<td class="col-1">
 							<img src="img/dduck.jpg" width="200px" height="200px">
  						</td>
						<td class="user-id align-middle" style="text-align: left;">맛있어요</td>
						<td class="created-at col-1 align-middle"><a><time>2022-01-03</time></a></td>
						<td class="align-middle"><button type="button" class="btn btn-outline-success">답글</button>
							<button type="button" class="btn btn-outline-danger">신고</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="row">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<td><button type="button" class="btn btn-outline-primary">글쓰기</button></td>
			</div>
		</div>

		<div class="row">
			<nav id="pagination" aria-label="Page navigation">
				<ul class="panel panel-success pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>

</main>
<%@ include file="/Template/store_sidevar_close.jsp"%>
</html>



