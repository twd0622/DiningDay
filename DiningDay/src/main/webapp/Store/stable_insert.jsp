<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀</title>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
		<main style="display: flex;  align-items: center; text-align: center; padding:20px;">
			<div class="mainContainer" style="border: 1px solid black; width: 100%; height: 850px; background:white; display: flex; align-items: center;text-align: center; justify-content: center">
				<div class="p-5" style="display: flex;  align-items: center; text-align: center; width: 700px; flex-direction: column; background-color: #FFF2A6;">
					<h2 class="mb-5">★ 좌석 추가 ★</h2>
					<div class="input-group mb-3">
						<span class="input-group-text" id="tagName_1">좌석 명</span>
						<input type="text" class="form-control" placeholder="테이블 명" aria-describedby="tagName_1">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="tagName_2">이용 시간</span>
						<input class="form-control" type="text" name="TABLE_USETIME" placeholder="이용 시간" aria-describedby="tagName_2">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="tagName_3">최소 이용 인원</span>
						<input class="form-control" type="text" name="TABLE_MIN" placeholder="최소 이용 인원" aria-describedby="tagName_3">
						<span class="input-group-text" id="tagName_4">최대 이용 인원</span>
						<input class="form-control" type="text" name="TABLE_MAX" placeholder="최대 이용 인원" aria-describedby="tagName_4">
					</div>	
					<div class="input-group mb-3">
						<span class="input-group-text" id="tagName_5">좌석 설명</span>
						<input class="form-control" type="text" name="TABLE_CONTENT" placeholder="좌석 설명" aria-describedby="tagName_5">
					</div>
					<div class="input-group mb-3">
						<input type="file" class="form-control" name="TABLE_PHOTO">
					</div>
					<div>
						<button type="button" class="btn btn-outline-success btn-lg mt-4">저장</button>
					</div>
				</div>			
			</div>
    	</main>	
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 
  
