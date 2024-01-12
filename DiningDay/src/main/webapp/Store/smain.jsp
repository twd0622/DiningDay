<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀</title>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/timepicki.css">
    <style>
    	.select2-container--default .select2-selection--multiple .select2-selection__choice {
    		background-color: rgb(0,165,80,0.5) !important;
    	}
    	
    	.select2-drop.select2-drop-above.select2-drop-active{
    		border: 1px solid green !important; 
    	}
    	
    	.select2-selection__choice__display{
    		color: white !important; 
    		font-size: large !important;
    	}
    	.select2-selection__choice__remove span{
    		color: black !important; 
    	}
    	
    	textarea {
			border: 2px solid rgb(213, 194, 194);
        	outline-color: rgb(255, 87, 51, 0.5);
		}
		
		.modal {
		  display: none; /* Hidden by default */
		  position: fixed; /* Stay in place */
		  z-index: 1; /* Sit on top */
		  padding-top: 400px; /* Location of the box */
		  left: 0;
		  top: 0;
		  width: 100%; /* Full width */
		  height: 100%; /* Full height */
		  overflow: auto; /* Enable scroll if needed */
		  background-color: rgb(0,0,0); /* Fallback color */
		  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}
		
		.modal-content {
		  flex-direction: column;
		  background-color: #fefefe;
		  margin: auto;
		  padding: 20px;
		  border: 1px solid #888;
		  width: 13% !important;
		}
		
		.close {
		  color: #aaaaaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: #000;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		.prev, .next {
			padding:0px;
		}
		input[type=checkbox]{
			height: 30px;
			width: 30px;
		}
		
    </style>
