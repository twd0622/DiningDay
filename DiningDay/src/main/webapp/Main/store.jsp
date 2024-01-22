<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
	<link href="Main/css/store.css" rel="stylesheet" >
	<link href="Main/css/storeModal.css" rel="stylesheet">
	<script src="Main/js/storeModal.js"></script>
	<script src="Main/js/changeOption.js"></script>
	<script src="Main/js/store.js"></script>
	
</head>
	<script>
		var cus_no = "${sessionScope.CUS_NO}";
	</script>
	
	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; margin-top: 100px; padding:20px 0 50px 0;">
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="main_container">
			<div class="store_profile" id="${storeInfo.STORE_NO}">
				<div class="bannerBox">
					<div class="banner">
						<div class="banner_img_box">
							<img alt="${storeInfo.BA1}" src="upload/${storeInfo.BA1}" class="banner_img">
						</div>
						
						<div class="banner_img_box">
							<img alt="${storeInfo.BA2}" src="upload/${storeInfo.BA2}" class="banner_img">
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
					<p style="margin: 0;">
						<strong style="font-size:18px; vertical-align:middle; padding-right:8px;">${storeInfo.STORE_SCORE}점</strong>
						<span style="font-size: 13px; color: #66666e; margin-right: 5px;">
							${storeInfo.STORE_REVIEW_COUNT}명의 평가
							<strong style="font-weight: 600; color: #222228;">
								${storeInfo.STORE_SCORE}점
							</strong>
						</span>
						<span class="gradeGroup">
						<c:forEach begin="1" end="${fn:split(storeInfo.STORE_SCORE, '.')[0]}">
							<span class="material-icons grade_icon" style="color: #F7CE3E;">grade</span>
						</c:forEach>
						<c:if test="${fn:split(storeInfo.STORE_SCORE, '.')[1] >= 5}">
							<span class="material-icons grade_icon" style="color: #F7CE3E;">star_half</span>
						</c:if>
						<c:if test="${fn:split(storeInfo.STORE_SCORE, '.')[1] < 5}">
							<span class="material-symbols-outlined grade_icon" style="color: #F7CE3E;">grade</span>
						</c:if>
						<c:if test="${5 - storeInfo.STORE_SCORE > 0.5}">
						<c:forEach begin="1" end="${fn:split(5 - storeInfo.STORE_SCORE, '.')[0]}">
							<span class="material-symbols-outlined grade_icon" style="color: #F7CE3E;">grade</span>
						</c:forEach>
						</c:if>
						</span>
					</p>
					<a id="repoertBtn"> 신고하기 </a>
				</div>
				<div class="profile_btnBox">
					<div class="profile_btn_sec" style="border-right: 2px solid #f0f0f0;">
						<a id="like_btn" class="profile_btn">
							<span class="profile_btn_text like_count">${storeInfo.LIKE_COUNT}</span>
						</a>
					</div>
					<div class="profile_btn_sec" style="border-right: 2px solid #f0f0f0;">
						<a href="https://map.naver.com/p/search/${storeInfo.STORE_NAME}"  target='_blank' class="profile_btn">
							<span class="material-symbols-outlined profile_btn_icon" class="profile_btn_icon">map</span>
							<span class="profile_btn_text">위 치</span>
						</a>
					</div>
					<div class="profile_btn_sec">
						<a href="#" id="reviewBtn" class="profile_btn">
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
				    <div id="BT" class="${storeInfo.STORE_BTS}~${storeInfo.STORE_BTE}" style="display:none;"></div>
					<ul class="list">
						<li>
							<p class="l-txt"> </p>
							<p class="r-txt">영업시간: ${storeInfo.STORE_ST} ~ ${storeInfo.STORE_ET}</p>
						</li>
				        <c:if test="${storeInfo.STORE_BTS != '00:00'}">
						  <li>
						    <p class="l-txt"> </p>
						    <p class="r-txt">브레이크타임: ${storeInfo.STORE_BTS} ~ ${storeInfo.STORE_BTE}</p>
						  </li>
				        </c:if>
              			<c:if test="${storeInfo.STORE_LO != '0'}">
              			<li>
  							<p class="l-txt"> </p>
  							<p class="r-txt">라스트오더: ${storeInfo.STORE_LO}</p>
						</li>
              			</c:if>
						<c:if test="${storeInfo.STORE_CLOSE != '0'}" >
						<li>
							<p class="l-txt"> </p>
							<p class="r-txt"><strong>정기 휴무:</strong> ${storeInfo.STORE_CLOSE}</p>
							<div id="close" class="${storeInfo.STORE_CLOSE}" style="display:none;"></div>
						</li>
						</c:if>
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
						<pre class="store_info">
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
								<c:if test="${!empty table.PHOTO_NAME and table.PHOTO_NAME != '0'}">
								<div class="table_img">
									<img alt="${table.PHOTO_NAME}" src="upload/${table.PHOTO_NAME}" class="menu_img">
								</div>
								</c:if>
								<div class="table_info" >
									<div class="table_name_box">
										<p class="table_name">${table.SEAT_NAME}</p>
									</div>
									<div class="table_res">
										<div style="width: 80%; height: 100%; line-height: 100%;">
											<ul>
												<li name="minPeople" class="${table.SEAT_MIN}">최소인원: ${table.SEAT_MIN}명</li>
												<li name="maxPeople" class="${table.SEAT_MAX}">최대인원: ${table.SEAT_MAX}명</li>
												<li>${table.SEAT_CONTENT}</li>
											</ul>
										</div>
										<div style="width: 20%;">
												<button class="btn modalOpen reservationModalBtn" style="margin-top:80%">예약하기</button>
										</div>
									</div>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>	
			</div>
		</div>
	</main>
	<div id="modalContainer" class="hidden">
	  <div id="modalContent">
	     <h4>예약</h4>
	     <form class="reservation" action="payment.pa" method="post">
	     	 <input type="hidden" name="store_no" value="${storeInfo.STORE_NO}">
		     <div>
		     	<input type="hidden" name="SEAT_NO" id="seat_no" value="">
		     	<input type="hidden" name="SEAT_NAME" value="">
		     	<h5 id="SEAT_NAME"></h5>
		     	<h5>인원</h5>
		     	<div>
		     		<input type="hidden" name="people" id="res_people_input" value="">
		     		<div class="form-control" id="res_people"></div>
		     	</div>
		     	<hr>
		     	<h5>날짜</h5>
		     	<input type="hidden" name="date" id="res_date_input" value="">
		     	<div class="form-control" id="res_date"></div>
		     	<hr>
				<h5>시간</h5>
				<div style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content: flex-start;">
					<c:forEach var="i" begin="0"  end="${storeInfo.TIEMDIFF}" step="${storeInfo.STORE_RT}">
						<div class="time able" style="width: 115px; height: 44px; text-align: center; margin-right: 20px; margin-top: 5px;">
							<input type="radio" class="selectTime" name="time" value="${storeInfo.STORE_RST + i}" style="display: none;">
							<span class="timeFont">${fn:substring(storeInfo.STORE_RST + i, 0, 2)}:${fn:substring(storeInfo.STORE_RST + i, 2, 4)}</span>						
						</div>
					</c:forEach>
				</div>
				<hr>
		     </div>
		     <div>
			     <input class="btn fw-bold text-light reservationBtn" type="submit" value="예약하기">
				 <button type="button" class="btn btn-dark fw-bold" id="modalCloseButton">닫기</button>
		     </div>
	     </form>
	  </div>
	</div>
	
	
<%@ include file="/Template/footer.jsp"%>
</html> 