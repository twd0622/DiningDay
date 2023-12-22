<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀</title>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
	
    	<!-- main은 속성 값은 왠만하면 건들지x -->
		<main style="display: flex;  align-items: center; text-align: center; padding:20px;">
			<div class="mainContainer" style="border: 1px solid black; width: 100%; height: 2000px; background:white; ">
				<h1 class="p-5 mt-5">썸네일 사진 미리보기</h1>
				<form class="p-5" method="post" enctype="multipart/form-data">
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
				<form class="p-5" method="post" enctype="multipart/form-data">
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
    	<script src="resour/js/photo_control.js"></script>
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 



