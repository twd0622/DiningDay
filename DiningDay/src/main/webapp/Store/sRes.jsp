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
						<div class="text-box">
							<button type="button" class="btn btn-white btn-animate resList" 
							style=" background-color: rgb(156, 237, 146); color: white;">예약 승인 명단</button>
							<button type="button" class="btn btn-white btn-animate suc_resList" 
							style=" background-color: rgb(156, 237, 146); color: white;">예약 완료 명단</button>
							<button type="button" class="btn btn-white btn-animate suc_resList" 
							style=" background-color: rgb(156, 237, 146); color: white;">예약 취소 명단</button>
							<button type="button" class="btn btn-white btn-animate no_resList" 
							style=" background-color: rgb(156, 237, 146); color: white;">예약 노쇼 명단</button>
						</div>
						<h1 class="mb-5 mt-5" style="text-align: left">예약 대기</h1>
						<table class="table mb-5" border="1">
						    <thead>
								<tr><th colspan="6" style="background-color: #9CED92;">
									<input name="RES_DATE" class="form-control" type="date" style="width: 200px;margin-left: 30px;">
								</th></tr>
						    	<tr>
						    		<th style="background-color: #FFF2A6;">예약자</th>
						    		<th style="background-color: #FFF2A6;">좌석 종류</th>
						    		<th style="background-color: #FFF2A6;">인원</th>
						    		<th style="background-color: #FFF2A6;">예약 시간</th>
						    		<th style="background-color: #FFF2A6;">요청사항</th>
						    		<th style="background-color: #FFF2A6;">승인여부</th>
						    	</tr>
						    </thead>
							<tbody id="tbody_1" class="table-group-divider">
								<tr>
									<td>홍길동</td>
									<td>야외 4인석</td>
									<td>3명</td>
									<td>14:00</td>
									<td><textarea cols="20" rows="2" style="resize: none;">아이 동반 입니다.</textarea></td>
									<td>
							    		<button type="button" class="btn btn-outline-success save"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;">완료</button>
							    		<button type="button" class="btn btn-outline-danger cancel"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;">취소</button>
							    		<button type="button" class="btn btn-outline-warning noshow"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;">노쇼</button>
				                   	 </td>
								</tr>
								<tr>
									<td>강감찬</td>
									<td>실내 4인석</td>
									<td>4명</td>
									<td>18:00</td>
									<td><textarea cols="20" rows="2" style="resize: none;">아이 동반 입니다.</textarea></td>
									<td>
							    		<button type="button" class="btn btn-outline-success save"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;">완료</button>
							    		<button type="button" class="btn btn-outline-danger cancel"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;">취소</button>
							    		<button type="button" class="btn btn-outline-warning noshow"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;">노쇼</button>
				                   	 </td>
								</tr>
					    	</tbody>
						</table>
						<h1 class="mb-5 mt-5" style="text-align: left;">예약 완료 명단</h1>
						<table class="table mb-5" border="1">
						    <thead>
						    	<tr>
						    		<th style="background-color: #FFF2A6;">예약자</th>
						    		<th style="background-color: #FFF2A6;">좌석 종류</th>
						    		<th style="background-color: #FFF2A6;">인원</th>
						    		<th style="background-color: #FFF2A6;">예약 시간</th>
						    		<th style="background-color: #FFF2A6;">요청사항</th>
						    		<th style="background-color: #FFF2A6;">승인여부</th>
						    	</tr>
						    </thead>
							<tbody id="tbody_2" class="table-group-divider">
								<tr>
									<td>이순신</td>
									<td>야외 4인석</td>
									<td>3명</td>
									<td>14:00</td>
									<td><textarea cols="20" rows="2" style="resize: none;">아이 동반 입니다.</textarea></td>
									<td>
										<button type="button" class="btn btn-outline-success finish"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;" disabled>완료됨</button>
				                   	 	<button type="button" class="btn btn-outline-danger cancel"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;">취소</button>
			                		</td>
								</tr>
								<tr>
									<td>송준우</td>
									<td>실내 4인석</td>
									<td>4명</td>
									<td>18:00</td>
									<td><textarea cols="20" rows="2" style="resize: none;">아이 동반 입니다.</textarea></td>
									<td>
				                   	 	<button type="button" class="btn btn-outline-success finish"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;" disabled>완료됨</button>
				                   	 	<button type="button" class="btn btn-outline-danger cancel"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;">취소</button>
			                		</td>
								</tr>
					    	</tbody>
						</table>
						<h1 class="mb-5 mt-5" style="text-align: left">예약 취소 명단</h1>
						<table class="table mb-5" border="1">
						    <thead>
						    	<tr>
						    		<th style="background-color: #FFF2A6;">예약자</th>
						    		<th style="background-color: #FFF2A6;">좌석 종류</th>
						    		<th style="background-color: #FFF2A6;">인원</th>
						    		<th style="background-color: #FFF2A6;">예약 시간</th>
						    		<th style="background-color: #FFF2A6;">요청사항</th>
						    		<th style="background-color: #FFF2A6;">승인여부</th>
						    	</tr>
						    </thead>
							<tbody id="tbody_3" class="table-group-divider">
								<tr>
									<td>이순신</td>
									<td>야외 4인석</td>
									<td>3명</td>
									<td>14:00</td>
									<td><textarea cols="20" rows="2" style="resize: none;">아이 동반 입니다.</textarea></td>
									<td>
				                   	 	<button type="button" class="btn btn-outline-success save"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;">승인</button>
			                		</td>
								</tr>
								<tr>
									<td>송준우</td>
									<td>실내 4인석</td>
									<td>4명</td>
									<td>18:00</td>
									<td><textarea cols="20" rows="2" style="resize: none;">아이 동반 입니다.</textarea></td>
									<td>
				                   	 	<button type="button" class="btn btn-outline-success save"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;">승인</button>
			                		</td>
								</tr>
					    	</tbody>
						</table>
						<h1 class="mb-5 mt-5" style="text-align: left">예약 노쇼 명단</h1>
						<table class="table mb-5" border="1">
						    <thead>
						    	<tr>
						    		<th style="background-color: #FFF2A6;">예약자</th>
						    		<th style="background-color: #FFF2A6;">좌석 종류</th>
						    		<th style="background-color: #FFF2A6;">인원</th>
						    		<th style="background-color: #FFF2A6;">예약 시간</th>
						    		<th style="background-color: #FFF2A6;">요청사항</th>
						    		<th style="background-color: #FFF2A6;">승인여부</th>
						    	</tr>
						    </thead>
							<tbody id="tbody_4" class="table-group-divider">
								<tr>
									<td>이순신</td>
									<td>야외 4인석</td>
									<td>3명</td>
									<td>14:00</td>
									<td><textarea cols="20" rows="2" style="resize: none;">아이 동반 입니다.</textarea></td>
									<td>
				                   	 	<button type="button" class="btn btn-outline-danger cancel"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;">취소</button>
			                		</td>
								</tr>
								<tr>
									<td>송준우</td>
									<td>실내 4인석</td>
									<td>4명</td>
									<td>18:00</td>
									<td><textarea cols="20" rows="2" style="resize: none;">아이 동반 입니다.</textarea></td>
									<td>
				                   	 	<button type="button" class="btn btn-outline-danger cancel"
							    		style="text-align: center;width:80px;height:50px;margin: 0 auto;">취소</button>
			                		</td>
								</tr>
					    	</tbody>
						</table>
					</form>
				</div>
			</div>
    	</main>	
    	<script src="${ pageContext.request.contextPath }/resources/js/sRes_control.js"></script>
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 
