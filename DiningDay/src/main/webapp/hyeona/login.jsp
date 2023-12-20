<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Modals · Bootstrap v5.3</title>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }

      .bd-mode-toggle {
        z-index: 1500;
      }

      .bd-mode-toggle .dropdown-menu .active .bi {
        display: block !important;
      }
    </style>

  </head>
	 <%@ include file="/Template/header.jsp"%> 
	 	<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 68.5px; padding:20px 0 50px 0; background:white;">
			<div class="position-static d-block bg-body p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin" style="width:500px;" >
				<div class="modal-dialog" role="document">
					<div class="modal-content rounded-4 shadow">
						<div class="modal-header p-5 pb-4 border-bottom-0">
							<h1 class="fw-bold mb-0 fs-2">로그인</h1>
						</div>
						<div class="modal-body p-5 pt-0">
							<form class="" style="text-align: center;">
								<button class="w-100 py-2 mb-2 btn btn-warning rounded-3"type="submit" style="font-size: 19px;">
									<img src="${ pageContext.request.contextPath }/resources/img/kakao.png" style="width:40px; height:40px;"/> kakao 계정 로그인
								</button>
								<button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3"
									type="submit" style="font-size: 19px;">
									<img src="${ pageContext.request.contextPath }/resources/img/google.png" style="width:30px; height:30px;"/> Google 계정 로그인
								</button>
								<button class="w-100 py-2 mb-2 btn btn-success rounded-3" type="submit" style="font-size: 19px;">
									<img src="${ pageContext.request.contextPath }/resources/img/naver.png" style="width:40px; height:40px;"/> Naver 계정 로그인
								</button>
								<button class="w-100 mb-2 btn btn-primary rounded-3" type="submit" style="font-size: 19px;">
									사업자용 로그인
								</button>
								<small class="text-body-secondary">사업자용 계정이 기억나지 않으시나요?</small>
								<a class="icon-link icon-link-hover mt-2" style="--bs-link-hover-color-rgb: 25, 135, 84;" href="#">
									사업자용 계정가입 이동
		  							<i class="bi bi-hand-index-thumb"></i>
								</a>
								<hr class="my-4">
								<h2 class="fs-5 fw-bold mb-3"><a class="icon-link icon-link-hover mt-2" href="main.jsp">
									<i class="bi bi-house-door"></i>돌아가기</a>
								</h2>
							</form>
						</div>
					</div>
				</div>
			</div>
		</main>
	 <%@ include file="/Template/footer.jsp"%> 
</html>