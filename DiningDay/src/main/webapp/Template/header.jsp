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
    <script src="${ pageContext.request.contextPath }/resources//js/jquery-3.6.0.js"></script>
</head>
<body class="d-flex flex-column min-vh-100" style="background:#f0f0f3">
	<header class="navbar navbar-expand-lg fixed-top" style="background-color: white; padding:0; display: flex; justify-content: space-around;  box-shadow: 0 3px 3px -3px #d8d8d8; height: 100px; z-index:500;">
		
		<a href="main.cu" style="text-decoration: none; display:flex; flex-direction: row; align-items: center;">
			<span class="material-symbols-outlined" style="color:#9CED92; font-size:30px; -webkit-text-stroke: 0.5px #FFF2A6;">lunch_dining</span>
			<span id="logo"style="color:#9CED92; -webkit-text-stroke:0.5px #FFF2A6; font-size: 30px; letter-spacing:-2px; font-weight: bold;" >Dining Day</span>
		</a>

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
                                    로그인 </a>
								</c:if>
								<c:if test="${!empty sessionScope.CUS_ID}">
                              	  <a class="dropdown-item" href="logout.cu">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃 </a>
                                </c:if>
                            </div>
                        </li>
                    </ul>
                </header>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${ pageContext.request.contextPath }/resources/js/scripts.js"></script>