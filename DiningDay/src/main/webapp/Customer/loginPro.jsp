<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>api 정보 저장</title>
</head>

<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="resources/js/jquery-3.6.0.js"></script>
<script>
var naverLogin = new naver.LoginWithNaverId({
	clientId: "CAuxVKiVTj4jz8eHQxaN", 
	callbackUrl: "http://localhost:8080/DiningDay/loginPro.cu",
	isPopup: false,
	callbackHandle: true
});	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
// 		debugger;
// 		console.log(naverLogin.user);
// 		console.log(status);
		if (naverLogin.user) {
// 			console.log(naverLogin.user);
// 			debugger;
			$.ajax({
				 type : "POST"
			   , url : "loginPro.cu"
			   , datatype : "json"
			   , data: {
				   CUS_ID : naverLogin.user.id,
				   CUS_NAME :naverLogin.user.name,
				   CUS_BIRTH: naverLogin.user.birthyear + naverLogin.user.birthday.replace("-", ""),
				   CUS_TEL: naverLogin.user.mobile,
				   CUS_EMAIL: naverLogin.user.email,
				   CUS_GENDER: naverLogin.user.gender.replace("M", "남")
			   }
// 			   , success : function(data) {
// 				   console.log(success);
// 			        location.replace('main.ma');
// 			     }
// 			   , error : function(jqXHR, error) {
// 			     }
			})
// 			.done(
// 					function(data){
// 						debugger;
// 			});  
		}
	});
});



</script>
<body>
<h2>api 정보 저장</h2>
</body>
</html>