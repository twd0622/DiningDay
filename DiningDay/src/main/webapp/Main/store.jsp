<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/Template/header.jsp"%> 
    <meta charset="utf-8">
   	<c:set var="storeInfo" value="${requestScope.storeInfo}"/>
	<c:set var="menuList" value="${requestScope.menuList}"/>
	<c:set var="tableList" value="${requestScope.tableList}"/>
    
    
    <!-- 식당 이름으로 타이틀 지정 -->
    <title>Dining Day - ${storeInfo.STORE_NAME}</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
	<link href="Main/css/store.css" rel="stylesheet" >
	<link href="Main/css/storeModal.css" rel="stylesheet">
	<script src="Main/js/storeModal.js"></script>
	<script src="Main/js/changeOption.js"></script>
	<script src="Main/js/store.js"></script>
	
</head>

	
	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; margin-top: 100px; padding:20px 0 50px 0;">
		
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="main_container">
			<div class="store_profile" id="${storeInfo.STORE_NO}">
				<div class="bannerBox">
					<div class="banner">
						<div class="banner_img_box">
							<img alt="칸다소바.jpg" src="Main/칸다소바.jpg" class="banner_img">
						</div>
						
						<div class="banner_img_box">
							<img alt="음식1.jpg" src="Main/음식1.jpg" class="banner_img">
						</div>
						
					</div>
				</div>					
				<div class="tit-point">
					<h1>${storeInfo.STORE_NAME}</h1>
				</div>
				<div class="store_category">
					<p>${storeInfo.STORE_CATEGORY} 
					<c:if test="${!empty storeInfo.STORE_DETAIL}">
					| ${storeInfo.STORE_DETAIL}
					</c:if>
					</p>
				</div>
				<div class="store_category">
					<p>${storeInfo.STORE_TEL}</p>
				</div>
				<div class="store_score">
					<p>
						<strong style="font-size:18px; vertical-align:middle; padding-right:8px;">${storeInfo.STORE_SCORE}점</strong>
						<span style="font-size: 13px; color: #66666e; margin-right: 5px;">
							87명의 평가 !추가 사항
							<strong style="font-weight: 600; color: #222228;">
								${storeInfo.STORE_SCORE}점
							</strong>
						</span>
						<span class="material-symbols-outlined grade_icon">grade</span>
						<span class="material-symbols-outlined grade_icon">grade</span>
						<span class="material-symbols-outlined grade_icon">grade</span>
						<span class="material-symbols-outlined grade_icon">grade</span>
						<span class="material-symbols-outlined grade_icon">grade</span>
					</p>
					<a href=""> 신고하기 </a>
				</div>
				<div class="profile_btnBox">
					<div class="profile_btn_sec" style="border-right: 2px solid #f0f0f0;">
						<a href="#" onclick="" class="profile_btn">
							<span class="material-symbols-outlined profile_btn_icon" class="profile_btn_icon" style="color:red;">favorite</span>
							<span class="profile_btn_text">찜하기</span>
						</a>
					</div>
					<div class="profile_btn_sec" style="border-right: 2px solid #f0f0f0;">
						<a href="#" onclick="" class="profile_btn">
							<span class="material-symbols-outlined profile_btn_icon" class="profile_btn_icon">map</span>
							<span class="profile_btn_text">위치 보기</span>
						</a>
					</div>
					<div class="profile_btn_sec">
						<a href="#" onclick="" class="profile_btn">
							<span class="material-symbols-outlined profile_btn_icon" class="profile_btn_icon">edit</span>
							<span class="profile_btn_text">리 뷰</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<p class="gap20"></p>
		<div class="main_container">
			<div class="store_detail">
				<!-- 영업 시간 -->
				<div class="busi-hours-today">
					<p class="tit">영업시간</p>
					<ul class="list">
						<li>
							<p class="l-txt"><strong>화 ~ 일</strong></p>
							<p class="r-txt">영업시간: ${storeInfo.STORE_ST} ~ ${storeInfo.STORE_ET}</p>
						</li>
						<li>
						  <p class="l-txt"> </p>
						  <p class="r-txt">브레이크타임: ${storeInfo.STORE_BT}</p>
						</li>
              			<li>
  							<p class="l-txt"> </p>
  							<p class="r-txt">라스트오더: ${storeInfo.STORE_LO}</p>
						</li>
					</ul>
					<hr class="hr">
					<ul class="list">
						<li>
							<p class="l-txt"><strong>월</strong></p>
							<p class="r-txt">정기 휴무</p>
						</li>
					</ul>					
				</div>
				<!-- 메뉴 -->
				<div class="menuBox">
					<p class="tit">대표 메뉴</p>
						<ul class="list Restaurant_MenuList">
							<c:forEach var="menu" items="${menuList}">
								<c:if test="${menu.MENU_HIDE == 1}">
									<li>
										<p class="l-txt Restaurant_MenuItem"><span class="Restaurant_Menu">${menu.MENU_NAME}</span></p>
										<p class="r-txt Restaurant_MenuPrice">${menu.MENU_PRICE}원</p>
									</li>
								</c:if>
							</c:forEach>
						</ul>
				</div>
				<div class="store_infoBOX">
					<p class="tit">식당 설명</p>
					<div>
						<pre>
