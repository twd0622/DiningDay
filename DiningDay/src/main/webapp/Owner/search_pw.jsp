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
<link href="Owner/css/search.css" rel="stylesheet">
</head>
<%@ include file="/Template/header.jsp"%> 
<main style="display: flex; justify-content: center; align-items: center; margin-top: 68.5px; padding:100px 0 250px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" id="modalSignin">
	<div class="modal-dialog">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">비밀번호 찾기</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form action="search_pwPro.ow" method="post" name="searchForm">
					<c:set var="searchInfo" value="${requestScope.authPwCheck}"/> 
					<div class="form-outline mb-4">
						<div><label>사업자번호</label></div>
				    	<input type="text" name="OWN_CRN" class="form-control" value="${authPwCheck.OWN_CRN}">
		  		  	</div>
		  		  	<div class="form-outline mb-4">
		  				<div><label>아이디</label></div>
		    			<input type="text" name="OWN_ID" class="form-control" value="${authPwCheck.OWN_ID}">
		  		  	</div>	  	
				  	<div class="form-outline mb-4">
				  		<div><label>이메일</label></div>
				    	<input type="email" name="OWN_EMAIL" class="form-control" value="${authPwCheck.OWN_EMAIL}">
				  	</div>
				 	<button type="submit" class="btn btn-primary btn-block mb-4" id="sendBtn">인증번호 받기</button>
				  	<div class="form-outline mb-4">
				  		<div><label>인증번호</label></div>
				    	<input type="text" name="authCode" class="form-control">
				  	</div>
			 	 	<button type="button" class="btn btn-primary btn-block mb-4" id="authBtn">다음</button>
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
									<div><label>새 비밀번호</label></div>
							    	<input type="password" name="OWN_PW" id="pw" onchange="check_pw()"
							  		       class="form-control" placeholder="영문 대소문자, 숫자, 기타문자 포함 6~14자">
						        </div>
								<div class="form-outline mb-4">
								    <div> <label>새 비밀번호 확인</label> </div>
								    <input type="password" name="OWN_PWCHECK" id="pw2" onchange="check_pw()"
								    	   class="form-control" placeholder="비밀번호 확인">&nbsp;
								    <span id="check"></span>
								</div>
							</div>
						    <div class="modal-footer" id="auth-modal-footer">
								<button type="submit" class="btn btn-outline-warning" id="authOk" disabled>변경</button>   
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
	var AuthNumber = '<%=(String)session.getAttribute("AuthNumber")%>';
</script>
<script src="Owner/js/search.js"></script>
<script src="Owner/js/validation.js"></script>
</main>
<%@ include file="/Template/footer.jsp"%> 
</html>