<!-- 12/15/18:10_강현아 + 카카오, 구글 API 연동, 점주 페이지 연결 -->
<!-- 12/20/11:20_강현아 + 카카오, 구글 API 버튼 연결 및 디자인 수정 -->
<!-- 12/26/14:10_강현아 + 페이지 연결 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<!-- 카카오 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.min.js" 
		integrity="sha384-kYPsUbBPlktXsY6/oNHSUDZoTX6+YI51f63jCPEIPFP09ttByAdxd2mEjKuhdqn4" 
		crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf-8">  
// <script>
// SDK 초기화 - 사용하려는 앱의 JavaScript 키 입력		
Kakao.init('a7cba1ba5ddd97c09d319895bb3e67f2'); 
// SDK 초기화 여부 판단
console.log(Kakao.isInitialized());

  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/itwillbs_2_01/junwoo/main.jsp',  // 로그인 후 인가 Code를 받을 주소
      state: 'userme',
    });
  }
  
  function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
    })
      .then(function(res) {
        alert(JSON.stringify(res));
      })
      .catch(function(err) {
        alert(
          'failed to request user information: ' + JSON.stringify(err)
        );
      });
  }

// 데모를 위한 UI 코드
displayToken()
function displayToken() {
  var token = getCookie('authorize-access-token');

  if(token) {
    Kakao.Auth.setAccessToken(token);
    Kakao.Auth.getStatusInfo()
      .then(function(res) {
        if (res.status === 'connected') {
          document.getElementById('token-result').innerText
            = 'login success, token: ' + Kakao.Auth.getAccessToken();
        }
      })
      .catch(function(err) {
        Kakao.Auth.setAccessToken(null);
      });
    document.querySelector('button.api-btn').style.visibility = 'visible';  // 생략 O
  }
}

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>



<!-- Google -->
<meta name ="google-signin-client_id" 
	  content="383007591516-vj9jddsusaj9kdj8mbd2ncgh46ktsuqd.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script type="text/javascript" charset="utf-8">  
// <script>
//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyBVfMqr34r31qxZCsCS2bcUDXRCYA-ckBQ', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
        //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}
</script>



<!-- Naver -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>
var naverLogin = new naver.LoginWithNaverId({
	clientId: "FQiIY5qi2YOzM6a9bsSi", 
	callbackUrl: "http://localhost:8080/itwillbs_2_01/junwoo/main.jsp",
	isPopup: false,
	callbackHandle: true
});	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
			const name = naverLogin.user.getName();
	        const gender = naverLogin.user.getGender();
	        const age = naverLogin.user.getAge();
	        const birthday = naverLogin.user.getBirthday();
	        const mobile = naverLogin.user.getMobile();
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			} else{
		        setLoginStatus(); //모든 필수 정보 제공 동의하면 실행하는 함수
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


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
						<span style="font-size: 19px;">kakao 계정 로그인</span></a>
					<!-- 구글 버튼 -->
					<a id="GgCustomLogin" href="javascript:void(0)" class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3">
						<img src="${ pageContext.request.contextPath }/resources/img/google.png" style="width:30px; height:30px;"/>
						<span style="font-size: 19px;">Google 계정 로그인</span></a>
					<!-- 네이버 버튼 -->
					<button id="naverIdLogin" class="w-100 py-2 mb-2 btn btn-success rounded-3" type="submit" style="font-size: 19px;">
						<img src="${ pageContext.request.contextPath }/resources/img/naver.png" style="width:30px; height:30px;"/>
						Naver 계정 로그인
					</button>
					<p></p>

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
<%@ include file="/Template/footer.jsp"%> 
</html>