${storeInfo.STORE_INFO}
						</pre>
					</div>	
				</div>				
				<!-- 테이블 -->
				<div class="tableBox">
					<p class="tit">테이블 예약</p>
					<ul class="list">
						<c:forEach var="table" items="${tableList}">
						<li>
							<div class="table_" id="${table.SEAT_NO}">
								<div class="table_img"></div>
								<div class="table_info" >
									<div class="table_name_box">
										<p class="table_name">${table.SEAT_NAME}</p>
									</div>
									<div class="table_res">
										<div style="width: 80%; height: 100%; line-height: 100%;">
											<ul>
												<li name="minPeople" class="${table.SEAT_MIN}">최소인원: ${table.SEAT_MIN}명</li>
												<li name="maxPeople" class="${table.SEAT_MAX}">최대인원: ${table.SEAT_MAX}명</li>
												<li>이용 시간: ${table.SEAT_USETIME}시간</li>
												<li>${table.SEAT_CONTENT}</li>
											</ul>
										</div>
										<div style="width: 20%;">
											<button class="btn btn-outline-warning modalOpen reservationBtn" style="margin-top:80%">예약하기</button>
										</div>
									</div>
								</div>
							</div>
						</li>
						</c:forEach>
						<!-- 사진없는 버전 -->
						<li>
							<div class="table_">
								<div class="table_info" >
									<div class="table_name_box">
										<p class="table_name">A2</p>
									</div>
									<div class="table_res">
										<div style="width: 80%; height: 100%; line-height: 100%;">
											<ul>
												<li>최소인원: 2명</li>
												<li>최대인원: 4명</li>
												<li>이용 시간: 2시간</li>
												<li>뷰: 오션뷰</li>
											</ul>
										</div>
										<div style="width: 20%;">
											<button class="btn btn-outline-warning modalOpen" style="margin-top:60%">예약하기</button>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>	
			</div>
		</div>
	</main>
	<div id="modalContainer" class="hidden">
	  <div id="modalContent">
	     <h4>예약</h4>
	     <form action="" method="post">
		     <div>
		     	<h5 id="SEAT_NAME"></h5>
		     	<h5>인원</h5>
		     	<div>
		     		<div class="form-control" id="res_people"></div>
		     	</div>
		     	<hr>
		     	<h5>날짜</h5>
		     	<div class="form-control" id="res_date"></div>
		     	<hr>
				<h5>시간</h5>
				<div style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content: center;">
					<c:forEach var="i" begin="${storeInfo.STORE_RST}" end="${storeInfo.STORE_RET}" step="100">
						<fmt:parseDate var="timeFmt" pattern="HHmm" value="${i}"/>
						<fmt:formatDate var="timeFmtStr" pattern="HH:mm" value="${timeFmt}"/>
						<div class="time" style="border:2px solid black; width: 90px; height: 40px; font-size: 25px; font-weight: 300; text-align: center; margin-right: 20px; margin-top: 5px;">
							${timeFmtStr}						
							<input type="radio" class="selectTime" name="time" value="13" style="display: none;">
						</div>
					</c:forEach>
				</div>
				<hr>
		     </div>
		     <div>
			     <input class="btn btn-warning fw-bold text-light" type="submit" value="예약하기">
				 <button type="button" class="btn btn-dark fw-bold" id="modalCloseButton">닫기</button>
		     </div>
	     </form>
	  </div>
	</div>
	
	
<%@ include file="/Template/footer.jsp"%>
</html> 