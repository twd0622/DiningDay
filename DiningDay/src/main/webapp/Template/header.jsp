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
</head>
<body class="d-flex flex-column min-vh-100" style="background:#f0f0f3">
	<header class="navbar navbar-expand-lg fixed-top" style="background-color: rgb(238, 231, 218);padding:0;">
		<a href="#" class="animate__animated animate__rollIn"><img src="${ pageContext.request.contextPath }/resources/img/9.gif.gif" alt="" width="30" height="30"></a>
        <!-- Sidebar Toggle (Topbar) -->
        	<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
        	</button>
            	<!-- Topbar Navbar -->
               	<ul class="navbar-nav ml-auto" >

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
<!--                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>-->
<!--                                <img class="img-profile rounded-circle"-->
<!--                                    src="itwillbs_2_01/resources/img/undraw_profile.svg">-->
                                    <i class="bi bi-person-square" style="font-size: 35px; color: black;"></i>
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    내 정보보기
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="login.jsp">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    임시 로그인
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
                        </li>
                    </ul>
                </header>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${ pageContext.request.contextPath }/resources/js/scripts.js"></script>