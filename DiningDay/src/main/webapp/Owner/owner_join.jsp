<!-- 12/15/18:10_강현아 + 점주용 회원가입 개설 -->
<!-- 12/26/14:10_강현아 + 페이지 연결 -->
<!-- 01/08/20:20_강현아 + 아이디 & 비밀번호 유효성 검사 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주 회원가입</title>
</head>
<style>
#signIn {
	width:500px;
}

#id {
	width: 70%;
}

#trueCheck {
	width: 30%;
	color: #111111;
 	background-color: #FFF2A6;
}
#own_success {
 	color: #111111;
 	background-color: #FFF2A6;
 	border-color: #ffffff;
}
 
#own_fail {
	color: #111111; 
	background-color: #d6d6d6;
}
</style>
<%@ include file="/Template/header.jsp"%> 
<main style="display: flex; justify-content: center; align-items: center; margin-top: 68.5px; padding:100px 0 100px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" id="signIn">
	<div class="modal-dialog">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-4 fs-2">점주 계정 회원가입</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form action="owner_joinPro.ow" method="get" name="owner_join">
		  			<div class="form-outline mb-4">
			  			<div><label>아이디</label></div>
			  			<div class="container">
			  				<div class="row">
				    			<input type="text" name="OWN_ID" class="form-control col-md-8" id="id"
									   onchange="check_id()" placeholder="영어 소문자, 숫자 포함 6~10자"/>
				  				<input class="form-control col-md-3" type="button" value="중복체크"
				  					   id="trueCheck"/>
							</div>
						</div>
						<span id="checkId"></span>

		  			</div>
	      			<div class="form-outline mb-4">
		    			<div><label>비밀번호</label></div>
		    			<input type="password" name="OWN_PW" id="pw" onchange="check_pw()"
	  		      			   class="form-control" placeholder="영문 대소문자, 숫자, 기타문자 포함 6~14자">
         			</div>
		  			<div class="form-outline mb-4">
		    			<div><label>비밀번호 확인</label></div>
		    			<input type="password" name="OWN_PWCHECK" id="pw2" onchange="check_pw()"
		    	      		   class="form-control" placeholder="비밀번호를 재입력하시오.">
		    			<span id="check"></span>
		  			</div>
		 			<div class="form-outline mb-4">
		  				<div><label>이름</label></div>
		    			<input type="email" name="OWN_NAME" class="form-control" />
		  			</div>
				  	<div class="form-outline mb-4">
		  				<div><label>전화번호</label></div>
		    			<input type="tel" name="OWN_TEL" class="form-control" />
		  			</div>	
		 			<div class="form-outline mb-4">
					  	<div><label>이메일</label></div>
				    	<input type="email" name="OWN_EMAIL" class="form-control" />
		 			</div>	  
		 			<div class="form-outline mb-4">
					  	<div><label>사업자번호</label></div>
					    <input type="text" name="OWN_CRN" class="form-control" />
		  			</div><br>
		  
	    			<ul class="nav nav-pills nav-justified mb-3">
						<li class="nav-item">
					    	<a class="nav-link active" id="own_success" onclick="return submit()">가입</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="own_fail" href="owner_login.ow">취소</a>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="Owner/js/validation.js"></script>
</main>
<%@ include file="/Template/footer.jsp"%> 
</html>