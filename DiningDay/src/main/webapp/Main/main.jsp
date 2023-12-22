<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
   	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${ pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet">
    <title>DINING DAY</title>    
</head>

<%@ include file="/Template/header.jsp"%> 
	<div class="masthead" style="background: #a3a8a2; height:300px; display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 100px;">
    	<div class="container" style="display: flex; height: 100%; flex-direction: column;justify-content: center;">
    		<p class="nav-text" style="font-size: 20px;">특별한 날에 맛있는 음식을 즐기세요.</p>
    		<p class="nav-text" style="font-size: 24px;">DINING DAY !</p>
			<div class="text-center text-white" style="margin-top: 10px;">
            	<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="width: 600px; height: 50px;">
                	<div class="input-group" style="height: 100%">
						<button class="btn btn-danger" type="button">
						<i class="bi bi-geo-alt-fill"></i>
						</button>
                    	<input type="text" class="form-control bg-light border-0 small" placeholder="식당이름을 검색하세요!"
                         aria-label="Search" aria-describedby="basic-addon2" style="height: 100%">
                     	<div class="input-group-append">
                       		<button class="btn btn-warning" type="button">
							<i class="bi bi-search"></i>
                     		</button>
                    	</div>
                	</div>
            	</form>
        	</div>
    	</div>
    </div>
	<main style="display: flex; justify-content: center; align-items: center; text-align: center;">
		<!-- 여기에 바디내용 넣기 -->
		<section class="page-section main_section" id="portfolio" style="background:white;">
            <div class="container" style="border-bottom: 1.5px solid #f0f0f3; padding-top: 50px;">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase" style="margin-left:20px; text-align: left">추천 맛집</h2>
                </div>
                <div style="display: flex; flex-direction: row; justify-content: space-around;">
                    <div class="col-lg-3 mb-4">
                        <!-- Portfolio item 4-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" href="store.jsp">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><span class="material-symbols-outlined" style="font-size: 80px;">search</span></div>
                                </div>
                                <img class="img-fluid" src="칸다소바.jpg" alt="칸다소바.jpg" />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">칸다소바</div>
                                <div class="portfolio-caption-subheading text-muted">5.0</div>
                                <div class="portfolio-caption-subheading text-muted">⭐⭐⭐⭐⭐</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 mb-4">
                        <!-- Portfolio item 5-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><span class="material-symbols-outlined" style="font-size: 80px;">search</span></div>
                                </div>
                                <img class="img-fluid" src="칸다소바.jpg" alt="칸다소바.jpg" />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">칸다소바</div>
                                <div class="portfolio-caption-subheading text-muted">5.0</div>
                                <div class="portfolio-caption-subheading text-muted">⭐⭐⭐⭐⭐</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 mb-4">
                        <!-- Portfolio item 6-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal6">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><span class="material-symbols-outlined" style="font-size: 80px;">search</span></div>
                                </div>
                                <img class="img-fluid" src="칸다소바.jpg" alt="칸다소바.jpg"/>
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">칸다소바</div>
                                <div class="portfolio-caption-subheading text-muted">5.0</div>
                                <div class="portfolio-caption-subheading text-muted">⭐⭐⭐⭐⭐</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container" style="padding-top: 50px;">
	            <h2 class="section-heading text-uppercase" style=" margin-left:20px; text-align: left">인기 리뷰</h2>	
            	<div style="display: flex; flex-direction: row; justify-content: space-around;">
					<div class="col-lg-4 col-sm-6 mb-4">
				        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false" style="fill:#9CED92;"><title>Placeholder</title><rect width="100%" height="100%"></rect></svg>
				        <h2 class="fw-normal cus_nickname">유저1</h2>
				        <p>맛집 인정!</p>
				        <p><a class="btn" href="#" style="background: #FFF2A6;">상세보기 »</a></p>
			      	</div>
			      	<div class="col-lg-4 col-sm-6 mb-4">
				        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false" style="fill:#9CED92;"><title>Placeholder</title><rect width="100%" height="100%"></rect></svg>
				        <h2 class="fw-normal cus_nickname">유저2</h2>
				        <p>완전 맛도리!</p>
				        <p><a class="btn" href="#" style="background: #FFF2A6;">상세보기 »</a></p>
			      	</div>
			      	<div class="col-lg-4 col-sm-6 mb-4">
				        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false" style="fill:#9CED92;"><title>Placeholder</title><rect width="100%" height="100%"></rect></svg>
				        <h2 class="fw-normal cus_nickname">유저3</h2>
				        <p>꿀맛!</p>
				        <p><a class="btn" href="#" style="background: #FFF2A6;">상세보기 »</a></p>
			      	</div>
				</div>
	    	</div>
        </section>
	</main>
    <script src="/itwillbs_2_01/resources/js/main.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<%@ include file="/Template/footer.jsp"%>
</html> 