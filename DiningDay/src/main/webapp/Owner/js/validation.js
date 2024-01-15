// 아이디 유효성 검사
function check_id(){
    var id = document.getElementById('id').value;
    var checkId = document.getElementById('checkId');
    var idRegex = /^[a-z0-9]{6,10}$/;
    
	if (idRegex.test(id)) {
		checkId.innerHTML = '';
	} else {
		checkId.innerHTML = '아이디는 (영어 소문자, 숫자 포함) 6~10자여야 합니다.';
		checkId.style.color = 'red';
	}
}

// 아이디 중복체크
$('#trueCheck').on('click', function(){
	inputs = document.owner_join;
	if(inputs.OWN_ID.value==""){
		alert("아이디를 입력해 주십시오.");
		inputs.OWN_ID.focus();
		return;
	}
 	$.ajax({
		  type: "post"
 		, url: "idCheck.ow"
 		, dataType: "json"
 		, data: {OWN_ID: $("#id").val()}
 		, success: function(data) {
			 if(data) {
				 $("#checkId").append("이미 사용중인 아이디입니다.");
				 $("#checkId").css("color","red");
			 } else {
				 $("#checkId").append("사용가능한 아이디입니다.");
				 $("#checkId").css("color","green");
			 }
 		}
	})
})
	
// 비밀번호 유효성 검사
function check_pw(){
    var pw = document.getElementById('pw').value;
    var pw2 = document.getElementById('pw2').value;
    var check = document.getElementById('check');
    var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{6,14}$/;

	if (pwRegex.test(pw)) {
		if (pw == pw2) {
			check.innerHTML = '비밀번호가 일치합니다.';
			check.style.color = 'green';
		}else{
			check.innerHTML = '비밀번호가 일치하지 않습니다.';
			check.style.color = 'red';
		}
	}else{
		check.innerHTML = '비밀번호는 (영문, 숫자, 특수 문자 포함) 6~14자여야 합니다.';
		check.style.color = 'red';
	}
}

// 입력창 공백 알림
function submit() {
	inputs = document.owner_join;
	
	if(inputs.OWN_ID.value == ""){
		alert("아이디를 입력해 주십시오.");
		inputs.OWN_ID.focus();
		return false;
	}
	if(inputs.OWN_PW.value == ""){
		alert("비밀번호를 입력해 주십시오.");
		inputs.OWN_PW.focus();
		return false;
	}
	if(inputs.OWN_NAME.value == ""){
		alert("이름을 입력해 주십시오.");
		inputs.OWN_NAME.focus();
		return false;
	}
	if(inputs.OWN_TEL.value == ""){
		alert("전화번호를 입력해 주십시오.");
		inputs.OWN_TEL.focus();
		return false;
	}
	if(isNaN(inputs.OWN_TEL.value)){
			alert("전화번호는 숫자만 입력 가능합니다.");
			inputs.OWN_TEL.focus();
			return false;
	}
	if(inputs.OWN_EMAIL.value == ""){
		alert("이메일을 입력해 주십시오.");
		inputs.OWN_EMAIL.focus();
		return false;
	}
	if(inputs.OWN_CRN.value == ""){
		alert("사업자번호를 입력해 주십시오.");
		inputs.OWN_CRN.focus();
		return false;
	}
			
	inputs.submit();
}