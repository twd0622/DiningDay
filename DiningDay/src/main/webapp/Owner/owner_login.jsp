<!-- 12/15/18:10_강현아 + 점주용 로그인 개설 -->
<!-- 12/26/14:10_강현아 + 페이지 연결 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<title>점주용 로그인</title>
</head>
<%@ include file="/Template/header.jsp"%> 
<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 68.5px; padding:100px 0 200px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin" style="width:500px;" >
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">점주 계정 로그인</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form action="owner_loginPro.ow" style="text-align: center;"  method="post">
				<!-- 사업자용 로그인 버튼 -->
<!-- 				<button class="w-100 mb-2 btn btn-primary rounded-3" type="submit" style="font-size: 19px;"> -->
<!-- 					점주용 로그인 -->
<!-- 				</button> -->

				<div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>아이디</label> </div>
				    	<input type="text" name="OWN_ID" class="form-control"/>
				  </div>
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>비밀번호</label> </div>
				    	<input type="password" name="OWN_PW" class="form-control" />
				  </div>
				<button type="submit" class="btn btn-primary btn-block mb-4" onclick="location.href='main.cu'"
						style="color: #111111; background-color: #FFF2A6; border-color: #ffffff;">로그인</button>
				  
				
				<small class="text-body-secondary">점주용 계정이 기억나지 않으시나요?</small>
				<div class="row mb-4">
				  <div class="col">
				    <!-- Simple link -->
				    <a href="search_id.ow">아이디 찾기</a>
				  </div>
				
				  <div class="col">
				    <!-- Simple link -->
				    <a href="search_pw.ow">비밀번호 찾기</a>
				  </div>
				</div>
				  
				<hr>
				<div class="text-center">
				    <p>점주용 계정이 없으신가요? <a href="owner_join.ow">회원가입</a></p>
				</div> 
				</form>
			</div>
		</div>
	</div>
</div>
</main>
<%@ include file="/Template/footer.jsp"%> 
</html>