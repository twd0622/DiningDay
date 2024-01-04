<!-- 12/15/18:10_강현아 + 비밀번호 변경 개설 -->
<!-- 12/19/17:50_강현아 + 비밀번호 변경 내용 수정 -->
<!-- 12/26/14:10_강현아 + 페이지 연결 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주용 계정 비밀번호 변경</title>
</head>
<script>
    function check_pw(){
        var pw = document.getElementById('pw').value;
        var pw2 = document.getElementById('pw2').value;
        var SC = ["!","@","#","$","%"];
        var check_SC = 0;

        if(pw.length < 6 || pw.length>16){
            window.alert('비밀번호는 8글자 이상, 14글자 이하만 이용 가능합니다.');
            pw = '';
        }
        for(var i=0;i<SC.length;i++){
            if(pw.indexOf(SC[i]) != -1){
                check_SC = 1;
            }
        }
        if(check_SC == 0){
            window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
            pw = '';
        }
        if(pw != '' && pw2 != ''){
            if(pw == pw2){
                document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check').style.color='blue';
            }
            else{
                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
            }
        }
    }
</script>
<%@ include file="/Template/header.jsp"%> 
<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 68.5px; padding:100px 0 250px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin" style="width:500px;" >
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">비밀번호 변경</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form class="" style="text-align: center;">
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>새 비밀번호</label> </div>
				    	<input type="password" name="OWN_PW" id="pw" onchange="check_pw()"
				  		       class="form-control" placeholder="영문 대소문자, 숫자, 기타문자 포함 8~14자리">
				  </div>
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>새 비밀번호 확인</label> </div>
				    	<input type="password" name="OWN_PWCHECK" id="pw2" onchange="check_pw()"
				    	       class="form-control" placeholder="비밀번호를 다시 작성해 주세요.">&nbsp;<span id="check"></span>
				  </div>
				  
				<ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
				  <li class="nav-item" role="presentation">
				    <a class="nav-link active" id="own_success" data-mdb-toggle="pill" href="owner_login.ow"  role="tab"
				      aria-controls="register" aria-selected="true"
				      style="color: #111111; background-color: #FFF2A6; border-color: #ffffff;">변경</a>
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
</main>
<%@ include file="/Template/footer.jsp"%> 
</html>