<!-- 12/15/18:10_강현아 + 아이디 찾기 개설 -->
<!-- 12/20/18:10_강현아 + 인증번호 관련 alert 추가 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>점주용 계정 아이디 찾기</title>
</head>
<%@ include file="/Template/header.jsp"%> 
<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 68.5px; padding:100px 0 150px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin" style="width:500px;" >
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">아이디 찾기</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form action="searchPro.ow" style="text-align: center;" method="post" name="searchId">
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>사업자번호</label> </div>
				    	<input type="text" name="OWN_CRN" class="form-control" />
				  </div>
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>이메일</label> </div>
				    	<input type="email" name="OWN_EMAIL" class="form-control" />
				  </div>
				  
				  <button type="submit" class="btn btn-primary btn-block mb-4" id="RFCBtn"
				  		  style="color: #111111; background-color: #FFF2A6; border-color: #ffffff;">인증번호 받기</button>
				</form>
				

				  	  <!-- 인증번호 받기 선택하면 인증번호 칸 뜨도록 설정 -->		
				<form action="searchPro.ow" style="text-align: center;" method="post" name="searchId">  
<%-- 					  <c:set var="storeInfo" value="${requestScope.joinCheck}"/> --%>
<%-- 					  <c:if test="${!empty joinCheck.OWN_EMAIL }">		  		   --%>
<!-- 						<div class="mail-check-box"> -->
						  <div class="form-outline mb-4">
						  	<div style="text-align: left;"> <label>인증번호</label></div>
						    	<input type="text" name="idCode" id="idCode" class="form-control input_auth" />
						    </div>
<!-- 						</div> -->
						  <button type="submit" class="btn btn-primary btn-block mb-4" id="authBtn"
						  		  style="color: #111111; background-color: #FFF2A6; border-color: #ffffff;"
						  		  > 다음</button>
<%-- 					  </c:if>		 --%>
				
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var modal = document.getElementById("authModal");
var authbtn = document.getElementById("authBtn");
var span = document.getElementsByClassName("close")[0];
var RFCBtn = document.getElementById("RFCBtn");
//var cancelBtn = document.getElementById("cancelBtn");

var idCode = document.searchId.idCode.value;

authbtn.onclick = function() {
	let inputs = document.searchId;
	
	// 인증번호 null&불일치 => 모달창으로 '인증번호가 틀렸습니다. 다시 입력해 주십시오.' 안내하고 페이지 이동 X
	if(!inputs.idCode.value){
		alert("인증번호를 입력하세요.");
		return false;	
	}
	
	modal.style.display = "block";
	
	// 인증번호가 세션값이랑 같으면 모달창으로 아이디 알려주고 확인버튼 누르면 로그인 페이지로 이동
	if(${sessionScope.AuthNumber}.equals(idCode)) {
		alert("찾은 아이디: ");
		RFCBtn.onclick = function() {
			location.href = 'owner_login.ow';
		}
	} else {
		alert("인증번호가 틀렸습니다. 다시 확인해 주십시오.");
	}

	function move(){
		location.href = 'owner_login.ow';
	}
	
    
}

span.onclick = function() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

// cancelBtn.onclick = function() {
// 	  modal.style.display = "none";
// 	}



	RFCBtn = document.querySelector("#RFCBtn");
	idCode = document.querySelector("#idCode");
	
	RFCBtn.onclick = function(e){

		function checkField(){
		}    
	}


</script>
</main>
<%@ include file="/Template/footer.jsp"%> 
</html>
