<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
		<main style="display: flex;  align-items: center; text-align: center; padding:20px;">
			<div class="mainContainer" style=" width: 100%; background:#f0f0f3; display: flex; align-items: center;text-align: center; justify-content: center; flex-direction: column;">
				<div class="p-5 rounded-4 shadow" style="margin-top:10%; display: flex;  align-items: center; text-align: center; width: 800px; flex-direction: row-reverse; background-color: white;">
					<form id="SEAT_DATA" enctype="multipart/form-data">
						<div style="display: flex; flex-direction: column;">
							<h3 class="mb-5">좌석 등록</h3>
							<div class="input-group mb-3">
								<input type="hidden" name="SEAT_OC" value="1">
								<span class="input-group-text" id="tagName_1">좌석 명</span>
								<input type="text" name="SEAT_NAME" id="inSEAT_1" class="form-control is-invalid" placeholder="좌석 이름" aria-describedby="tagName_1">
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text" id="tagName_2">최소 인원</span>
								<input class="form-control is-invalid" id="inSEAT_2" type="text" name="SEAT_MIN" placeholder="숫자만 입력가능" aria-describedby="tagName_2"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text" id="tagName_3">최대 인원</span>
								<input class="form-control is-invalid" id="inSEAT_3" type="text" name="SEAT_MAX" placeholder="숫자만 입력가능" aria-describedby="tagName_3"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							</div>	
							<div class="input-group mb-3">
								<span class="input-group-text" id="tagName_4">좌석 설명</span>
								<input class="form-control is-invalid" type="text" id="inSEAT_4" name="SEAT_CONTENT" placeholder="좌석 설명" aria-describedby="tagName_4">
							</div>
							<div class="input-group mb-3">
								<input type="file" id="photo_1" class="form-control" name="PHOTO_NAME">
							</div>
						</div>
					</form>&nbsp;&nbsp;&nbsp;
					<div>
						<div id="img_1" style="width: 300px; height: 300px; border: 1px solid black;"></div>
					</div>
				</div>
				<div>
					<button type="button" id="insertBtn" class="btn btn-outline-success btn-lg mt-4 rounded-4 shadow" disabled>등록</button>
				</div>			
			</div>
    	</main>	
    	<script src="${ pageContext.request.contextPath }/resources/js/stable_insert.js"></script>
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 
  
