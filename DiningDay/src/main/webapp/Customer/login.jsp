<!-- 12/15/18:10_강현아 + 카카오, 구글 API 연동, 점주 페이지 연결 -->
<!-- 12/20/11:20_강현아 + 카카오, 구글 API 버튼 연결 및 디자인 수정 -->
<!-- 12/26/14:10_강현아 + 페이지 연결 -->
<!-- 12/28/16:50_강현아 + 네이버 api & 컨트롤러 연결-->

<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<meta name="google-site-verification" content="FKL3S1Y8FPADaDMjUDD_lxy9cjBTRlHNUaeXxzVkd1g" />
<meta name ="google-signin-client_id" 
	  content="383007591516-vj9jddsusaj9kdj8mbd2ncgh46ktsuqd.apps.googleusercontent.com">
</head>
<link href="Customer/css/login.css" rel="stylesheet">
<%@ include file="/Template/header.jsp"%> 
<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 68.5px; padding:100px 0 250px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin">
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">로그인</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form action="loginPro.cu" method="post" id="form">
					<!-- 카카오버튼 --> 
					<a id="kakao-login-btn" href="javascript:loginWithKakao()" class="w-100 py-2 mb-2 btn btn-warning rounded-3">
						<img src="./resources/img/kakao.png" id="image"/>
						<span id="span">Kakao로 시작하기</span></a>
					<!-- 구글 버튼 -->
					<a id="GgCustomLogin" href="javascript:void(0)" class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3">
						<img src="./resources/img/google.png" id="image"/>
						<span id="span">Google로 시작하기</span>
					</a>
					<a id="gLoginBtn" style="display:none;"></a>
					
					<!-- 네이버 버튼 -->
					<a id="naverIdLogin_loginButton" href="javascript:void(0)" class="w-100 py-2 mb-2 btn btn-success rounded-3">
						<img src="./resources/img/naver.png" id="image"/>
						<span id="span">Naver로 시작하기</span></a>
					<hr class="my-4">
					<!-- 점주용 이동 -->
					<a class="icon-link icon-link-hover mt-2" href="owner_login.ow">
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
<!-- Google -->
<!-- <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script> -->
<!-- <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script> -->
<!-- <script src="https://apis.google.com/js/platform.js?onload=triggerGoogleLoaded"></script> -->
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- 네이버 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="Customer/js/login.js"></script>
<%@ include file="/Template/footer.jsp"%> 
</html>