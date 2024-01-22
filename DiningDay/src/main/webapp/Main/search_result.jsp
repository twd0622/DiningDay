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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    <link href="Main/css/search_result.css" rel="stylesheet">
    
    <script src="Main/js/search_result.js"></script>
    <link href="Main/css/location_select_modal.css" rel="stylesheet">
    <title>DINING DAY</title>    
</head>
	<c:set var="searchList" value="${requestScope.searchList}" />
	<div class="masthead" style="background: #a3a8a2; height:150px; display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 100px;">
    	<div class="container" style="display: flex; height: 100%; flex-direction: column;justify-content: center;">
			<div class="text-center text-white" style="margin-top: 10px;">
            	<form id="searchForm" action="searchResult.ma" method="get" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="width: 600px; height: 50px;">
                	<div class="input-group" style="height: 100%">
						<button class="btn btn-danger" type="button" id="locationBtn">
						<i class="bi bi-geo-alt-fill"></i>
						</button>
                    	<input id="searchInput" name="searchInput" type="text" class="form-control bg-light border-0 small" value="${requestScope.searchInput}"
                         aria-label="Search" aria-describedby="basic-addon2" style="height: 100%">
                     	<div class="input-group-append">
                       		<button class="btn btn-warning" type="button" id="searchBtn">
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
                    <h3 class="section-heading text-uppercase" style="margin-left:20px; text-align: left">"${requestScope.searchInput}" 검색결과 <span class="section-heading text-uppercase searchCount" style="text-align: left">${requestScope.searchCount}</span>개</h3>
                </div>
                <div id="resultBox" style="display: flex; flex-direction: column; justify-content: space-around;">
					<!-- 검색 결과 -->	
	               	<c:forEach var="list" items="${searchList}">
	                   <div name="${list.STORE_NO}" class="mb-4 store_result_btn" style="margin: 20px 20px; padding:20px 40px; border-bottom: 2px solid #e6e6eb;">
	                       <div class="portfolio-item  store_result">
	                              <img src="upload/${list.PHOTO_NAME}" alt="${list.PHOTO_NAME}" style="width: 385px; height: 250px; overflow-clip-margin:border-box;"/>
	                           <div class="portfolio-caption" style="">
	                               <div class="portfolio-caption-heading">${list.STORE_NAME}</div>
	                               <div class="portfolio-caption-subheading text-muted" style="margin-bottom: 35px;">${list.STORE_CATEGORY} 
	                               <c:if test="${!empty list.STORE_DETAIL}">
									| ${list.STORE_DETAIL}
								</c:if>
								</div>
								   <div class="portfolio-caption-subheading text-muted" style="font-weight: 500;">${list.STORE_LOCATION}</div> 
	                               <div class="portfolio-caption-subheading text-muted" style="display: flex;"><span class="material-icons" style="color: #F7CE3E;">grade</span> ${list.STORE_SCORE}점 (${list.STORE_REVIEW_COUNT}명)</div>
	                               <div class="portfolio-caption-subheading text-muted" style="display: flex;"><span class="material-icons" style="color: #E21818;">favorite</span> ${list.LIKE_COUNT} </div>
	                           </div>
	                       </div>
	                   </div>
	               	</c:forEach>
                </div>
            </div>
        </section>
        
        <!-- location modal -->
        <div class="modal_layer" id="modal_layer" style="display: none;">
			<div class="modal_wrap">
				<div class="modal_container" >
				
					<div class="location_modal_header">
						<div></div>
						<span class="Location__Popup__Title">지역 선택</span>
						<button class="Location__Popup__Close">
						<img class="Location__Popup__Close__Image" src="https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/web/react_components/indexPage/popup_close.png" alt=""></button>
					</div>
					
					<div class="Location__Popup__Main">
						<div class="Location__District__Header">
							<div class="District__Header__Title">광역시도</div>
							<div class="District__Header__Title">시군구</div>
							<div class="District__Header__Title">읍면동</div>
						</div>
						<div class="District__List__Box">
							<ul class="District__List">
								<li class="District__Item">
									<button class="District__Item__Button now">서울<img class="District__Item__Button__Img" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAoCAYAAAD6xArmAAAABHNCSVQICAgIfAhkiAAAAXpJREFUSEu917FKA0EQBuDbF7CKIUWKFBb2BiSCkjS+R3oLH8F3yBNJQAvLRBBikSKQiErwCc5/ZBIml7vbnZ09D5ZdyOVjmZ292XV5no+zLHtAW6DdO+fm6M2PA/wD5YSlb/Qj4DOrTPALkL6AthhfA3+14AR3AUzRegL6xPgG+Fss7uiPTeB/cBP4Hk6NH8ACf8aYYr971DE/ghmnhaQFjcZLYQ9+hWx592VLJVyDbzjPa/Fa2IJ7YYHTgnZECGpnHgQzfsYLGoQHw1pcBWtwNezBB0jFJb0TBQv8CeNTsaArTsVlNMz4OfpHtHYBvzTBAqft3xL4JBVcnLUNRoEoC8UHZn4RPWOgtGGKi7ffjVEwoxTXyl2ohkNQdR6HoipYgwbDQHt4Oe1nk9Fi/fNWkZjSRBXbW/diimnQ0ev/yn9FTG0HFj4cmk9BB+mW+sTZ3DE29Ux3H/uyq8IXfhymuCrIyw3dPyhPzTcnmvEdsAnaGu02BUrh+AU3Het2tPvd3gAAAABJRU5ErkJggg==" alt=""></button>
								</li>
								<li class="District__Item"><button class="District__Item__Button ">강원</button></li>
								<li class="District__Item"><button class="District__Item__Button ">경기</button></li>
								<li class="District__Item"><button class="District__Item__Button ">경남</button></li>
								<li class="District__Item"><button class="District__Item__Button ">경북</button></li>
								<li class="District__Item"><button class="District__Item__Button ">광주</button></li>
								<li class="District__Item"><button class="District__Item__Button ">대구</button></li>
								<li class="District__Item"><button class="District__Item__Button ">대전</button></li>
								<li class="District__Item"><button class="District__Item__Button ">부산</button></li>
								<li class="District__Item"><button class="District__Item__Button ">울산</button></li>
								<li class="District__Item"><button class="District__Item__Button ">인천</button></li>
								<li class="District__Item"><button class="District__Item__Button ">전남</button></li>
								<li class="District__Item"><button class="District__Item__Button ">전북</button></li>
								<li class="District__Item"><button class="District__Item__Button ">제주</button></li>
								<li class="District__Item"><button class="District__Item__Button ">충남</button></li>
								<li class="District__Item"><button class="District__Item__Button ">충북</button></li>
							</ul>
							<ul class="District__List">
								<li class="District__Item"><button class="District__Item__Button now">전체<img class="District__Item__Button__Img" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAoCAYAAAD6xArmAAAABHNCSVQICAgIfAhkiAAAAXpJREFUSEu917FKA0EQBuDbF7CKIUWKFBb2BiSCkjS+R3oLH8F3yBNJQAvLRBBikSKQiErwCc5/ZBIml7vbnZ09D5ZdyOVjmZ292XV5no+zLHtAW6DdO+fm6M2PA/wD5YSlb/Qj4DOrTPALkL6AthhfA3+14AR3AUzRegL6xPgG+Fss7uiPTeB/cBP4Hk6NH8ACf8aYYr971DE/ghmnhaQFjcZLYQ9+hWx592VLJVyDbzjPa/Fa2IJ7YYHTgnZECGpnHgQzfsYLGoQHw1pcBWtwNezBB0jFJb0TBQv8CeNTsaArTsVlNMz4OfpHtHYBvzTBAqft3xL4JBVcnLUNRoEoC8UHZn4RPWOgtGGKi7ffjVEwoxTXyl2ohkNQdR6HoipYgwbDQHt4Oe1nk9Fi/fNWkZjSRBXbW/diimnQ0ev/yn9FTG0HFj4cmk9BB+mW+sTZ3DE29Ux3H/uyq8IXfhymuCrIyw3dPyhPzTcnmvEdsAnaGu02BUrh+AU3Het2tPvd3gAAAABJRU5ErkJggg==" alt=""></button></li>
								
							</ul>
							<ul class="District__List">
							</ul>
						</div>
					</div>
					
					<div class="Location__Popup__User__Confirm">
						<button class="Location__Popup__Cancle"><span>초기화</span></button>
						<button class="Location__Popup__Submit"><span>선택 완료</span></button>
					</div>
					
				</div>
			</div>
		</div>
	</main>
    <script src="/itwillbs_2_01/resources/js/main.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<%@ include file="/Template/footer.jsp"%>
</html> 