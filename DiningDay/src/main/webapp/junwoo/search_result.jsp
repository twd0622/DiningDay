<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Template/header.jsp"%> 
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
    <link href="css/search_result.css" rel="stylesheet">
    <title>DINING DAY</title>    
</head>

	<div class="masthead" style="background: #a3a8a2; height:150px; display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 100px;">
    	<div class="container" style="display: flex; height: 100%; flex-direction: column;justify-content: center;">
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
		<section class="page-section main_section" id="portfolio" style="background:white; width: 1320px;">
            <div class="container" style="border-bottom: 1.5px solid #f0f0f3; padding-top: 50px;">
                <div class="text-center">
                    <h3 class="section-heading text-uppercase" style="margin-left:20px; text-align: left">"칸다 소바" 검색결과 3개</h3>
                </div>
                <div style="display: flex; flex-direction: column; justify-content: space-around;">
                    <!-- 검색 결과 -->
                    <div id="store_result" class="mb-4" style="margin: 20px 20px; padding:20px 40px; border-bottom: 2px solid #e6e6eb;">
                        <div class="portfolio-item  store_result">
                                <img class="img-fluid" src="칸다소바.jpg" alt="칸다소바.jpg" style="width: 550px; height: 250px;"/>
                            <div class="portfolio-caption" style="">
                                <div class="portfolio-caption-heading">칸다소바 서면점</div>
                                <div class="portfolio-caption-subheading text-muted" style="margin-bottom: 20px;">일식 | 라멘, 마제소바</div>
                                <div class="portfolio-caption-subheading text-muted">⭐ 4.0점 (87명)</div>
                                <div class="portfolio-caption-subheading text-muted" style="display: flex;"><span class="material-symbols-outlined">favorite</span> 300 </div>
                            </div>
                        </div>
                    </div>
                    <!-- 검색 결과 -->
                    <div id="store_result" class="mb-4" style="margin: 20px 20px; padding:20px 40px; border-bottom: 2px solid #e6e6eb;">
                        <div class="portfolio-item  store_result">
                                <img class="img-fluid" src="칸다소바.jpg" alt="칸다소바.jpg" style="width: 550px; height: 250px;"/>
                            <div class="portfolio-caption" style="">
                                <div class="portfolio-caption-heading">칸다소바 대연점</div>
                                <div class="portfolio-caption-subheading text-muted" style="margin-bottom: 20px;">일식 | 라멘, 마제소바</div>
                                <div class="portfolio-caption-subheading text-muted">⭐ 4.0점 (87명)</div>
                                <div class="portfolio-caption-subheading text-muted" style="display: flex;"><span class="material-symbols-outlined">favorite</span> 300 </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
	</main>
    <script src="/itwillbs_2_01/resources/js/main.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<%@ include file="/Template/footer.jsp"%>
</html> 