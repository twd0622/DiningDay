<!-- 12/15/18:10_강현아 + 비밀번호 변경 개설 -->
<!-- 12/19/17:50_강현아 + 비밀번호 변경 내용 수정 -->
<!-- 12/26/14:10_강현아 + 페이지 연결 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주용 계정 비밀번호 변경</title>
</head>
<%@ include file="/Template/header.jsp"%> 
<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 68.5px; padding:100px 0 250px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin" style="width:500px;" >
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">비밀번호 변경</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form class="" style="text-align: center;">
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>새 비밀번호</label> </div>
				    	<input type="text" id="OWN_ID" class="form-control" />
				  </div>
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>새 비밀번호 확인</label> </div>
				    	<input type="password" id="OWN_PWCHECK" class="form-control" />
				  </div>
				  <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
				  <li class="nav-item" role="presentation">
				    <a class="nav-link active" id="own_success" data-mdb-toggle="pill" href="owner_login.jsp" role="tab"
				      aria-controls="register" aria-selected="true">변경</a>
				  </li>			
				  <li class="nav-item" role="presentation">
				    <a class="nav-link" id="own_fail" data-mdb-toggle="pill" href="#pills-register" role="tab"
				      aria-controls="none" aria-selected="false">취소</a>
				  </li>
				</ul>
				</form>
			</div>
		</div>
	</div>
</div>
</main>
<%@ include file="/Template/footer.jsp"%> 
</html>