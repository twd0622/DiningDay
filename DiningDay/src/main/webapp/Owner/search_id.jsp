<!-- 12/15/18:10_강현아 + 아이디 찾기 개설 -->
<!-- 12/20/18:10_강현아 + 인증번호 관련 alert 추가 -->
<!-- 01/08/20:20_강현아 + 인증메일 연동 + 아이디 찾기 결과 모달창 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주용 계정 아이디 찾기</title>
<link href="Owner/css/search.css" rel="stylesheet">
</head>
<%@ include file="/Template/header.jsp"%> 
<main style="display: flex; justify-content: center; align-items: center; margin-top: 68.5px; padding:100px 0 150px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" id="modalSignin">
	<div class="modal-dialog">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">아이디 찾기</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form action="search_idPro.ow" method="post" name="searchId">
					<c:set var="searchInfo" value="${requestScope.authCheck}"/>
					<div class="form-outline mb-4">
					  	<div><label>사업자번호</label></div>
					    <input type="text" name="OWN_CRN" class="form-control" value="${authCheck.OWN_CRN}">
					</div>
					<div class="form-outline mb-4">
				  		<div><label>이메일</label></div>
				    	<input type="email" name="OWN_EMAIL" class="form-control" value="${authCheck.OWN_EMAIL}">
					</div>
					<button type="submit" class="btn btn-primary btn-block mb-4" id="sendBtn">인증번호 받기</button>
					<div class="form-outline mb-4">
						<div> <label>인증번호</label></div>
						<input type="text" name="idCode" id="idCode" class="form-control">
					</div>
					<button type="button" class="btn btn-primary btn-block mb-4" id="authBtn">다음</button>
         
		        <!-- 아이디 찾기 모달창 -->
					<div id="authModal" class="modal">
				  		<div class="modal-content" id="auth-modal-content">
							<div class="modal-header" id="auth-modal-header">
					     		<h2 class="modal-title" id="auth-modal-body">아이디 찾기 - 결과</h2><br>
					     		<button type="button" class="auth-close" data-dismiss="modal" aria-label="Close">&times;</button>
							</div>
							<div class="modal-body" id="auth-modal-body">
								<h5>사업자번호: ${authCheck.OWN_CRN} 님의 아이디</h5>
								<h6><b>[${authCheck.OWN_ID}]</b> 입니다.</h6>
							</div>
							<div class="modal-footer" id="auth-modal-footer">
								<button type="button" class="btn btn-outline-warning" data-dismiss="modal" id="authOk">확인</button>     
							</div>
				  		</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>	
</div>
<script>
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
		<%
			session.removeAttribute("AuthNumber");
			session.removeAttribute("authCheck");
		%>
	}
}

authSpan.onclick = function() {
	authModal.style.display = "none";
}
authOk.onclick = function() {
	authModal.style.display = "none";
	location.href="owner_login.ow";
}
</script>
</main>
<%@ include file="/Template/footer.jsp"%> 

</html>