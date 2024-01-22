<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="${ pageContext.request.contextPath }/resources/css/sResmodal.css" rel="stylesheet" />
	<style type="text/css">
		td, th {
        	justify-content: center;
        	align-items: center;
        	border: 0.5px solid black;
    	}
    	thead{
    		background-color: var(--bg-color);
    		color: white;
    	}
    	table {
    		text-align: center;
		}  
		th {
			font-size: 25px;
		}
		td {
			font-size:large;			
			font-size: 18px;
			border-right: 1px solid black !important;
		}
		
		
	</style>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
		<main style="display: flex;  align-items: center; text-align: center; padding:20px;">
			<div class="mainContainer" style=" width: 100%; background:#f0f0f3; display: flex; flex-direction: column;">
				<div style="height: 150px; display: flex; justify-content: space-evenly;" class="mb-5 mt-5">
					<div style="width: 300px; background-color: white;" class="rounded-4 shadow">
						<h3 class="mt-5" id="nowYear" style="text-align:center;">현재 년도</h3>
						<select id="checkYear" style="width: 200px;"></select>
					</div>
				</div>
				<div style="display: flex; justify-content: space-around;" class="mb-5">
					<div class="chart-size p-3 rounded-4 shadow" style="height: 450px; background-color: white; display: flex;  align-items: center; text-align: center; justify-content: center; flex-direction: column;">	
						<div><h2>월별 예약 수</h2></div>
						<div id="myChartParent" style="width:700px; height:400px;"><canvas id="myChart"></canvas></div>
					</div>
					<div style="border-left:none; display: flex; background-color: white; justify-content:center; align-items : center; flex-direction: column;" class="rounded-4 shadow">	
						<div class="p-3">
							<table border="1" style="width:600px;  background-color: white;">
								<thead>
									<tr><th colspan="3" id="month_1"></th></tr>
									<tr>
										<th>일</th>
										<th>요일</th>
										<th id="dayTotal"></th>							
									</tr>
								</thead>
								<tbody id="tbody_1">	
								</tbody>	
							</table>
						</div>
						<div class="demo">
						    <nav class="pagination-outer"  aria-label="Page navigation">
						        <ul class="pagination" id="pagination"></ul>
						    </nav>
						</div>
					</div>
				</div>	
				<div style="display: flex; justify-content: space-around;" class="mb-5">
					<div class="p-3 rounded-4 shadow" style="height: 450px; background-color: white; display: flex;  align-items: center; text-align: center; justify-content: center; flex-direction: column;">	
						<div><h2>요일별 예약 수</h2></div>
						<div id="pieChartParent" style="width:700px; height:400px; display: flex; align-items: center; justify-content: center;"><canvas id="pieChart"></canvas></div>
					</div>
					<div class="rounded-4 shadow" style="border-left:none; display: flex; justify-content:center; align-items : center;background-color: white;">	
						<div class="p-3">
							<table border="1" style="width:600px;">
								<thead>
									<tr><th colspan="3" id="month_3" style="font-size: 30px;"></th></tr>
									<tr>
										<th style="font-size: 25px;">해당 요일</th>
										<th style="font-size: 25px;">예약 건수</th>
									</tr>
								</thead>
								<tbody id="week">
									<tr>
										<td>
											<div style="display: flex; align-items: baseline; justify-content: center;">
												<div style="width: 40px; height: 15px; background-color: rgba(255, 99, 132);"></div>&nbsp;
												<div><b>월요일</b></div>
											</div>
										</td>
										<td id="2">0 회</td>
									</tr>
									<tr>
										<td>
											<div style="display: flex; align-items: baseline; justify-content: center;">
												<div style="width: 40px; height: 15px; background-color: rgba(255, 159, 64);"></div>&nbsp;
												<div><b>화요일</b></div>
											</div>
										</td>
										<td id="3">0 회</td>
									</tr>
									<tr>
										<td>
											<div style="display: flex; align-items: baseline; justify-content: center;">
												<div style="width: 40px; height: 15px; background-color: rgba(255, 205, 86);"></div>&nbsp;
												<div><b>수요일</b></div>
											</div>
										</td>
										<td id="4">0 회</td>
									</tr>
									<tr>
										<td>
											<div style="display: flex; align-items: baseline; justify-content: center;">
												<div style="width: 40px; height: 15px; background-color: rgba(75, 192, 192);"></div>&nbsp;
												<div><b>목요일</b></div>
											</div>
										</td>
										<td id="5">0 회</td>
									</tr>
									<tr>
										<td>
											<div style="display: flex; align-items: baseline; justify-content: center;">
												<div style="width: 40px; height: 15px; background-color: rgba(54, 162, 235);"></div>&nbsp;
												<div><b>금요일</b></div>
											</div>
										</td>
										<td id="6">0 회</td>
									</tr>
									<tr>
										<td>
											<div style="display: flex; align-items: baseline; justify-content: center;">
												<div style="width: 40px; height: 15px; background-color: rgba(153, 102, 255);"></div>&nbsp;
												<div><b>토요일</b></div>
											</div>
										</td>
										<td id="7">0 회</td>
									</tr>
									<tr>
										<td>
											<div style="display: flex; align-items: baseline; justify-content: center;">
												<div style="width: 40px; height: 15px; background-color: rgba(201, 203, 207);"></div>&nbsp;
												<div><b>일요일</b></div>
											</div>
										</td>
										<td id="0">0 회</td>
									</tr>	
								</tbody>	
							</table>
						</div>
					</div>
				</div>
			</div>
    	</main>	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/sRes_control.js"></script>	
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    	<!-- Bootstrap core JavaScript-->
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 
