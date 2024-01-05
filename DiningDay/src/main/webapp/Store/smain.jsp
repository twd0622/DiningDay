<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀</title>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
		<main style="display: flex;  align-items: center; text-align: center; padding:100px;">
			<div class="mainContainer" style="border: 1px solid black; width: 100%; height: 2000px; background:white; 
			display: flex; flex-direction: column; justify-content: center; align-items: center;">
				<input type="hidden" name="STORE_NO" value="${ sessionScope.STORE_NO }">
				<div class="row p-5" style="width: 800px;">
					<div style="width:500px;">
						<h1>XX식당 상세정보</h1>
						<div class="p-4 mt-5" style="border: solid 1px black; ">
							<h3 style="text-align: left;">영업시간 설정</h3>
							<h6 class="mt-3 mb-3" style="text-align: left;">※ 숫자만 입력해주세요 :)</h6>
							<div class="input-group mb-3" style="display: flex; flex-direction: row; justify-content: center;">
								<span class="input-group-text" style="background-color: #9CED92;">영업시간</span>
								<input type="text" class="form-control" name="STORE_TIME">
								<span class="input-group-text" style="background-color: #9CED92;">시</span>
								<input type="text" class="form-control" name="STORE_TIME">
								<span class="input-group-text" style="background-color: #9CED92;">분</span>
								<span class="input-group-text" style="background-color: #FFF2A6;">~</span>
								<input type="text" class="form-control" name="STORE_TIME">
								<span class="input-group-text" style="background-color: #9CED92;">시</span>
								<input type="text" class="form-control" name="STORE_TIME">
								<span class="input-group-text" style="background-color: #9CED92;">분</span>
							</div>
						</div>
					</div>
					<h3 class="mt-5">가게 위치 설정</h3>
					<input class="form-control" type="search">
					<h3 class="mt-5">마감시간 설정</h3>
					<div class="input-group mb-3">
						<span class="input-group-text" id="tagName_1">마감준비 시간</span>
						<input type="text" class="form-control" name="STORE_LO" placeholder="마지막 예약 받을 시간 xx시" aria-describedby="tagName_1">
					</div>
					<h3 class="mt-5">가게 설명</h3>
					<textarea rows="" cols=""></textarea>	
				</div>
			
			
				<h1 class="mt-5">썸네일 사진 미리보기</h1>
				<form class="p-2" method="post" enctype="multipart/form-data">
					<input type="hidden" name="PHOTO_TYPE" value="S">
					<div class="input-group 1" style="width: 400px; margin: 0 auto;">
						<input type="file" class="form-control" id="inputFile_1" aria-describedby="fileButton_1"
						aria-label="썸네일 사진 미리보기" name="PHOTO_NAME">
						<button class="btn btn-outline-success" type="button" id="fileButton_1">추가하기</button>
					</div>
					<div class="image_container" id="img_1">
					</div>
				</form>
				<h1 class="p-5 mt-5">배너 사진 미리보기</h1>
				<form class="p-2" method="post" enctype="multipart/form-data">
					<input type="hidden" name="PHOTO_TYPE" value="B">
					<div class="input-group 2" style="width: 400px; margin: 0 auto;">
						<input type="file" class="form-control" id="inputFile_2" aria-describedby="fileButton_2" 
						aria-label="배너 사진 미리보기" name="PHOTO_NAME">
						<button class="btn btn-outline-success" type="button" id="fileButton_2">추가하기</button>
					</div>
					<div class="image_container" id="img_2">
					</div>
				</form>	
			</div>
    	</main>
    	<script src="${ pageContext.request.contextPath }/resources/js/photo_control.js"></script>
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 



