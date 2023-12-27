<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀</title>
    <link href="${ pageContext.request.contextPath }/Store/resour/css/sResmodal.css" rel="stylesheet" />
	<style type="text/css">
		td, th {
        	justify-content: center;
        	align-items: center;
        	border: 0.5px solid black;
    	}
    	thead{
    		background-color: #FFF2A6;
    	}
    	table {
    		text-align: center;
		}  
		th {
			font-size: 25px;
		}
		td {
			font-size: 18px;
		}
		.col {
			border: 1px solid #9CED92;
		}
		select {
			width:120px;
			padding:5px;
			border:1px solid #999;
			font-family:'Nanumgothic';
			border-radius:3px;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance : none;
		}
		select::-ms-expand {
   			display: none;
		}	
	</style>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
		<main style="display: flex;  align-items: center; text-align: center; padding:20px;">
			<div class="mainContainer row" style="border: 1px solid black; width: 100%; height: 1500px; background:white; ">
				<div style="height: 20px;">
					<h1 class="p-5" id="nowYear" style="text-align:center; float: left;">현재 년도</h1>
					<select id="checkYear" style="float: left; margin-top: 3%;">
						<option class="opCheck" value="현재 년도">현재 년도</option>
						<option class="opCheck" value="2023">2023</option>
						<option class="opCheck" value="2022">2022</option>
						<option class="opCheck" value="2021">2021</option>
					</select>
				</div>
				<div class="chart-size col p-1" style="display: flex;  align-items: center; text-align: center; justify-content: center;">	
					<canvas id="myChart" class="p-2"></canvas>
				</div>
				<div class="col" style="border-left:none; display: flex; justify-content:center; align-items : center;">	
					<table border="1" style="width:700px;">
						<thead>
							<tr><th colspan="3" id="month_1"></th></tr>
							<tr>
								<th>일</th>
								<th>요일</th>
								<th id="dayTotal"></th>							
							</tr>
						</thead>
						<tbody>	
							<tr>
								<td><a href="${ pageContext.request.contextPath }/Store/sRes.jsp">1일</a></td>
								<td>월요일</td>
								<td>12</td>
							</tr>
							<tr>
								<td><a href="${ pageContext.request.contextPath }/Store/sRes.jsp">3일</a></td>
								<td>수요일</td>
								<td>10</td>
							</tr>
							<tr>
								<td><a href="${ pageContext.request.contextPath }/Store/sRes.jsp">15일</a></td>
								<td>금요일</td>
								<td>18</td>
							</tr>
							<tr>
								<td><a href="${ pageContext.request.contextPath }/Store/sRes.jsp">17일</a></td>
								<td>일요일</td>
								<td>10</td>
							</tr>
						</tbody>	
					</table>
				</div>
				<div style="height: 20px;">
					<h1 id="month_2" class="p-5 mt-5" style="text-align:left;"></h1>
				</div>
				<div class="col" style="display: flex;  align-items: center; text-align: center; justify-content: center;">	
					<canvas id="pieChart" style="width:500px; height:400px;"></canvas>
				</div>
				<div class="col" style="border-left:none; display: flex; justify-content:center; align-items : center;">	
					<table border="1" style="width:800px;">
						<thead>
							<tr><th colspan="3" id="month_3" style="font-size: 30px;"></th></tr>
							<tr>
								<th style="font-size: 25px;">해당 요일</th>
								<th style="font-size: 25px;">예약 건수</th>
							</tr>
						</thead>
						<tbody id="week">	
						</tbody>	
					</table>
				</div>
			</div>
    	</main>	
		<div id="sResModal" class="sResmodal">
		  	<div class="sResmodal-content">
		    	<div class="sResmodal-header">
		      		<span class="close">&times;</span>
		      		<h2 id="month_4"></h2>
		    	</div>
		    	<div class="sResmodal-body">
		     		<h3 id="selectDay" class="p-4"></h3>
		     		<table border="1">
		     			<thead>
			     			<tr>
			     				<th class="p-3">좌석 종류</th>
			     				<th class="p-3" id="totalCheckin"></th>
			     			</tr>
		     			</thead>
		     			<tbody>
			     			<tr>
			     				<td>야외 4인석</td>
			     				<td>5번</td>
			     			</tr>
			     			<tr>
			     				<td>테라스 4인석</td>
			     				<td>20번</td>
			     			</tr>
			     			<tr>
			     				<td>룸 8인석</td>
			     				<td>12번</td>
			     			</tr>
			     			<tr>
			     				<td>실내 4인석</td>
			     				<td>60번</td>
			     			</tr>
			     			<tr>
			     				<td>바 2인석</td>
			     				<td>15번</td>
			     			</tr>
		     			</tbody>
		     		</table>
		     	</div>
		    	<div class="sResmodal-footer">
		      		<h3>XX식당 식당이름 올자리</h3>
		    	</div>
		  	</div>
		</div>
<script type="text/javascript" src="${ pageContext.request.contextPath }/Store/resour/js/chart_control.js">
</script> 
    	<!-- Bootstrap core JavaScript-->
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 
