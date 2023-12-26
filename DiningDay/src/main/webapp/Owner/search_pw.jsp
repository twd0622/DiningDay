<!-- 12/15/18:10_강현아 + 비밀번호 찾기 개설 -->
<!-- 12/20/18:10_강현아 + 인증번호 관련 alert 추가 -->
<!-- 12/26/14:10_강현아 + 페이지 연결 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주용 계정 비밀번호 찾기</title>
<script type="text/javascript">
//     function checkForm() {
//         var authenCode = $('#authenCode').val();
//         var newPw = $('#newPw').val();
//         var checkPw = $('#checkPw').val();

//         if(authenCode == null || authenCode === "" || newPw == null || 
//         		newPw === "" || checkPw == null || checkPw === "") {
//             alert('모든 입력란을 작성하세요.');
//             return false;
//         }

//         if(newPw !== checkPw) {
//             alert('비밀번호가 일치하지 않습니다.!');
//             return false;
//         }

//         $('form[name="changePwForm"]').submit();
        
//         location.href='new_pw.ow';
//     }
    
	function checkField(){
		let inputs = document.searchPw;
		
		// 인증번호 null&불일치 => 모달창으로 '인증번호가 틀렸습니다. 다시 입력해 주십시오.' 안내하고 페이지 이동 X
		if(!inputs.pwcode.value){
			alert("인증번호를 입력하세요.");
			return false;	
		} else {

		}
	}    
	function move(){
		location.href = 'owner_login.ow';
	}
</script>
</script>
</head>
<%@ include file="/Template/header.jsp"%> 
<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 68.5px; padding:100px 0 250px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin" style="width:500px;" >
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">비밀번호 찾기</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form style="text-align: center;"  method="post" name="searchPw"
					  enctype="multipart/form-data" onsubmit="return checkField();">
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>사업자번호</label> </div>
				    	<input type="text" name="OWN_CRN" class="form-control" />
				  </div>
				<div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>아이디</label> </div>
				    	<input type="text" name="OWN_ID" class="form-control" />
				  </div>				  
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>이메일</label> </div>
				    	<input type="email" name="OWN_EMAIL" class="form-control" />
				  </div>
				  
				  <button type="button" class="btn btn-primary btn-block mb-4" onclick="sendSearchId()" 
				  		  style="color: #111111; background-color: #FFF2A6; border-color: #ffffff;">인증번호 받기</button>
				  
				  <!-- 인증번호 받기 선택하면 인증번호 칸 뜨도록 설정 -->
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>인증번호</label> </div>
				    	<input type="text" name="pwcode" class="form-control" />
				  </div>
				  
				  <button type="submit" class="btn btn-primary btn-block mb-4" onclick="move()"
				  		  style="color: #111111; background-color: #FFF2A6; border-color: #ffffff;">다음</button>
				</form>
			</div>
		</div>
	</div>
</div>
</main>
<%@ include file="/Template/footer.jsp"%> 
</html>