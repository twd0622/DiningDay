<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/Template/header.jsp"%> 
<html>
<head>
    <meta charset="utf-8">
    <!-- 식당 이름 넣어주기 -->
    <title>식당이름 / 메뉴 선택</title>
    <link href="css/payment.css" rel="stylesheet" >
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    
    <script src="js/menuChoice.js"></script>
    <script src="js/jquery-3.6.0.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="js/payment.js"></script>
</head>

	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 100px; padding:20px 0 50px 0; ">
		
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="main_container">
			<div class="paddingBox">
				
				<!-- 예약자 정보 -->
				<div class="cusBox">	
					<p class="tit">예약자 정보</p>
					<div class="cus_infoBox">
						<label for="cus_name">예약자 이름</label>
						<input class="form-control" type="text" name="cus_name">
					</div>
					
					<div class="cus_infoBox">
						<label for="cus_phone">휴대폰 번호</label>
						<input class="form-control" type="text" name="cus_phone">
					</div>
					<div class="checkBtnBox">
						<button class="btn fw-bold text-light" style="background:#9CED92;">확정</button>
					</div>
				</div>
				
				<!-- 좌석 정보 -->
				<div class="tableBox">	
					<p class="tit">좌석 정보</p>
					<div class="table_infoBox">
						<label for="table_name">좌석명</label>
						<span style="text-align: left">A1</span>
					</div>
					<div class="table_infoBox">
						<label for="table_people">인원수</label>
						<div style="display: flex; flex-direction: row;">
							<span>-</span>
							<span>3</span>
							<span>+</span>
						</div>
					</div>
					<div class="table_infoBox">
						<label for="table_date">날짜</label>
						<input class="form-control" type="date" name="table_date">
					</div>
					<div class="table_infoBox">
						<label for="table_time">시간</label>
						<span style="text-align: left">13:00</span>
					</div>
					<div class="checkBtnBox">
						<button class="btn fw-bold text-light" style="background: #9CED92;">확정</button>
					</div>
				</div>				
				
				<!-- 메뉴판 -->
				<div class="menuBox">	
					<p class="tit">메뉴 선택</p>
					<ul class="list">
						<li>
							<div class="menu">
								<div class="menu_info">
									<div class="menu_name_box">
										<p class="menu_name">현장에서 선택 하기</p>
										<p class="menu_price">기본 예약금 10,000 원</p>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="menu">
								<img alt="츠케멘.jpg" src="츠케멘.jpg" class="menu_img">
								<div class="menu_info" >
									<div class="menu_name_box">
										<p class="menu_name">츠케멘</p>
										<p class="menu_price"> 12,000 원</p>
									</div>
									<div class="menu_choice">
										<div style="text-align: left;">
											<p style="padding-left: 10px; margin: 0; font-size: 15px">
												츠케멘은 츠케루(붙히다, 달다) 라는 뜻에서 붙여진 일본식 면에 육수를 찍어 먹는 라멘입니다
											</p>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="menu">
								<div class="menu_info" >
									<div class="menu_name_box">
										<p class="menu_name">마제소바 </p>
										<p class="menu_price"> 12,000 원</p>
									</div>
									<div class="menu_choice">
										<div style="text-align: left;">
											<p style="padding-left: 10px; margin:0; font-size: 15px">
												국물없는 면에 고기, 채소, 계란 등 다양한 고명과 소스를 비벼 먹는 라멘입니다
											</p>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
				
				<!-- 예약표 -->
				<div class="cartBox">
					<div class="cart">
						<div class="cart_tit">
							<p style="margin:0; font-size: 25px;">예 약 표</p>
						</div>
						<div class="cus_option">
							<span class="cart_sub_tit">예약자 정보</span>
							<div>
								<span>예약자 이름</span>
								<span>홍길동</span>
							</div>
							<div>
								<span>휴대폰 번호</span>
								<span>010-1111-1111</span>
							</div>
						</div>
						<div class="res_option">
							<span class="cart_sub_tit">좌석 정보</span>
							<div>
								<span>좌석명</span>
								<span>A1</span>
							</div>
							<div>
								<span>인원수</span>
								<span>3</span>
							</div>
							<div>
								<span>날짜</span>
								<span>23-12-19</span>
							</div>
							<div>
								<span>시간</span>
								<span>13:00</span>
							</div>
						</div>
						<div class="choice_menu">
							<span class="cart_sub_tit">메 뉴</span>
							<ul>
								<li class="choice_list">
									<div style="display: flex; justify-content: space-around;">
										<span>기본 예약금</span>
										<span>10,000 원</span>
									</div>
								</li>
								<li class="choice_list cart_menu">
									<div style="width: 80%;">
										<div>
											<span>마제소바 </span>
											<span>12,000 원</span>
										</div>
										<div class="count_box">
											<span>-</span>
											<span>1</span>
											<span>+</span>
										</div>
									</div>
									<span class="material-symbols-outlined" style="font-size: 18px;">delete</span>
								</li>
								<li class="choice_list cart_menu">
									<div style="width: 80%;">
										<div>
											<span>츠케멘 </span>
											<span>12,000 원</span>
										</div>
										<div class="count_box">
											<span>-</span>
											<span>1</span>
											<span>+</span>
										</div>
									</div>
									<span class="material-symbols-outlined" style="font-size: 18px;">delete</span>
								</li>
							</ul>
						</div>
						<div class="price_result">
							<div>
								<span>합 계</span>
								<span class="price">34,000 원</span>								
							</div>
						</div>
						<div class="btn_box">
							<input class="btn fw-bold text-light" style="background:#9CED92; " type="submit" onclick="requestPay()" value="결제">
						</div>
					</div>
				</div>	
			</div>	
		</div>
		<div style="width:16%;"></div>
	</main>
<%@ include file="/Template/footer.jsp"%>
</html> 