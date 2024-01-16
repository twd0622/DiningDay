$(function(){
	// 아이디 찾기 모달
	var authModal = document.getElementById("authModal");
	var authBtn = document.getElementById("authBtn");
	var authSpan = document.getElementsByClassName("auth-close")[0];
	var authOk = document.getElementById("authOk");
	var cancelBtn = document.getElementById("cancelBtn");
	
	let inputs = document.searchForm;
	
	
	authBtn.onclick = function() {
		if(!inputs.authCode.value) {
			alert("인증번호를 입력해 주십시오.");
		} else if(AuthNumber != inputs.authCode.value){
			alert("입력한 인증번호가 틀렸습니다. 다시 확인해 주십시오.");
		} else {
			authModal.style.display = "block";
			session.removeAttribute("AuthNumber");
			session.removeAttribute("authCheck");
		}
	}
	
	authSpan.onclick = function() {
		authModal.style.display = "none";
	}
	authOk.onclick = function() {
		authModal.style.display = "none";
		location.href="owner_login.ow";
	}
	cancelBtn.onclick = function() {
		authModal.style.display = "none";
	}
})