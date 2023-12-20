<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- 식당 이름으로 타이틀 지정 -->
    <title>식당 상세 페이지</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
	<link href="css/store.css" rel="stylesheet" >
	<link href="css/storeModal.css" rel="stylesheet">
	<script src="js/jquery-3.6.0.js"></script>
	<script src="js/storeModal.js"></script>
	
</head>

<%@ include file="/Template/header.jsp"%> 
	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; margin-top: 100px; padding:20px 0 50px 0;">
		
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="main_container">
			<div class="store_profile">
				<div class="bannerBox">
					<div class="banner">
						<div class="banner_img_box">
							<img alt="칸다소바.jpg" src="칸다소바.jpg" class="banner_img">
						</div>
						
						<div class="banner_img_box">
							<img alt="음식1.jpg" src="음식1.jpg" class="banner_img">
						</div>
						
					</div>
				</div>					
				<div class="tit-point">
					<h1>칸다 소바</h1>
				</div>
				<div class="store_category">
					<p>일식 | 라멘</p>
				</div>
				<div class="store_score">
					<p>
						<strong style="font-size:18px; vertical-align:middle; padding-right:8px;">86점</strong>
						<span style="font-size: 13px; color: #66666e; margin-right: 5px;">
							87명의 평가 
							<strong style="font-weight: 600; color: #222228;">
								4.0점
							</strong>
						</span>
						<span class="material-symbols-outlined grade_icon">grade</span>
						<span class="material-symbols-outlined grade_icon">grade</span>
						<span class="material-symbols-outlined grade_icon">grade</span>
						<span class="material-symbols-outlined grade_icon">grade</span>
						<span class="material-symbols-outlined grade_icon">grade</span>
					</p>
				</div>
				<div class="profile_btnBox">
					<div class="profile_btn_sec" style="border-right: 2px solid #f0f0f0;">
						<a href="#" onclick="" class="profile_btn">
							<span class="material-symbols-outlined profile_btn_icon" class="profile_btn_icon">favorite</span>
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
							<p class="l-txt"><strong>화 ~ 목</strong></p>
							<p class="r-txt">영업시간: 11:30 - 21:30</p>
						</li>
						<li>
						  <p class="l-txt"> </p>
						  <p class="r-txt">브레이크타임: 15:30 - 17:00</p>
						</li>
              			<li>
  							<p class="l-txt"> </p>
  							<p class="r-txt">라스트오더: 21:00</p>
						</li>
					</ul>
					<hr class="hr">
					<ul class="list">
						<li>
							<p class="l-txt"><strong>금 ~ 일</strong></p>
							<p class="r-txt">영업시간: 11:30 - 21:30</p>
						</li>
						<li>
						  <p class="l-txt"> </p>
						  <p class="r-txt">브레이크타임: x </p>
						</li>
              			<li>
  							<p class="l-txt"> </p>
  							<p class="r-txt">라스트오더: 22:00</p>
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
							<li>
								<p class="l-txt Restaurant_MenuItem"><span class="Restaurant_Menu">츠케멘</span></p>
								<p class="r-txt Restaurant_MenuPrice">12,000원</p>
							</li>
							<li>
								<p class="l-txt Restaurant_MenuItem"><span class="Restaurant_Menu">이에케 돈코츠 라멘</span></p>
								<p class="r-txt Restaurant_MenuPrice">11,000원</p>
							</li>
							<li>
								<p class="l-txt Restaurant_MenuItem"><span class="Restaurant_Menu">마제소바</span></p>
								<p class="r-txt Restaurant_MenuPrice">10,000원</p>
							</li>
							<li>
								<p class="l-txt Restaurant_MenuItem"><span class="Restaurant_Menu">아부라소바</span></p>
								<p class="r-txt Restaurant_MenuPrice">10,000원</p>
							</li>
							<li>
								<p class="l-txt Restaurant_MenuItem"><span class="Restaurant_Menu">돼지껍데기 아부라소바</span></p>
								<p class="r-txt Restaurant_MenuPrice">12,500원</p>
							</li>
						</ul>
				</div>
				<div class="store_infoBOX">
					<p class="tit">식당 설명</p>
					<div>
						<pre>
[칸다소바 소개]

장어덮밥 전문점 '해목' 을 운영중인 셰프가
일본 도쿄 라멘 대회 우승 경력의 라멘 전문점 '칸다 와이즈' 에서
직접 기술을 전수 받은 라멘 전문점입니다.

라멘의 3요소인 면, 육수, 타래를
각각의 메뉴에 조화롭도록 수작업으로
제작하여 사용합니다.
						</pre>
					</div>	
				</div>				
				<!-- 테이블 -->
				<div class="tableBox">
					<p class="tit">테이블 예약</p>
					<ul class="list">
						<li>
							<div class="table_">
								<div class="table_img"></div>
								<div class="table_info" >
									<div class="table_name_box">
										<p class="table_name">A1</p>
										<a style="text-align: right; font-size: 15px; line-height: 100%">상세 보기 ></a>
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
											<button class="btn btn-outline-warning modalOpen" style="margin-top:80%">예약하기</button>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="table_">
								<div class="table_info" >
									<div class="table_name_box">
										<p class="table_name">A2</p>
										<a style="text-align: right; font-size: 15px; line-height: 100%">상세 보기 ></a>
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
	     <form action="menuChoice.jsp" method="post">
		     <div>
		     	<h5>인원</h5>
		     	<div>
		     		<span>-</span>
		     		<span>1</span>
		     		<span>+</span>
		     	</div>
		     	<hr>
		     	<h5>날짜</h5>
		     	<input class="form-control" type="date" id="date">
		     	<hr>
				<h5>시간</h5>
				<div style="display: flex; flex-direction: rows;">
					<div class="time" style="border:2px solid black; width: 90px; height: 40px; font-size: 25px; font-weight: 300;bold; text-align: center; margin-right: 5px;">
						13:00
						<input type="radio" class="selectTime" name="time" value="13" style="display: none;">
					</div>
					<div class="time" style="border:2px solid black; width: 90px; height: 40px; font-size: 25px; font-weight: 300;bold; text-align: center; margin-right: 5px;">
						14:00
						<input type="radio" class="selectTime" name="time" value="13" style="display: none;">
					</div>
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