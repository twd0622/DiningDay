<!-- 12/15/18:10_강현아 + 카카오, 구글 API 연동, 점주 페이지 연결 -->
<!-- 12/20/11:20_강현아 + 카카오, 구글 API 버튼 연결 및 디자인 수정 -->
<!-- 12/26/14:10_강현아 + 페이지 연결 -->
<!-- 12/28/16:50_강현아 + 네이버 api & 컨트롤러 연결-->

<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
</head>
<%@ include file="/Template/header.jsp"%> 

<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 68.5px; padding:100px 0 250px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin" style="width:500px;" >
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">로그인</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form style="text-align: center;" action="loginPro.cu" method="post">
					<!-- 카카오버튼 --> 
					<a id="kakao-login-btn" href="javascript:loginWithKakao()" class="w-100 py-2 mb-2 btn btn-warning rounded-3">
						<img src="${ pageContext.request.contextPath }/resources/img/kakao.png" style="width:30px; height:30px;"/>
						<span style="font-size: 19px;">kakao로 시작하기</span></a>
					<!-- 구글 버튼 -->
					<a id="GgCustomLogin" href="javascript:void(0)" class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3">
						<img src="${ pageContext.request.contextPath }/resources/img/google.png" style="width:30px; height:30px;"/>
						<span style="font-size: 19px;">Google로 시작하기</span></a>
					<!-- 네이버 버튼 -->
					<a id="naverIdLogin_loginButton" href="javascript:void(0)" class="w-100 py-2 mb-2 btn btn-success rounded-3" type="submit">
						<img src="${ pageContext.request.contextPath }/resources/img/naver.png" style="width:30px; height:30px;"/>
						<span style="font-size: 19px;">Naver로 시작하기</span></a>
					<hr class="my-4">
					<!-- 점주용 이동 -->
					<a class="icon-link icon-link-hover mt-2" style="--bs-link-hover-color-rgb: 25, 135, 84;" href="owner_login.ow">
						점주용 계정 로그인 이동<i class="bi bi-hand-index-thumb"></i></a>
				</form>
			</div>
		</div>
	</div>
</div>
</main>
<!-- 카카오 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.min.js" 
		integrity="sha384-kYPsUbBPlktXsY6/oNHSUDZoTX6+YI51f63jCPEIPFP09ttByAdxd2mEjKuhdqn4" 
		crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf-8">  
// // <script>
// // SDK 초기화 - 사용하려는 앱의 JavaScript 키 입력		
// Kakao.init('a7cba1ba5ddd97c09d319895bb3e67f2'); 
// // SDK 초기화 여부 판단
// console.log(Kakao.isInitialized());

//   function loginWithKakao() {
//     Kakao.Auth.authorize({
//       redirectUri: 'http://localhost:8080/DiningDay/main.ma',  // 로그인 후 인가 Code를 받을 주소
//       state: 'userme',
//     });
//   }
  
//   function requestUserInfo() {
//     Kakao.API.request({
//       url: '/v2/user/me',
//     })
//       .then(function(res) {
//         alert(JSON.stringify(res));
//       })
//       .catch(function(err) {
//         alert(
//           'failed to request user information: ' + JSON.stringify(err)
//         );
//       });
//   }

// // 데모를 위한 UI 코드
// displayToken()
// function displayToken() {
//   var token = getCookie('authorize-access-token');

//   if(token) {
//     Kakao.Auth.setAccessToken(token);
//     Kakao.Auth.getStatusInfo()
//       .then(function(res) {
//         if (res.status === 'connected') {
//           document.getElementById('token-result').innerText
//             = 'login success, token: ' + Kakao.Auth.getAccessToken();
//         }
//       })
//       .catch(function(err) {
//         Kakao.Auth.setAccessToken(null);
//       });
//     document.querySelector('button.api-btn').style.visibility = 'visible';  // 생략 O
//   }
// }

//   function getCookie(name) {
//     var parts = document.cookie.split(name + '=');
//     if (parts.length === 2) { return parts[1].split(';')[0]; }
//   }
</script>



<!-- Google -->
<meta name ="google-signin-client_id" 
	  content="383007591516-vj9jddsusaj9kdj8mbd2ncgh46ktsuqd.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script type="text/javascript" charset="utf-8">  
// // <script>
// //처음 실행하는 함수
// function init() {
// 	gapi.load('auth2', function() {
// 		gapi.auth2.init();
// 		options = new gapi.auth2.SigninOptionsBuilder();
// 		options.setPrompt('select_account');
//         // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
// 		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
//         // 인스턴스의 함수 호출 - element에 로그인 기능 추가
//         // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
// 		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
// 	})
// }

// function onSignIn(googleUser) {
// 	var access_token = googleUser.getAuthResponse().access_token
// 	$.ajax({
//     	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
// 		url: 'https://people.googleapis.com/v1/people/me'
//         // key에 자신의 API 키를 넣습니다.
// 		, data: {personFields:'birthdays', key:'AIzaSyBVfMqr34r31qxZCsCS2bcUDXRCYA-ckBQ', 'access_token': access_token}
// 		, method:'GET'
// 	})
// 	.done(function(e){
//         //프로필을 가져온다.
// 		var profile = googleUser.getBasicProfile();
// 		console.log(profile)
// 	})
// 	.fail(function(e){
// 		console.log(e);
// 	})
// }
// function onSignInFailure(t){		
// 	console.log(t);
// }
</script>


<!-- Naver -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript">

var naverLogin = new naver.LoginWithNaverId({
	clientId: "CAuxVKiVTj4jz8eHQxaN", 
	callbackUrl: "http://localhost:8080/DiningDay/login.cu",
	isPopup: false,
	callbackHandle: true
});	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
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
				   CUS_GENDER: (naverLogin.user.gender == "M") ?  "남" : "여"
			   }
			})
			.done(
				function(data){
					naverLogin.logout();
					location.href="main.ma"					
			});  
		}
	});
});



// 로그아웃
var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
}
</script>
<%@ include file="/Template/footer.jsp"%> 
</html>