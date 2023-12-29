<!-- 12/26/14:10_강현아 + 로고(->메인페이지) & userDropdown(->계정정정보 및 수정페이지) 연결
					  + 로그인 시, 로그아웃 / 로그아웃 시, 로그인페이지 연결 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<head>
	<!-- Favicon-->
    <link href="${ pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="/itwillbs_2_01/resources/assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${ pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
    <link href="${ pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<link href="${ pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
	<link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="${ pageContext.request.contextPath }/resources/js/color-modes.js"></script>
    <link href="${ pageContext.request.contextPath }/resources/css/modals.css" rel="stylesheet">
	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/modals/">
    <style type="text/css">:root {color-scheme: light only;}</style>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <script src="resources/js/jquery-3.6.0.js"></script>
    
    <style>
    	input:focus {
    		outline: none !important;
    		border-color: #737373 !important;
    		box-shadow: 0 0 3px #737373 !important;
    	}
    </style>
    <script src="resources/js/selectOption.js"></script>
    <link href="resources/css/selectOption.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column min-vh-100" style="background:#f0f0f3">
	<header class="navbar navbar-expand-lg fixed-top" style="background-color: white; padding:0; display: flex; justify-content: center;  box-shadow: 0 3px 3px -3px #d8d8d8; height: 100px; z-index:500;">
		
		<!-- 로고 -->
		<a href="main.ma" style="text-decoration: none; display:flex; flex-direction: row; align-items: center;">
			<span class="material-symbols-outlined" style="color:#9CED92; font-size:30px; -webkit-text-stroke: 0.5px #FFF2A6;">lunch_dining</span>
			<span id="logo"style="color:#9CED92; -webkit-text-stroke:0.5px #FFF2A6; font-size: 30px; letter-spacing:-2px; font-weight: bold;" >Dining Day</span>
		</a>
		
		<!-- 날짜, 인원 설정 -->
		<div style="display: flex; flex-direction: row; margin: 0 480px 0 50px">
			<div style="display: flex; flex-direction: column; margin-right: 10px;">
				<span style="color: #bfbfbf; font-size: 12px;">예약 날짜</span>
				<input id="dateOption" type="date" class="form-control" style="background: #f5f5f5; border: 0; padding: 20px 40px; width: 210px;"
				       value="${sessionScope.date}">
			</div>
			<div style="display: flex; flex-direction: column;">
				<span style="color: #bfbfbf; font-size: 12px;">예약 인원</span>
				<input id="peopleOption" type="text" class="form-control" style="background: #f5f5f5; border: 0; padding: 20px 40px; width: 210px; text-align: center;"
				       value="인원 ${sessionScope.people}명" readonly="readonly">
				<!-- 인원 설정 모달창 -->
				<div id="peopleOptionModal" class="hidden" style="position: absolute; inset: 0px auto auto 0px; transform: translate(840px, 90px); display: none;">
					<div class="css-1k7dy5j" style="max-height: 577px;">
						<div class="css-1eygow7">
							<div class="css-e9pzjs">
								<span class="css-1yqhrfc">인원</span>
								<span class="css-1kmy7xr">유아 및 아동도 인원수에 <br>포함해주세요.<br></span>
							</div>
							<div class="css-1j7hnhe">
								<div class="gc-stepper css-1mcn6si">
									<button class="gc-icon-round-button css-11zi1w5 decrease" type="button">
										<span>
											<svg width="16" height="16" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
												<path d="M2 9h16v2H2V9z" fill="current"></path>
											</svg>
										</span>
									</button>
									<span class="css-gcrqic people">${sessionScope.people}</span>
									<button class="gc-icon-round-button css-11zi1w5 increase" type="button">
										<span>
											<svg width="16" height="16" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
												<path d="M10.998 8.995H18v2h-7.002v7.001H8.995v-7.001H2v-2h6.995V2h2.003v6.995z" fill="current"></path>
											</svg>
										</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>				       
			</div>
		</div>
		
		<!-- Topbar Navbar -->
		<ul class="navbar-nav" >
			<!-- Nav Item - Search Dropdown (Visible Only XS) -->
			<li class="nav-item dropdown no-arrow d-sm-none">
				<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
				   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-search fa-fw"></i>
				</a>
       			<!-- Dropdown - Messages -->
				<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
				     aria-labelledby="searchDropdown">
					<form class="form-inline mr-auto w-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 big"
							       placeholder="Search for..." aria-label="Search"
							       aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</li>
			<!-- Nav Item - User Information -->
			<div class="topbar-divider d-none d-sm-block"></div>
			<li class="nav-item dropdown no-arrow">
				<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
				   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="bi bi-person-square" style="font-size: 35px;"></i>
				</a>
				<!-- Dropdown - User Information -->
				<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				     aria-labelledby="userDropdown">
					<a class="dropdown-item" href="mypage.cu">
					    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
					    내 정보보기
					</a>
					<a class="dropdown-item" href="cus_edit.cu">
					    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
					    정보 수정하기
					</a>
					<a class="dropdown-item" href="#">
					    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
					    찜 목록 보기
					</a>
					<div class="dropdown-divider"></div>
					<c:if test="${empty sessionScope.CUS_ID}">
						<a class="dropdown-item" href="login.cu" >
						   <i class="fas fa-sign-in-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						   로그인
						</a>
					</c:if>
					<c:if test="${!empty sessionScope.CUS_ID}">
						<a class="dropdown-item" href="logout.cu">
							<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
							로그아웃
						</a>
					</c:if>
				</div>
			</li>
    	</ul>
	</header>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${ pageContext.request.contextPath }/resources/js/scripts.js"></script>