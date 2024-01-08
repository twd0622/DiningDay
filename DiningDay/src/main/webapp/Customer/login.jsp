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
<style>
#google-login-button iframe{
  height: 100px !important;
  transform: scale(1.5);
  transform-origin: top;
  border-style: none;
  width: 100%; 
  height: 120px;
}  
.nsm7Bb-HzV7m-LgbsSe {
border: none;
}
</style>
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
            Kakao.Auth.setAccessToken(authObj.access_token);
            getInfo();
        }
        , fail: function (err) {
            console.log(err);
        }
    });
}

// 엑세스 토큰을 발급받고, 아래 함수를 호출시켜 사용자 정보 받아옴.
function getInfo() {
    Kakao.API.request({
        url: '/v2/user/me'
        , success: function (res) {
            console.log(res);
	         $.ajax({
		         type : "POST"
		         , url : "loginPro.cu"
		         , datatype : "json"
		         , data : {
		          CUS_ID : res.id,
		           CUS_NAME : res.kakao_account.name
		           , CUS_BIRTH: res.kakao_account.birthyear + res.kakao_account.birthday
		           , CUS_TEL: res.kakao_account.phone_number.replace("+82 ", "0")
		           , CUS_EMAIL : res.kakao_account.email
		           , CUS_GENDER: (res.kakao_account.gender == "male") ?  "M" : "F"
	         	  }
	         })
	         .done(
				function(data){
					Kakao.Auth.logout();
					location.href="main.ma"					
			}); 
        }
        , fail: function (error) {
            alert('카카오 로그인에 실패했습니다.' + JSON.stringify(error));
        }
    });
}
</script>




<!-- Google -->
<meta name ="google-signin-client_id" 
	  content="AIzaSyBVfMqr34r31qxZCsCS2bcUDXRCYA-ckBQ.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script src="https://apis.google.com/js/platform.js?onload=triggerGoogleLoaded"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script type="text/javascript" charset="utf-8">  
window.onload = function () {
	  google.accounts.id.initialize({
	    client_id: "383007591516-vj9jddsusaj9kdj8mbd2ncgh46ktsuqd.apps.googleusercontent.com"
	    , callback: handleCredentialResponse
	  });
	  google.accounts.id.renderButton(
	    document.getElementById("GgCustomLogin")
	    , {text: "signin_with"
	       , shape: "square"
	       , width: "330px"
	       , height: "50px"
	       , logo_alignment: "center"
	    });
// 	  google.accounts.id.prompt();
	}


function parseJwt (token) {
    var base64Url = token.split('.')[1];
    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));
    return JSON.parse(jsonPayload);
};

function handleCredentialResponse(response) {
	const responsePayload = parseJwt(response.credential);
	console.log(responsePayload);
	$.ajax({
		 type : "POST"
	   , url : "loginPro.cu"
	   , datatype : "JSON"
	   , data: {
		   CUS_ID : responsePayload.sub
		   , CUS_NAME :responsePayload.family_name + responsePayload.given_name
		   , CUS_EMAIL: responsePayload.email
	   }
	})
	.done(
		function(data){
			location.href="main.ma"					
	}); 
}

function onSignout() {
    google.accounts.id.disableAutoSelect();
  }
</script>




<!-- Naver -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript">

var naverLogin = new naver.LoginWithNaverId({
	clientId: "CAuxVKiVTj4jz8eHQxaN"
	, callbackUrl: "http://localhost:8080/DiningDay/login.cu"
	, isPopup: false
	, callbackHandle: true
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
				   CUS_ID : naverLogin.user.id
				   , CUS_NAME :naverLogin.user.name
				   , CUS_BIRTH: naverLogin.user.birthyear + naverLogin.user.birthday.replace("-", "")
				   , CUS_TEL: naverLogin.user.mobile
				   , CUS_EMAIL: naverLogin.user.email
				   , CUS_GENDER: naverLogin.user.gender
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
</script>
<%@ include file="/Template/footer.jsp"%> 
</html>