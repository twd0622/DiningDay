<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>리뷰관리 | 다이닝데이</title>
</head>
<%@ include file="/Template/admin_sidebar_open.jsp"%>
<!-- main은 속성 값은 왠만하면 건들지x -->
<main
	style="display: flex; align-items: center; text-align: center; padding: 20px 50px 50px 50px;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="mainContainer"
		style="width: 100%; height: 850px; background: white;">
		<h4 style="text-align: left;">&lt; 전체 리뷰관리 &gt;</h4>
		<hr>
		<div class="row" style="padding: 0 7% 0 7%;">
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
						<td><img src="Admin/img/gogi.jpg" width="200px" height="200px"></td>
						<td class="user-id align-middle" style="text-align: left;">고기 JMTGR</td>
						<td class="created-at col-1 align-middle"><a><time>2022-01-03</time></a></td>
						<td class="align-middle"><a href="contentWrite.jsp" class="btn btn-outline-danger">삭제</a></td>
					</tr>
					<tr>
						<td class="title align-middle"><a>2</a></td>
						<td class="hashtag align-middle">고객2</td>
						<td><img src="Admin/img/rice.jpg" width="200px" height="200px">
						<td class="user-id align-middle" style="text-align: left;">존맛탱</td>
						<td class="created-at col-1 align-middle"><a><time>2022-01-01</time></a></td>
						<td class="align-middle"><a href="contentWrite.jsp" class="btn btn-outline-danger">삭제</a></td>
					</tr>
					<tr>
						<td class="title align-middle"><a>1</a></td>
						<td class="hashtag align-middle">고객1</td>
						<td class="col-1"><img src="Admin/img/dduck.jpg" width="200px"
							height="200px"></td>
						<td class="user-id align-middle" style="text-align: left;">맛있어요</td>
						<td class="created-at col-1 align-middle"><a><time>2022-01-03</time></a></td>
						<td class="align-middle"><a href="contentWrite.jsp" class="btn btn-outline-danger">삭제</a></td>
					</tr>
				</tbody>
			</table>
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
<script type="text/javascript">
    $(document).ready(function(){
    	
    	$("#deleteForm").submit(function() {
			return confirm("게시글을 삭제하시겠습니까?");
		});//deleteForm
		
    });//ready	
</script>

</main>
<%@ include file="/Template/admin_sidevar_close.jsp"%>
</html>



