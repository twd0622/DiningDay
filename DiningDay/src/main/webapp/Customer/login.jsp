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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" charset="utf-8">  
// SDK 초기화 - 사용하려는 앱의 JavaScript 키 입력		
Kakao.init('b769e12f4b0300d723c03ea88cce6413'); 

// SDK 초기화 여부 판단
Kakao.isInitialized();

// 카카오로그인 코드 확인
function loginWithKakao() {
    Kakao.Auth.login({
        success: function (authObj) {
            Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장
            getInfo();
        },
        fail: function (err) {
            console.log(err);
        }
    });
}

// 엑세스 토큰을 발급받고, 아래 함수를 호출시켜 사용자 정보 받아옴.
function getInfo() {
    Kakao.API.request({
        url: '/v2/user/me',
        success: function (res) {
            console.log(res);
	         $.ajax({
		         type : "POST"
		         , url : "loginPro.cu"
		         , datatype : "json"
		         , data : {
		          CUS_ID : res.id,
		           CUS_NAME : res.kakao_account.name,
		           CUS_BIRTH: res.kakao_account.birthyear + res.kakao_account.birthday,
		           CUS_TEL: res.kakao_account.phone_number.replace("+82 ", "0"),
		           CUS_EMAIL : res.kakao_account.email,
		           CUS_GENDER: (res.kakao_account.gender == "male") ?  "남" : "여"
	         	  }
	         })
	         .done(
				function(data){
					Kakao.Auth.logout();
					location.href="main.ma"					
			}); 
	         
        },
        fail: function (error) {
            alert('카카오 로그인에 실패했습니다.' + JSON.stringify(error));
        }
    });
}
  
  
// 로그아웃 기능 - 카카오 서버에 접속하는 액세스 토큰을 만료 시킨다.
function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
        alert('로그인되어 있지 않습니다.');
        return;
    }
    Kakao.Auth.logout(function() {
        alert('로그아웃' + Kakao.Auth.getAccessToken());
    });
}
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