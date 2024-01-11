<!-- 12/15/18:10_강현아 + 비밀번호 찾기 개설 -->
<!-- 12/20/18:10_강현아 + 인증번호 관련 alert 추가 -->
<!-- 12/26/14:10_강현아 + 페이지 연결 -->
<!-- 01/08/20:20_강현아 + 인증메일 연동 + 비밀번호 변경 모달창 + 비밀번호 유효성 검사 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주용 계정 비밀번호 찾기</title>
<style>
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0,0.4);
}

/* 비밀번호 인증알림 모달 */
#auth-modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 0px 20px 30px 20px;
  border: 1px solid #888;
  width: 30%;
}

#auth-modal-body {
  padding: 20px 10px 20px 0px;
}

#auth-modal-footer {
  padding-top: 20px;
  align-content: right;
}

.auth-close {
  color: orange;
  float: right;
  font-size: 50px;
  font-weight: bold;
  border-color: #ffffff;
  background-color: #ffffff;
  border-style: none;
}

.auth-close:hover,
.auth-close:focus {
  color: gray;
  text-decoration: none;
  cursor: pointer;
}

.auth_num {
  border-left: 10px solid #FFF2A6;
  color: orange;
}
</style>
</head>
<%@ include file="/Template/header.jsp"%> 
<main style="display: flex; justify-content: center; align-items: center; margin-top: 68.5px; padding:100px 0 250px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin" style="width:500px;" >
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">비밀번호 찾기</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form action="search_pwPro.ow" method="post" name="searchPw">
				  <c:set var="storeInfo" value="${requestScope.authPwCheck}"/> 
				  <div class="form-outline mb-4">
				  	<div> <label>사업자번호</label> </div>
				    	<input type="text" name="OWN_CRN" class="form-control" value="${authPwCheck.OWN_CRN}"/>
		  		  <div class="form-outline mb-4">
		  			<div> <label>아이디</label> </div>
		    			<input type="text" name="OWN_ID" class="form-control" value="${authPwCheck.OWN_ID}"/>
		  		  </div>	  	
				  </div>
				  <div class="form-outline mb-4">
				  	<div> <label>이메일</label> </div>
				    	<input type="email" name="OWN_EMAIL" class="form-control" value="${authPwCheck.OWN_EMAIL}"/>
				  </div>
				  <button type="submit" class="btn btn-primary btn-block mb-4"
				  		  style="color: #111111; background-color: #FFF2A6; border-color: #ffffff;">인증번호 받기</button>
				  
				  <div class="form-outline mb-4">
				  	<div> <label>인증번호</label> </div>
				    	<input type="text" name="pwCode" class="form-control" />
				  </div>
			 	  <button type="button" class="btn btn-primary btn-block mb-4" id="authBtn"
			  		      style="color: #111111; background-color: #FFF2A6; border-color: #ffffff;"> 다음</button>
				</form>
				
				<!-- 비밀번호 변경 모달창 -->
				<form action="new_pw.ow" method="post">
				<div id="authModal" class="modal">
				  <div class="modal-content" id="auth-modal-content">
				     <div class="modal-header" id="auth-modal-header">
					     <h2 class="modal-title" id="auth-modal-body">비밀번호 찾기 - 비밀번호 변경</h2>
					     <button type="button" class="auth-close" data-dismiss="modal" aria-label="Close">&times;</button>
				     </div>
				     <div class="modal-body" id="auth-modal-body">
					     <h5>아이디: ${authPwCheck.OWN_ID}님의 비밀번호 변경</h5>&nbsp;
					     <div class="form-outline mb-4">
						     <div> <label>새 비밀번호</label> </div>
					    	 <input type="password" name="OWN_PW" id="pw" onchange="check_pw()"
					  		       class="form-control" placeholder="영문 대소문자, 숫자, 기타문자 포함 8~14자">
				         </div>
						 <div class="form-outline mb-4">
						     <div> <label>새 비밀번호 확인</label> </div>
						     <input type="password" name="OWN_PWCHECK" id="pw2" onchange="check_pw()"
						    	    class="form-control" placeholder="비밀번호 확인">&nbsp;
						    	    <span id="check"></span>
						 </div>
				     </div>
				     <div class="modal-footer" id="auth-modal-footer">
				       <button type="submit" class="btn btn-outline-warning" id="authOk">변경</button>   
		      		   <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>       
				     </div>
				  </div>
				</div>
				</form>
				

			</div>
		</div>
	</div>
</div>
<script>
// 비밀번호 찾기 모달
var authModal = document.getElementById("authModal");
var authBtn = document.getElementById("authBtn");
var authSpan = document.getElementsByClassName("auth-close")[0];
var authOk = document.getElementById("authOk");
var cancelBtn = document.getElementById("cancelBtn");
var AuthNumber = '<%=(String)session.getAttribute("AuthNumber")%>';

let inputs = document.searchPw;

authBtn.onclick = function() {
	if(!inputs.pwCode.value) {
		alert("인증번호를 입력하세요.");
		authmodal.style.display = "none";
	} else if(AuthNumber != inputs.pwCode.value){
		alert("입력한 인증번호가 틀렸습니다. 다시 확인해 주십시오.");
		authmodal.style.display = "none";
	} else {
		authModal.style.display = "block";
	}
}

authSpan.onclick = function() {
	authModal.style.display = "none";
}
authOk.onclick = function() {
	authModal.style.display = "none";
}
cancelBtn.onclick = function() {
	authModal.style.display = "none";
}

// 비밀번호 유효성 검사
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
</script>
</main>
<%@ include file="/Template/footer.jsp"%> 
</html>