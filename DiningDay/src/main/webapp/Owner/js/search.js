// 아이디 찾기 모달
var authModal = document.getElementById("authModal");
var authBtn = document.getElementById("authBtn");
var authSpan = document.getElementsByClassName("auth-close")[0];
var authOk = document.getElementById("authOk");
var AuthNumber = '<%=(String)session.getAttribute("AuthNumber")%>';

let inputs = document.searchId;

authBtn.onclick = function() {
	if(!inputs.idCode.value) {        // 입력하지 않았을 때
		alert("인증번호를 입력하세요.");
		authmodal.style.display = "none";
	} else if(AuthNumber != inputs.idCode.value){   // 값이 틀렸을 때 
		alert("입력한 인증번호가 틀렸습니다. 다시 확인해 주십시오.");
		authmodal.style.display = "none";
	} else {
		authModal.style.display = "block";
//		<%
			session.removeAttribute("AuthNumber");
			session.removeAttribute("authCheck");
//		%>
	}
}

authSpan.onclick = function() {
	authModal.style.display = "none";
}
authOk.onclick = function() {
	authModal.style.display = "none";
	location.href="owner_login.ow";
}