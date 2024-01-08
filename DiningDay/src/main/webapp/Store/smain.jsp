<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀</title>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/timepicki.css">
    <style>
    	.dropdown-item:hover{
  			background-color: yellow;
    	}
    </style>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
		<main style="display: flex;  align-items: center; text-align: center; padding:100px;">
			<div class="mainContainer" style="width: 100%; height: 2000px; background:#f0f0f3; 
			display: flex; flex-direction: column; justify-content: center; align-items: center;">
				<input type="hidden" name="STORE_NO" value="${ sessionScope.STORE_NO }">
				<div style="width: 900px; padding:30px; background-color: white; display: flex; align-items: center; flex-direction: column; border-radius: 25px;">
					<h3>휴무일이 있나요?</h3>
					<div>
						<button class="btn btn-outline-success" type="button">휴무일이 있어요</button>
						<button class="btn btn-outline-success" type="button">휴무일이 없어요</button>
					</div>	
					<div class="input-group mt-3"  style="width: 150px;">
						<input type="text" class="form-control" aria-label="Text input with segmented dropdown button">
					 	<button type="button" class="btn btn-outline-success dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
					    	<span class="visually-hidden">Toggle Dropdown</span>
					  	</button>
					  	<ul class="dropdown-menu">
					  		<li><a class="dropdown-item">월요일</a></li>
					  		<li><a class="dropdown-item">화요일</a></li>
					  		<li><a class="dropdown-item">수요일</a></li>
					  		<li><a class="dropdown-item">목요일</a></li>
					  		<li><a class="dropdown-item">금요일</a></li>
					  		<li><a class="dropdown-item">토요일</a></li>
					  		<li><a class="dropdown-item">일요일</a></li>
					  	</ul>
					</div>  				
				</div>
				<div class="mt-3" style="width: 900px; padding:30px; background-color: white; display: flex; justify-content: center; flex-direction: column; border-radius: 25px;">
					<div>
						<div style="display: flex; justify-content: space-around">
							<h4 style="text-align: left;">영업시간(월~일)</h4>
							<div></div>
						</div>
						<input id="timepicker_1_1" type="text" name="timepicker1"/>
					</div>		
				</div>
				<div class="mt-3" style="width: 900px; padding:30px; background-color: white; display: flex; justify-content: center; flex-direction: column; border-radius: 25px;">	
					<h3>휴게 시간이 있나요?</h3>
					<div>
						<button class="btn btn-outline-warning" type="button">휴게 시간이 있어요</button>
						<button class="btn btn-outline-warning" type="button">휴게 시간이 없어요</button>
					</div>
				</div>
				<div class="mt-3" style="width: 900px; padding:30px; background-color: white; display: flex; justify-content: center; flex-direction: column; border-radius: 25px;">		 
					<div style="display: flex; justify-content: space-around">
						<h4 style="text-align: left;">휴게시간(월~일)</h4>
						<div></div>
					</div>
					<div style="display: flex; justify-content: center; align-items: baseline;">
						<div class="input-group mb-3"  style="width: 100px;">
							<input type="text" class="form-control" aria-label="Text input with segmented dropdown button">
						 	<button type="button" class="btn btn-outline-warning dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
						    	<span class="visually-hidden">Toggle Dropdown</span>
						  	</button>
						  	<ul class="dropdown-menu">
							    <li><a class="dropdown-item">01시</a></li>
							    <li><a class="dropdown-item">02시</a></li>
							    <li><a class="dropdown-item">03시</a></li>
						    	<li><a class="dropdown-item">04시</a></li>
						    	<li><a class="dropdown-item">05시</a></li>
						    	<li><a class="dropdown-item">06시</a></li>
						    	<li><a class="dropdown-item">07시</a></li>
						    	<li><a class="dropdown-item">08시</a></li>
						    	<li><a class="dropdown-item">09시</a></li>
						    	<li><a class="dropdown-item">10시</a></li>
						    	<li><a class="dropdown-item">11시</a></li>
						    	<li><a class="dropdown-item">12시</a></li>
						    	<li><a class="dropdown-item">13시</a></li>
						    	<li><a class="dropdown-item">14시</a></li>
						    	<li><a class="dropdown-item">15시</a></li>
						    	<li><a class="dropdown-item">16시</a></li>
						    	<li><a class="dropdown-item">17시</a></li>
						    	<li><a class="dropdown-item">18시</a></li>
						    	<li><a class="dropdown-item">19시</a></li>
						    	<li><a class="dropdown-item">20시</a></li>
						    	<li><a class="dropdown-item">21시</a></li>
						    	<li><a class="dropdown-item">22시</a></li>
						    	<li><a class="dropdown-item">23시</a></li>
						    	<li><a class="dropdown-item">24시</a></li>
							</ul>
						</div>
						&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
						<div class="input-group mb-3"  style="width: 100px;">
						  	<input type="text" class="form-control" aria-label="Text input with segmented dropdown button">
						  	<button type="button" class="btn btn-outline-warning dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
						    	<span class="visually-hidden">Toggle Dropdown</span>
						  	</button>
						  	<ul class="dropdown-menu">
							    <li><a class="dropdown-item">00분</a></li>
							    <li><a class="dropdown-item">10분</a></li>
						    	<li><a class="dropdown-item">20분</a></li>
						    	<li><a class="dropdown-item">30분</a></li>
						    	<li><a class="dropdown-item">40분</a></li>
						    	<li><a class="dropdown-item">50분</a></li>
						    	<li><a class="dropdown-item">60분</a></li>
							</ul>
						</div>
					</div>
					<div style="display: flex; justify-content: center; align-items: baseline;">
						<div class="input-group mb-3" style="width: 100px;">
							<input type="text" class="form-control" aria-label="Text input with segmented dropdown button">
						  	<button type="button" class="btn btn-outline-warning dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
						    	<span class="visually-hidden">Toggle Dropdown</span>
						  	</button>
						  	<ul class="dropdown-menu">
							    <li><a class="dropdown-item">01시</a></li>
							    <li><a class="dropdown-item">02시</a></li>
							    <li><a class="dropdown-item">03시</a></li>
						    	<li><a class="dropdown-item">04시</a></li>
						    	<li><a class="dropdown-item">05시</a></li>
						    	<li><a class="dropdown-item">06시</a></li>
						    	<li><a class="dropdown-item">07시</a></li>
						    	<li><a class="dropdown-item">08시</a></li>
						    	<li><a class="dropdown-item">09시</a></li>
						    	<li><a class="dropdown-item">10시</a></li>
						    	<li><a class="dropdown-item">11시</a></li>
						    	<li><a class="dropdown-item">12시</a></li>
						    	<li><a class="dropdown-item">13시</a></li>
						    	<li><a class="dropdown-item">14시</a></li>
						    	<li><a class="dropdown-item">15시</a></li>
						    	<li><a class="dropdown-item">16시</a></li>
						    	<li><a class="dropdown-item">17시</a></li>
						    	<li><a class="dropdown-item">18시</a></li>
						    	<li><a class="dropdown-item">19시</a></li>
						    	<li><a class="dropdown-item">20시</a></li>
						    	<li><a class="dropdown-item">21시</a></li>
						    	<li><a class="dropdown-item">22시</a></li>
						    	<li><a class="dropdown-item">23시</a></li>
						    	<li><a class="dropdown-item">24시</a></li>
							</ul>
						</div>
						&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
						<div class="input-group mb-3"  style="width: 100px;">
							<input type="text" class="form-control" aria-label="Text input with segmented dropdown button">
						  	<button type="button" class="btn btn-outline-warning dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
						    	<span class="visually-hidden">Toggle Dropdown</span>
						 	</button>
						  	<ul class="dropdown-menu">
							    <li><a class="dropdown-item">00분</a></li>
							    <li><a class="dropdown-item">10분</a></li>
							    <li><a class="dropdown-item">10분</a></li>
						    	<li><a class="dropdown-item">20분</a></li>
						    	<li><a class="dropdown-item">30분</a></li>
						    	<li><a class="dropdown-item">40분</a></li>
						    	<li><a class="dropdown-item">50분</a></li>
						    	<li><a class="dropdown-item">60분</a></li>
							</ul>
						</div>
					</div>	
				</div>
				<div class="mt-3 mb-3" style="background-color: white; width: 900px; border-radius: 25px; display: flex;flex-direction: column">
				<h1 class="p-5">썸네일 사진 미리보기</h1>
					<form class="p-2" method="post" enctype="multipart/form-data" style="display: flex; align-items: center; flex-direction: column;">
						<input type="hidden" name="PHOTO_TYPE" value="S">
						<div class="input-group 1" style="width: 400px; margin: 0 auto;">
							<input type="file" class="form-control" id="inputFile_1" aria-describedby="fileButton_1"
							aria-label="썸네일 사진 미리보기" name="PHOTO_NAME">
							<button class="btn btn-outline-success" type="button" id="fileButton_1">등록하기</button>
						</div>
						<div class="image_container" id="img_1" style="width: 400px; height: 400px;">
						</div>
					</form>
				</div>
				<div class="mt-3 mb-3" style="background-color: white; width: 900px; border-radius: 25px; display: flex;flex-direction: column">
				<h1 class="p-5">배너 사진 미리보기</h1>
					<form class="p-2" method="post" enctype="multipart/form-data" style="display: flex; align-items: center; flex-direction: column;">
						<input type="hidden" name="PHOTO_TYPE" value="B">
						<div class="input-group 2" style="width: 400px; margin: 0 auto;">
							<input type="file" class="form-control" id="inputFile_2" aria-describedby="fileButton_2" 
							aria-label="배너 사진 미리보기" name="PHOTO_NAME">
							<button class="btn btn-outline-success" type="button" id="fileButton_2">등록하기</button>
						</div>
						<div class="image_container" id="img_2" style="width: 400px; height: 400px;">
						</div>
					</form>
				</div>	
			</div>
    	</main>
    	<script src="${ pageContext.request.contextPath }/resources/js/smain.js"></script>
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 



