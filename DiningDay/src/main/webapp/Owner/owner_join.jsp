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
<%@ include file="/Template/header.jsp"%> 
<main style="display: flex; justify-content: center; align-items: center; margin-top: 68.5px; padding:100px 0 100px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin" style="width:500px;" >
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">점주 계정 회원가입</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form action="owner_joinPro.ow" method="get" name="owner_join">
				  <div class="form-outline mb-4">
				  	<div> <label>아이디</label> </div>
				    	<input type="text" name="OWN_ID" class="form-control" id="id"
				    	       onchange="check_id()" placeholder="영문, 글자 포함 6~14자"/>
				  		<span id="checkId"></span>
				  </div>
			      <div class="form-outline mb-4">
				    	<div> <label>비밀번호</label> </div>
				    	<input type="password" name="OWN_PW" id="pw" onchange="check_pw()"
			  		       class="form-control" placeholder="영문 대소문자, 숫자, 기타문자 포함 8~14자">
		          </div>
				  <div class="form-outline mb-4">
				    	<div> <label>비밀번호 확인</label> </div>
				    	<input type="password" name="OWN_PWCHECK" id="pw2" onchange="check_pw()"
				    	       class="form-control" placeholder="비밀번호 확인">
				    	<span id="check"></span>
				  </div>
				  <div class="form-outline mb-4">
				  	<div> <label>이름</label> </div>
				    	<input type="email" name="OWN_NAME" class="form-control" />
				  </div>
  				  <div class="form-outline mb-4">
				  	<div> <label>전화번호</label> </div>
				    	<input type="tel" name="OWN_TEL" class="form-control" />
				  </div>	
				  <div class="form-outline mb-4">
				  	<div> <label>이메일</label> </div>
				    	<input type="email" name="OWN_EMAIL" class="form-control" />
				  </div>	  
				  <div class="form-outline mb-4">
				  	<div> <label>사업자번호</label> </div>
				    	<input type="text" name="OWN_CRN" class="form-control" />
				  </div>	
				  <br>
				  
				  
			    <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
				  <li class="nav-item" role="presentation">
				    <a class="nav-link active" id="own_success" data-mdb-toggle="pill" href="javascript:check();"  role="tab"
				      aria-controls="register" aria-selected="true"
				      style="color: #111111; background-color: #FFF2A6; border-color: #ffffff;">가입</a>
				  </li>
				  <li class="nav-item" role="presentation">
				    <a class="nav-link" id="own_fail" data-mdb-toggle="pill" href="owner_login.ow" role="tab"
				      aria-controls="none" aria-selected="false">취소</a>
				  </li>
				</ul>
				
				
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function check_id(){
    var id = document.getElementById('id').value;
    var checkId = document.getElementById('checkId');
    var idRegex = /^(?=.*[a-z]).{6,14}$/;
    
	if (idRegex.test(id)) {
		checkId.innerHTML = '';
	} else {
		checkId.innerHTML = '아이디는 (영어 소문자 포함) 6~14자여야 합니다.';
		checkId.style.color = 'red';
	}
}

function check_pw(){
    var pw = document.getElementById('pw').value;
    var pw2 = document.getElementById('pw2').value;
    var check = document.getElementById('check');
    var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,14}$/;


	if (pwRegex.test(pw)) {
		if (pw === pw2) {
			check.innerHTML = '비밀번호가 일치합니다.';
			check.style.color = 'green';
		}else{
			check.innerHTML = '비밀번호가 일치하지 않습니다.';
			check.style.color = 'red';
		}
	}else{
		check.innerHTML = '비밀번호는 (영문, 숫자, 특수 문자 포함) 8~14자여야 합니다.';
		check.style.color = 'red';
	}
}

function check() {
	document.owner_join.submit();
}
</script>
</main>
<%@ include file="/Template/footer.jsp"%> 
</html>

