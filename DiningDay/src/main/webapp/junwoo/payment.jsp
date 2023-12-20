<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- 식당 이름 넣어주기 -->
    <title>식당이름 / 메뉴 선택</title>
    <link href="css/menuChoice.css" rel="stylesheet" >
</head>

<%@ include file="/Template/header.jsp"%> 
	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 68.5px; padding:20px 0 50px 0; ">
		
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="main_container">
			<div class="paddingBox">
				
				<!-- 메뉴판 -->
				<div class="menuBox">	
					<p class="tit">예약 확인 및 결제</p>
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
								<div class="menu_img"></div>
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
						<div class="choice_menu">
							<span class="cart_sub_tit">메 뉴</span>
							<ul>
								<li class="choice_list">
									<div>
										<span>기본 예약금</span>
										<span>10,000 원</span>
									</div>
								</li>
								<li class="choice_list">
									<div>
										<span>마제소바 </span>
										<span>12,000 원</span>
									</div>
									<div class="count_box">
										<span>-</span>
										<span>1</span>
										<span>+</span>
									</div>
								</li>
								<li class="choice_list">
									<div>
										<span>츠케멘</span>
										<span>12,000 원</span>
									</div>
									<div class="count_box">
										<span>-</span>
										<span>1</span>
										<span>+</span>
									</div>
								</li>
							</ul>
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
						<div class="price_result">
							<div>
								<span>합 계</span>
								<span class="price">34,000 원</span>								
							</div>
						</div>
						<div class="btn_box">
							<input class="btn btn-warning fw-bold text-light" type="submit" value="예약하기">
						</div>
					</div>
				</div>	
			</div>	
		</div>
		<div style="width:20%;"></div>
	</main>
<%@ include file="/Template/footer.jsp"%>
</html> 