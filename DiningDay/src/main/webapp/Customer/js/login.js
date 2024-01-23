//<!-- 카카오 -->
Kakao.init('b769e12f4b0300d723c03ea88cce6413'); 
Kakao.isInitialized();
function loginWithKakao() {
    Kakao.Auth.login({
        success: function (authObj) {
            Kakao.Auth.setAccessToken(authObj.access_token);
            getInfo();
        }
    });
}

function getInfo() {
    Kakao.API.request({
        url: '/v2/user/me'
        , success: function (res) {
	         $.ajax({
		         type : "POST"
		         , url : "loginPro.cu"
		         , datatype : "json"
		         , data : {
					 CUS_ID : res.id
		          	 , CUS_NAME : res.kakao_account.name
		          	 , CUS_BIRTH: res.kakao_account.birthyear + res.kakao_account.birthday
		          	 , CUS_TEL: res.kakao_account.phone_number.replace("+82 ", "0")
		          	 , CUS_EMAIL : res.kakao_account.email
		          	 , CUS_GENDER: (res.kakao_account.gender == "male") ?  "M" : "F"
		         }
	         })
	         .done(
				function(data){
					Kakao.Auth.logout();
					location.href="main.ma";					
			}); 
        }
        , fail: function (error) {
            alert('카카오 로그인에 실패했습니다.' + JSON.stringify(error));
        }
    });
}


//<!-- Google -->
//window.onload = function () {
//	google.accounts.id.initialize({
//	      client_id: "383007591516-vj9jddsusaj9kdj8mbd2ncgh46ktsuqd.apps.googleusercontent.com"
//	    , callback: handleCredentialResponse
//	  });
//
//	google.accounts.id.prompt(function(a){
////	  console.log('!@#!@#')
//	  console.log(a.getNotDisplayedReason()) 
//	});
//	  
//	google.accounts.id.renderButton(document.getElementById("gLoginBtn"), {});
//	$('#GgCustomLogin').on('click', function(){
//	 	$('#gLoginBtn').find('div')[2].click();
//	});
//}
//
//function parseJwt (token) {
//    var base64Url = token.split('.')[1];
//    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
//    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
//        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
//    }).join(''));
//    return JSON.parse(jsonPayload);
//};
//
//function handleCredentialResponse(response) {
//	debugger;
//	const responsePayload = parseJwt(response.credential);
//	console.log(responsePayload);
//	$.ajax({
//		 type : "POST"
//	   , url : "loginPro.cu"
//	   , datatype : "JSON"
//	   , data: {
//		   CUS_ID : responsePayload.sub
//		   , CUS_NAME :responsePayload.family_name + responsePayload.given_name
//		   , CUS_EMAIL: responsePayload.email
//	   }
//	})
//	.done(
//		function(data){
//			location.href="main.ma";					
//	}); 
//}



//<!-- Naver -->
let callbackUrl = document.location.href;

var naverLogin = new naver.LoginWithNaverId({
	clientId: "CAuxVKiVTj4jz8eHQxaN"
	, callbackUrl: callbackUrl
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
					location.href="main.ma";					
			});
		}
	});
});