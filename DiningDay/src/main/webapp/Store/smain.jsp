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
    </style>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
		<main style="display: flex;  align-items: center; text-align: center; padding:100px;">
			<div class="mainContainer" style="width: 100%; height: 3000px; background:#f0f0f3; 
			display: flex; flex-direction: column; justify-content: center; align-items: center;">
				<form method="post" enctype="multipart/form-data">
<!-- 				 style="display: none;" -->
					<input type="file" id="inputfile_1" name="PHOTO_NAME">
					<input type="file" id="inputfile_2" name="PHOTO_NAME">	
					<input type="text" name="STORE_CLOSE">
					<input type="text" name="STORE_NO" value="${ sessionScope.STORE_NO }">
					<input type="text" name="STORE_ST">
					<input type="text" name="STORE_ET">
					<input type="text" name="STORE_BTS">
					<input type="text" name="STORE_BTE">
					<input type="text" name="STORE_LO">
				</form>	
				<div style="display: flex;">
					<div name="storeBold" style="width: 700px; padding:30px; background-color: white; display: flex; border-radius: 25px; flex-direction: column; align-items: center;">
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
					<div>
						<div>					
							<div name="storeBold" style="width: 700px; padding:30px; background-color: white; display: flex; align-items: center; flex-direction: column; border-radius: 25px;">
								<h3>휴무일이 있나요?</h3>
								<div>
									<button class="btn btn-outline-success" type="button" name="is-rest">휴무일이 있어요</button>
									<button class="btn btn-outline-success" type="button" name="is-rest">휴무일이 없어요</button>
								</div>	
								<div class="input-group mt-3" id="weekdiv" style="width: 300px; display: flex; flex-direction: column">
									<select multiple class="select" id="weekdays" style="width:300px; height:150px !important;" multiple="multiple">
										<option value="1">월요일</option>
										<option value="2">화요일</option>
										<option value="3">수요일</option>
										<option value="4">목요일</option>
										<option value="5">금요일</option>
										<option value="6">토요일</option>
										<option value="7">일요일</option>
									</select>
									<button type="button" id="save" style="border-radius: 10px;" class="btn btn-outline-success">저장</button>
								</div>  				
							</div>
							<div name="storeBold" class="mt-4" style="width: 700px; padding:30px; background-color: white; display: flex; justify-content: center; flex-direction: column; border-radius: 25px;">
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
										<button type="button" id="saveStoreOpen" class="btn btn-outline-success">저장하기</button>
									</div>
								</div>		
							</div>
							<div name="storeBold" class="mt-4" style="width: 700px; padding:30px; background-color: white; display: flex; justify-content: center; flex-direction: column; border-radius: 25px;">	
								<h3>휴게 시간이 있나요?</h3>
								<div>
									<button name="isRestTime" class="btn btn-outline-warning" type="button">휴게 시간이 있어요</button>
									<button name="isRestTime" class="btn btn-outline-warning" type="button">휴게 시간이 없어요</button>
								</div>
							</div>
							<div name="storeBold" id="restTime" class="mt-4" style="width: 700px; padding:30px; background-color: white; display: flex; justify-content: center; flex-direction: column; border-radius: 25px;">		 
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
									<button type="button" id="saveRest" class="btn btn-outline-success">저장하기</button>
								</div>
							</div>
						</div>
						<div>
							<div name="storeBold" class="mt-4" style="width: 700px; padding:30px; background-color: white; display: flex; align-items: center; flex-direction: column; border-radius: 25px;">
								<h3>사진 등록 하시나요?</h3>
								<div>
									<button class="btn btn-outline-success" type="button" name="isphoto">사진 등록 : 네</button>
									<button class="btn btn-outline-success" type="button" name="isphoto">사진 등록 : 아니요</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="display: flex;" class="mt-3">			
					<div name="storeBold" style="background-color: white; width: 700px; border-radius: 25px; display: flex;flex-direction: column">
					<h1 class="p-5">썸네일 사진 미리보기</h1>
						<div class="p-2" style="display: flex; align-items: center; flex-direction: column;">
							<div class="input-group 1" style="width: 400px; margin: 0 auto;">
								<input type="file" class="form-control" id="hiddenFile_1" aria-describedby="fileButton_1"
								aria-label="썸네일 사진 미리보기" name="hiddenfile">
								<button class="btn btn-outline-success" type="button" id="fileButton_1">등록하기</button>
							</div>
							<div class="image_container" id="img_1" style="width: 400px; height: 400px;">
							</div>
						</div>
					</div>&nbsp;&nbsp;&nbsp;
					<div name="storeBold" style="background-color: white; width: 700px; border-radius: 25px; display: flex;flex-direction: column; border: 1px ">
						<h1 class="p-5">배너 사진 미리보기</h1>
						<div class="p-2" style="display: flex; align-items: center; flex-direction: column;">
							<div class="input-group 2" style="width: 400px; margin: 0 auto;">
								<input type="file" class="form-control" id="hiddenFile_2" aria-describedby="fileButton_2" 
								aria-label="배너 사진 미리보기" name="hiddenfile">
								<button class="btn btn-outline-success" type="button" id="fileButton_2">등록하기</button>
							</div>
							<div class="image_container" id="img_2" style="width: 400px; height: 400px;">
							</div>
						</div>
					</div>
				</div>	
			</div>
    	</main>
    	<script src="${ pageContext.request.contextPath }/resources/js/smain.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 



