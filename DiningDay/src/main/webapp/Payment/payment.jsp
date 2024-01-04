<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/Template/header.jsp"%> 
<html>
<head>
	<c:set var="customerInfo" value="${requestScope.customerInfo}"/>
	<c:set var="reservationDTO" value="${requestScope.reservationDTO}"/>
	<c:set var="storeInfo" value="${requestScope.storeInfo}"/>
	
    <meta charset="utf-8">
    <title>${storeInfo.STORE_NAME} - 메뉴 선택</title>
    <link href="Payment/css/payment.css" rel="stylesheet" >
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    
    <script src="Payment/js/reservation.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="Payment/js/payment.js"></script>
</head>
	
	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 100px; padding:20px 0 50px 0; ">
		
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="main_container">
			<div class="paddingBox">
				<p id="storeName" class="tit" style="margin: 0;">${storeInfo.STORE_NAME}</p>
				<!-- 예약자 정보 -->
				<div class="cusBox">	
					<p class="tit">예약자 정보</p>
					<div class="cus_infoBox">
						<label for="cus_name">예약자 이름</label>
						<input class="form-control" type="text" id="cus_name" name="cus_name" value="${customerInfo.CUS_NAME}">
					</div>
					
					<div class="cus_infoBox">
						<label for="cus_phone">휴대폰 번호</label>
						<input class="form-control" type="text" id="cus_phone" name="cus_phone" value="${customerInfo.CUS_TEL}">
					</div>
					
					<div class="cus_infoBox">
						<label for="cus_phone">이메일</label>
						<input class="form-control" type="text" id="cus_email" name="cus_email" value="${customerInfo.CUS_EMAIL}">
					</div>
					
					<div class="cus_infoBox">
						<label for="cus_plus">요청 사항</label>
						<textarea class="form-control" id="cus_plus" name="cus_plus" ></textarea>
					</div>
					<div class="checkBtnBox">
						<button class="btn fw-bold text-light decideCusBtn" style="background:#9CED92;">확정</button>
						<input type="checkbox" id="cusCheck" style="display: none;">
					</div>
				</div>
				
				<!-- 좌석 정보 -->
				<div class="tableBox">	
					<p class="tit">좌석 정보</p>
					<div class="table_infoBox">
						<label for="table_name">좌석명</label>
						<span id="table_name" style="text-align: left">A1</span>
					</div>
					<div class="table_infoBox">
						<label for="table_people">인원수</label>
						<div style="display: flex; flex-direction: row;">
							<span id="table_people">${reservationDTO.people}</span>
						</div>
					</div>
					<div class="table_infoBox">
						<label for="table_date">날짜</label>
						<div id="table_date" class="form-control" style="width: 30%; text-align: left; font-size: 20px;">${reservationDTO.date}</div>
					</div>
					<div class="table_infoBox">
						<label for="table_time">시간</label>
						<span id="table_time" style="text-align: left">${reservationDTO.time}</span>
					</div>
					<div class="checkBtnBox">
						<button class="btn fw-bold text-light decideTableBtn" style="background: #9CED92;">확정</button>
						<input type="checkbox" id="tableCheck" style="display: none;">
					</div>
				</div>				
				
				<!-- 메뉴판 -->
				<div class="menuBox">	
					<p class="tit">메뉴 선택</p>
					<ul class="list">
						<li>
							<div class="menu defaultBtn">
								<div class="menu_info">
									<div class="menu_name_box">
										<p class="menu_name">현장에서 선택 하기</p>
										<p class="menu_price">기본 예약금 10,000 원</p>
									</div>
								</div>
							</div>
						</li>
						<c:forEach var="menuInfo" items="${requestScope.menuInfoList}">
						<c:if test="${menuInfo.MENU_HIDE == 1}">
						<li>
							<div class="menu menuPlusBtn">
								<div class="menu_info" name="${menuInfo.MENU_NO}">
									<div class="menu_name_box">
										<p class="menu_name">${menuInfo.MENU_NAME}</p>
										<p class="menu_price"> ${menuInfo.MENU_PRICE} 원</p>
									</div>
									<div class="menu_choice">
										<div style="text-align: left;">
											<p style="padding-left: 10px; margin: 0; font-size: 15px">
												${menuInfo.MENU_INFO}
											</p>
										</div>
									</div>
								</div>
							</div>
						</li>
						
						</c:if>
						</c:forEach>
						
						<!-- 사진있는 버전 -->
<!-- 						<li> -->
<!-- 							<div class="menu menuPlusBtn"> -->
<!-- 								<img alt="츠케멘.jpg" src="Payment/츠케멘.jpg" class="menu_img"> -->
<%-- 								<div class="menu_info" name="${menuInfo.MENU_NO}"> --%>
<!-- 									<div class="menu_name_box"> -->
<%-- 										<p class="menu_name">${menuInfo.MENU_NAME}</p> --%>
<%-- 										<p class="menu_price"> ${menuInfo.MENU_PRICE} 원</p> --%>
<!-- 									</div> -->
<!-- 									<div class="menu_choice"> -->
<!-- 										<div style="text-align: left;"> -->
<!-- 											<p style="padding-left: 10px; margin: 0; font-size: 15px"> -->
<%-- 												${menuInfo.MENU_INFO} --%>
<!-- 											</p> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</li> -->
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
						</div>
						<div class="res_option">
							<span class="cart_sub_tit">좌석 정보</span>
							
						</div>
						<div class="choice_menu">
							<span class="cart_sub_tit">메 뉴</span>
							<ul>
								<li class="choice_list defaultMenu">
									<div style="display: flex; justify-content: space-around;">
										<span>기본 예약금</span>
										<span>10,000 원</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="price_result_box">
							<div>
								<span>합 계</span>
								<span class="price_result">100 원</span>								
							</div>
						</div>
						<div class="btn_box">
							<input id="paymentBtn" class="btn fw-bold text-light" style="background:#9CED92; " type="button" value="결제">
						</div>
					</div>
				</div>	
			</div>	
		</div>
		<div style="width:16%;"></div>
	</main>
<%@ include file="/Template/footer.jsp"%>
</html> 