<!--     style="display: none;" -->
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
		<main style="display: flex;  align-items: center; text-align: center; padding:100px;">
			<div class="mainContainer" style="width: 100%; background:#f0f0f3; 
			display: flex; flex-direction: column; justify-content: center; align-items: center;">
				<form id="STORE_DATA" method="post" enctype="multipart/form-data" >
					<input type="text" name="STORE_NAME">
					<input type="text" name="STORE_TEL">
					<input type="text" name="STORE_LOCATION">
					<input type="text" name="STORE_DETAIL">
					<input type="text" name="STORE_INFO">
					<input type="text" name="STORE_PLUS">
					<input type="text" name="STORE_CATEGORY">
					<input type="text" name="STORE_LO">
					<input type="text" name="STORE_RT">
					<input type="text" name="STORE_CLOSE">
					<input type="text" name="STORE_ST">
					<input type="text" name="STORE_ET">
					<input type="text" name="STORE_BTS">
					<input type="text" name="STORE_BTE">
					<input type="text" name="STORE_RST">
					<input type="text" name="STORE_RET">
					<input type="file" id="inputfile_1" name="SU1_PHOTO_NAME">
					<input type="file" id="inputfile_2" name="BA1_PHOTO_NAME">
					<input type="file" id="inputfile_3" name="BA2_PHOTO_NAME">
					<input type="text" name="OWN_NO" value="${ sessionScope.OWN_NO}">
					<input type="text" name="STORE_NO" value="${ sessionScope.STORE_NO }">
				</form>
				<div><h3 style="color:salmon;">진행 상황</h3></div>
				<div class="mt-2 mb-3" id="checkboxList"></div>
				<div style="display: flex;">
					<div class="storePaging">
					<div name="storeBold" style="width: 700px; padding:30px; background-color: white; display: flex; border-radius: 25px; flex-direction: column; align-items: center;">
						<div><h3>가게 설정</h3></div>
						<div class="mt-3" style="width:500px; display: flex; justify-content: center">
							<div style="width: 150px; text-align: left;">
								<label for="storeName">식당 이름</label>
							</div>
							<div style="width: 350px; text-align: left;">
								<textarea id="storeName" style="resize: none;" cols="30" rows=""></textarea>
							</div>	
						</div>
						<div class="mt-3" style="width:500px; display: flex; justify-content: center">
							<div style="width: 150px; text-align: left;">
								<label for="storeTell">식당 전화번호</label>
							</div>
							<div style="width: 350px; text-align: left;">
								<textarea id="storeTell" style="resize: none;" cols="30" rows=""></textarea>
							</div>
						</div>
						<div class="mt-3" style="width:500px; display: flex; justify-content: center">
							<div style="width: 150px; text-align: left;">
								<label for="storeLocation">식당 위치</label>
							</div>
							<div style="width: 350px; text-align: left;">	
								<textarea id="storeLocation" style="resize: none;" cols="30" rows=""></textarea>
							</div>	
						</div>
						<div class="mt-3" style="width:500px; display: flex; justify-content: center">
							<div style="width: 150px; text-align: left;">
								<label for="storeCategory">식당 카테고리</label>
							</div>
							<div style="width: 350px; display: flex;">	
								<select id="storeCategory" style="width: 200px;">
									<option value="아시안">아시안</option>
									<option value="한식">한식</option>
									<option value="양식">양식</option>
									<option value="중식">중식</option>
									<option value="일식">일식</option>
									<option value="분식">분식</option>
									<option value="카페/디저트">카페/디저트</option>
								</select>
							</div>
						</div>
						<div class="mt-3" style="width:500px; display: flex; justify-content: center">
							<div style="width: 150px; text-align: left;">
								<label for="storeLastOrder">라스트 오더</label>
							</div>
							<div style="width: 350px; display: flex;">	
								<select id="storeLastOrder" style="width: 200px;">
									<option value="0" selected>없음</option>
									<option value="1">1시간</option>
									<option value="2">2시간</option>
									<option value="3">3시간</option>
								</select>
							</div>
						</div>
						<div class="mt-3" style="width:500px; display: flex; justify-content: center">
							<div style="width: 150px; text-align: left;">
								<label for="storeResTerm">예약 이용시간</label>
							</div>
							<div style="width: 350px; display: flex;">	
								<select id="storeResTerm" style="width: 200px;">
									<option value="1" selected>1시간</option>
									<option value="2">2시간</option>
									<option value="3">3시간</option>
									<option value="4">4시간</option>
									<option value="5">5시간</option>
								</select>
							</div>
						</div>
						<div class="mt-3" style="width:500px; display: flex; justify-content: center">
							<div style="width: 150px; text-align: left;">	
								<label for="storeDetail">식당 세부정보</label>
							</div>	
							<div style="width: 350px; text-align: left;">
								<textarea id="storeDetail" style="resize: none;" cols="30" rows=""></textarea>
							</div>	
						</div>
						<div class="mt-3" style="width:500px; display: flex; justify-content: center">
							<div style="width: 150px; text-align: left;">
								<label for="storeInfo">식당 소개</label>
							</div>	
							<div style="width: 350px; text-align: left;">
								<textarea id="storeInfo" style="resize: none;" cols="30" rows="10"></textarea>						
							</div>
						</div>
						<div class="mt-3" style="width:500px; display: flex; justify-content: center">
							<div style="width: 150px; text-align: left;">
								<label for="storeService">식당 시설정보</label>
							</div>	
							<div style="width: 350px; text-align: left;">
								<textarea id="storeService" style="resize: none;" cols="30" rows="10"></textarea>
							</div>	
						</div>
						<div class="mt-3 mb-1" style="width:500px;">
							<button id="saveStore" type="button" class="btn btn-outline-success btn-lg">저장하기</button>
						</div>
					</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>	
					</div>
					<div>
						<div class="storePaging">					
						<div name="storeBold" style="width: 700px; padding:30px; background-color: white; display: flex; align-items: center; flex-direction: column; border-radius: 25px;">
							<h3>휴무일이 있나요?</h3>
							<div>
								<button class="btn btn-outline-success" type="button" name="is-rest">휴무일이 있어요</button>
								<button class="btn btn-outline-success" type="button" name="is-rest">휴무일이 없어요</button>
							</div>	
							<div class="input-group mt-3" id="weekdiv" style="width: 300px; display: flex; flex-direction: column">
								<select multiple class="select" id="weekdays" style="width:300px; height:150px !important;" multiple="multiple">
									<option value="월">월요일</option>
									<option value="화">화요일</option>
									<option value="수">수요일</option>
									<option value="목">목요일</option>
									<option value="금">금요일</option>
									<option value="토">토요일</option>
									<option value="일">일요일</option>
								</select>
								<button type="button" id="save" style="border-radius: 10px;" class="btn btn-outline-success">저장</button>
							</div>  				
						</div>
						<div name="storeBold" class="mt-5" style="width: 700px; padding:30px; background-color: white; display: flex; justify-content: center; flex-direction: column; border-radius: 25px;">
							<div>
								<div style="display: flex; justify-content: space-around">
									<h4 style="text-align: left;">영업시간(월~일)</h4>
									<div></div>
								</div>
								<div class="input-group mb-3" style="display: flex; justify-content: center;">
							  		<span class="input-group-text" id="span_1_1">open</span>
							  		<input id="timepicker_1_1" name="timepicker" type="text" class="form-control is-invalid" aria-describedby="span_1_1">
								</div>
								<div class="input-group mb-3" style="display: flex; justify-content: center;">
							  		<span class="input-group-text" id="span_1_2">close</span>
							  		<input id="timepicker_1_2" name="timepicker" type="text" class="form-control is-invalid" aria-describedby="span_1_2">
								</div>
								<div>
									<button type="button" name="saveTimepicker" class="btn btn-outline-success">저장하기</button>
								</div>
							</div>		
						</div>
						<div name="storeBold" class="mt-5" style="width: 700px; padding:30px; background-color: white; display: flex; justify-content: center; flex-direction: column; border-radius: 25px;">	
							<h3>휴게 시간이 있나요?</h3>
							<div>
								<button name="isRestTime" class="btn btn-outline-warning" type="button">휴게 시간이 있어요</button>
								<button name="isRestTime" class="btn btn-outline-warning" type="button">휴게 시간이 없어요</button>
							</div>
						</div>
						<div name="storeBold" id="restTime" class="mt-5" style="width: 700px; padding:30px; background-color: white; display: flex; justify-content: center; flex-direction: column; border-radius: 25px;">		 
							<div style="display: flex; justify-content: space-around">
								<h4 style="text-align: left;">휴게시간(월~일)</h4>
								<div></div>
							</div>
							<div class="input-group mb-3" style="display: flex; justify-content: center;">
							  	<span class="input-group-text" id="span_2_1">start</span>
							  	<input id="timepicker_2_1" name="timepicker" type="text" class="form-control is-invalid" aria-describedby="span_2_1">
							</div>
							<div class="input-group mb-3" style="display: flex; justify-content: center;">
							  	<span class="input-group-text" id="span_2_2">end</span>
							  	<input id="timepicker_2_2" name="timepicker" type="text" class="form-control is-invalid" aria-describedby="span_2_2">
							</div>
							<div>
								<button type="button" name="saveTimepicker" class="btn btn-outline-success">저장하기</button>
							</div>
						</div>
						<div name="storeBold" id="resIstrueTimeCheck" class="mt-5" style="width: 700px; padding:30px; background-color: white; display: flex; justify-content: center; flex-direction: column; border-radius: 25px;">
							<div>
								<div style="display: flex; justify-content: space-around">
									<h4 style="text-align: left;">예약 가능시간(월~일)</h4>
									<div></div>
								</div>
								<div class="input-group mb-3" style="display: flex; justify-content: center;">
							  		<span class="input-group-text" id="span_3_1">first</span>
							  		<input id="timepicker_3_1" name="timepicker" type="text" class="form-control is-invalid" aria-describedby="span_3_1">
								</div>
								<div class="input-group mb-3" style="display: flex; justify-content: center;">
							  		<span class="input-group-text" id="span_3_2">last</span>
							  		<input id="timepicker_3_2" name="timepicker" type="text" class="form-control is-invalid" aria-describedby="span_3_2">
								</div>
								<div>
									<button type="button" name="saveTimepicker" class="btn btn-outline-success">저장하기</button>
								</div>
							</div>		
						</div>
					</div>
				</div>
				<div class="storePaging">
				<div style="display: flex; justify-content: center;">
					<div style="width: 700px; padding:30px; background-color: white; display: flex; align-items: center; flex-direction: column;
					 border-radius: 25px; border: ipx solid salmon !impotant;">
						<h3>사진 등록 해주세요 :)</h3>
					</div>
				</div>
				<div style="display: flex; flex-direction: column; align-items: center" class="mt-3">			
					<div style="display: flex;">
						<div name="storeBold" style="background-color: white; width: 500px; border-radius: 25px; display: flex;flex-direction: column">
							<h1 class="p-3">썸네일 사진 미리보기</h1>
							<div>
								<h5 style="color:salmon;">※ 최대 1개 가능 ※</h5>
							</div>
							<div>
								<input class="btn btn-outline-success" type="button" id="fileButton_1" value="썸네일 사진확인" readonly>
							</div>
							<div class="p-2" name="photoParent" style="display: flex; align-items: center; flex-direction: column;">
								<div class="p-2" id="fileEdge_1" style="display: flex; align-items: center; justify-content: center; width: 300px; height: 300px;">
								</div>
							</div>
							<div>
								<button type="button" name="photoCheck" class="btn btn-success mb-4">저장하기</button>
							</div>
						</div>&nbsp;&nbsp;&nbsp;
						<div name="storeBold" style="background-color: white; width: 900px; border-radius: 25px; display: flex;flex-direction: column; border: 1px ">
							<h1 class="p-3">배너 사진 미리보기</h1>
							<div>
								<h5 style="color:salmon;">※ 최대 2개 가능 ※</h5>
							</div>
							<div style="display: flex; justify-content: space-around">
								<div>
									<input class="btn btn-outline-success" type="button" id="fileButton_2" value="배너 좌측 사진 오는곳" readonly>
								</div>
								<div>
									<input class="btn btn-outline-success" type="button" id="fileButton_3" value="배너 우측 사진 오는곳" readonly>
								</div>
							</div>
							<div name="photoParent" style="display: flex; justify-content: space-around;">
								<div class="p-2" id="fileEdge_2" style="display: flex; align-items: center; justify-content: center; width: 300px; height: 300px;">
								</div>
								<div class="p-2" id="fileEdge_3" style="display: flex; align-items: center; justify-content: center; width: 300px; height: 300px;">
								</div>
							</div>
							<div>
								<button type="button" name="photoCheck" class="btn btn-success mb-4">저장하기</button>
							</div>
						</div>
					</div>
				</div>	
				</div>
				<div class="demo mt-3">
				    <nav class="pagination-outer"  aria-label="Page navigation">
				        <ul class="pagination" id="pagination"></ul>
				    </nav>
				</div>  
				<div class="mt-3">
					<button type="button" class="btn btn-success btn-lg" id="totalInsert">등록하기</button>
			    </div>
			</div>
    	</main>
    	<div id="loading" style="display: none; ">
			<div id="loading_bar">
				<img src="${ pageContext.request.contextPath }/resources/img/Spin-loading.gif"/>
				<p style="font-size: x-large; font-weight: bold">진행 중 입니다 ...</p>
			</div>
		</div>
    	<script src="${ pageContext.request.contextPath }/resources/js/smain.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 



