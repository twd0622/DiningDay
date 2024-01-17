<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>점주 계정 정보 수정</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
<style>
.modal-content {
	background-color: white !important;
}

.nav {
	flex-direction: row !important;
}
#edit_success {
 	color: #111111;
 	background-color: #FFF2A6;
 	border-color: #ffffff;
}
 
#edit_fail {
	color: #111111; 
	background-color: #d6d6d6;
}
</style>
<%@ include file="/Template/store_sidebar_open.jsp"%>
<main style="display: flex;  align-items: center; padding:20px; height: 850px; flex-direction: column;">
<c:set var="getOwner" value="${requestScope.getOwner}"/>
<div class="modal-dialog mt-3">
	<div class="modal-content rounded-4 shadow">
		<div class="modal-header p-5 pb-4 border-bottom-0">
			<h1 class="fw-bold mb-4 fs-2">점주 계정 정보 수정</h1>
		</div>
		<div class="modal-body p-5 pt-0">
			<div class="form-outline mb-4">
				<div><label>아이디</label></div>
				<input type="text" name="OWN_ID" class="form-control col-md-8" id="id" value="${getOwner.OWN_ID}" readonly/>
			</div>
			<div class="form-outline mb-4">
				<div><label>이름</label></div>
				<input type="email" id="OWN_NAME" class="form-control" value="${getOwner.OWN_NAME}"/>
			</div>
			<div class="form-outline mb-4">
				<div><label>전화번호</label></div>
				<input type="tel" id="OWN_TEL" class="form-control" value="${getOwner.OWN_TEL}"/>
			</div>	
			<div class="form-outline mb-4">
			 	<div><label>이메일</label></div>
			  	<input type="email" id="OWN_EMAIL" class="form-control" value="${getOwner.OWN_EMAIL}"/>
			</div>	  
			<div class="form-outline mb-4">
			 	<div><label>사업자번호</label></div>
			   <input type="text" id="OWN_CRN" class="form-control" value="${getOwner.OWN_CRN}" readonly/>
			</div>
			
			<div class="form-outline mb-4">
					<input type="text" id="OWN_PW" class="form-control" value="${getOwner.OWN_PW}" hidden="">
			</div>
			<div class="form-outline mb-4">
				<div><label>비밀번호 확인</label></div>
			  	<input type="password" id="OWN_PWCHECK" class="form-control" placeholder="계정 확인을 위해 입력해주세요."/>
			</div>
			<ul class="nav nav-pills nav-justified mb-3">
				<li class="nav-item">
					<a class="nav-link active" id="edit_success">저장</a>
				</li>			
				<li class="nav-item">
					<a class="nav-link" id="edit_fail">취소</a>
				</li>
			</ul>
		</div>
	</div>
</div>
</main>	
<%@ include file="/Template/store_sidevar_close.jsp"%> 	
<script type="text/javascript">
$(function(){
	$('#edit_success').on('click', function(){
	 	if ($("#OWN_PW").val() == $("#OWN_PWCHECK").val()) {
		 	$.ajax({
		 		type: "post"
		 		, url: "info_updatePro.st"
		 		, dataType: "json"
		 		, data: {OWN_NAME: $("#OWN_NAME").val()
	 			     	, OWN_TEL: $("#OWN_TEL").val()
	 					, OWN_EMAIL: $("#OWN_EMAIL").val()
		 		}
		 		, success: function(data) {
		 			alert("정보가 수정되었습니다.");
		 			location.reload();
		 		}
		 	})
		} else {
			alert("비밀번호를 다시 입력해주십시오.");
		}
	})
	
	$('#edit_fail').on('click', function(){
		location.reload();
	})
})
</script>
</html> 