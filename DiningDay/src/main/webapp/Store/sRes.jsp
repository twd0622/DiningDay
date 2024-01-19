<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀</title>
    <link href="${ pageContext.request.contextPath }/resources/css/sResButton.css" rel="stylesheet" />
    <%@ include file="/Template/store_sidebar_open.jsp"%>
    <style>
    	table {
    		text-align: center;
    	}
    	.table>:not(caption)>*>*{
    		border-bottom-width: 0;
    	}
    </style>
</head>
    	<!-- main은 속성 값은 왠만하면 건들지x -->
		<main style="display: flex;  align-items: center; text-align: center; padding:20px;">
			
			<!-- 예시div style속성 값 조절해서 사용! -->
			<div class="mainContainer" style="border: 1px solid black; width: 100%; height: 2000px; background:white; ">
				<div class="p-5">
					<form method="post" name="예약관리">
						<div class="text-box" id="changePageBtn">
							<button type="button" class="btn btn-white btn-animate resList" 
							style=" background-color: rgb(156, 237, 146); color: white;">예약 대기 명단</button>
							<button type="button" class="btn btn-white btn-animate suc_resList" 
							style=" background-color: rgb(156, 237, 146); color: white;">예약 완료 명단</button>
							<button type="button" class="btn btn-white btn-animate suc_resList" 
							style=" background-color: rgb(156, 237, 146); color: white;">예약 취소 명단</button>
							<button type="button" class="btn btn-white btn-animate no_resList" 
							style=" background-color: rgb(156, 237, 146); color: white;">예약 노쇼 명단</button>
						</div>
						<h1 id="pageName" class="mb-5 mt-5" style="text-align: left">예약 대기 명단</h1>
						<table class="table mb-5" border="1">
						    <thead>
								<tr>
									<th colspan="10" style="background-color: #9CED92;">
										<input name="RES_DATE" class="form-control" type="date" style="width: 200px;margin-left: 30px;">
									</th>
								</tr>
						    	<tr>
						    		<th style="background-color: #FFF2A6;">결제 코드</th>
						    		<th style="background-color: #FFF2A6;">예약자</th>
						    		<th style="background-color: #FFF2A6;">예약자 전화번호</th>
						    		<th style="background-color: #FFF2A6;">좌석 종류</th>
						    		<th style="background-color: #FFF2A6;">인원</th>
						    		<th style="background-color: #FFF2A6;">예약 시간</th>
						    		<th style="background-color: #FFF2A6;">요청사항</th>
						    		<th style="background-color: #FFF2A6;">메뉴정보</th>
						    		<th style="background-color: #FFF2A6;">승인여부</th>
						    	</tr>
						    </thead>
							<tbody id="tbody_1" class="table-group-divider">
								
					    	</tbody>
						</table>
					</form>
				</div>
			</div>
    	</main>	
    	<script src="${ pageContext.request.contextPath }/resources/js/sRes.js"></script>
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 
