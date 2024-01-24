<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<%@ include file="/Template/header.jsp"%> 
<html>
<head>
    <meta charset="utf-8">
    <title>Dining Day - ${storeInfo.STORE_NAME}</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    <link href="Review_Report/css/store_review.css" rel="stylesheet" >
    <script src="Review_Report/js/store_review.js"></script>
    <script>
		var cus_no = "${sessionScope.CUS_NO}";
	</script>
</head>
	<c:set var="storeReviewList" value="${requestScope.storeReviewList}" />
	<c:set var="storeInfo" value="${requestScope.storeInfo}"/>

	
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
						<strong style="font-size:18px; vertical-align:middle; padding-right:8px;">${storeInfo.REV_SCORE}점</strong>
						<span style="font-size: 13px; color: #66666e; margin-right: 5px;">
							${storeInfo.REVIEW_COUNT}명의 평가
						</span>
						<span class="gradeGroup">
						<c:forEach begin="1" end="${fn:split(storeInfo.REV_SCORE, '.')[0]}">
							<span class="material-icons grade_icon" style="color: #F7CE3E;">grade</span>
						</c:forEach>
						<c:if test="${fn:split(storeInfo.REV_SCORE, '.')[1] >= 5}">
							<span class="material-icons grade_icon" style="color: #F7CE3E;">star_half</span>
						</c:if>
						<c:if test="${fn:split(storeInfo.REV_SCORE, '.')[1] < 5}">
							<span class="material-symbols-outlined grade_icon" style="color: #F7CE3E;">grade</span>
						</c:if>
						<c:if test="${5 - storeInfo.REV_SCORE > 0.5}">
						<c:forEach begin="1" end="${fn:split(5 - storeInfo.REV_SCORE, '.')[0]}">
							<span class="material-symbols-outlined grade_icon" style="color: #F7CE3E;">grade</span>
						</c:forEach>
						</c:if>
						</span>
					</p>
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
						<a href="#" id="storeBtn" class="profile_btn">
							<span class="material-symbols-outlined profile_btn_icon" class="profile_btn_icon">storefront</span>
							<span class="profile_btn_text">정 보</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<p class="gap20"></p>
		<div class="main_container">
			<div class="store_reivew">
				<div class="store_reivew_info">
					<div class="store_score_box">
						<h1 class="tit">${storeInfo.REV_SCORE}</h1>
						<c:forEach begin="1" end="${fn:split(storeInfo.REV_SCORE, '.')[0]}">
							<span class="material-icons grade_icon" style="color: #F7CE3E;">grade</span>
						</c:forEach>
						<c:if test="${fn:split(storeInfo.REV_SCORE, '.')[1] >= 5}">
							<span class="material-icons grade_icon" style="color: #F7CE3E;">star_half</span>
						</c:if>
						<c:if test="${fn:split(storeInfo.REV_SCORE, '.')[1] < 5 and fn:split(storeInfo.REV_SCORE, '.')[1] != 0}">
							<span class="material-symbols-outlined grade_icon" style="color: #F7CE3E;">grade</span>
						</c:if>
						<c:if test="${5 - storeInfo.REV_SCORE > 0.5}">
						<c:forEach begin="1" end="${fn:split(5 - storeInfo.REV_SCORE, '.')[0]}">
							<span class="material-symbols-outlined grade_icon" style="color: #F7CE3E;">grade</span>
						</c:forEach>
						</c:if>
					</div>
					<div class="store_review_count_box">
						<span>리뷰 ${storeInfo.REVIEW_COUNT}개 / 사장님 답글 ${storeInfo.REVIEW_ANSWER_COUNT}개</span>
					</div>
				</div>
			</div>
			<div class="review_box">
	
				<!-- 리뷰 시작 -->
				<c:forEach var="storeReview" items="${storeReviewList}" >
					<div class="review" id="${storeReview.REV_NO}">
						<div class="reviewWriter_box">
							<span class="cus_nick">${storeReview.CUS_NICK}</span>
							<span class="review_date">${storeReview.REV_DATE}</span>
						</div>
						<div class="review_score_box">
							<c:forEach begin="1" end="${storeReview.REV_SCORE}">
								<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
							</c:forEach>
							
							<c:forEach begin="1" end="${5 - storeReview.REV_SCORE}">
								<span class="material-symbols-outlined review_grade_icon" style="color: #F7CE3E;">grade</span>
							</c:forEach>
							<span class="review_grade">${storeReview.REV_SCORE}</span>
						</div>
						<c:if test="${storeReview.REV_IMAGE != '0'}">
						<div class="review_image_box">
							<div class="review_image">
								<img src="upload/${storeReview.REV_IMAGE}" alt="${storeReview.REV_IMAGE}" style="width:100%; height:100%"/>
							</div>
						</div>
						</c:if>
						<div class="flexBox">
							<div class="reservation_info_box">
								<span>좌석: ${storeReview.SEAT_NAME}</span>
								<span>메뉴: ${storeReview.MENU_NAME}</span>
							</div>
							<span class="goodBtn">
								<span style="font-size:15px;" class="material-symbols-outlined">thumb_up</span>
								<span style="font-size:13px; margin: 0 3px;">공감</span>
								<span style="font-size:13px;">(${storeReview.REVIEW_LIKE_COUNT})</span>
							</span>
						</div>
						<div class="review_content">
							<span>${storeReview.REV_CONTENT}</span>
						</div>
						<c:if test="${storeReview.ANSWER_CONTENT != '0'}">
						<div class="review_answer_box">
							<div class="review_answer_info">
								<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span>
								<span class="owner">사장님</span>
								<span class="review_answer_date">${storeReview.ANSWER_DATE}</span>
							</div>
							<div class="review_answer_content">
								<span style="text-align: left;">${storeReview.ANSWER_CONTENT}</span>
							</div>
						</div>
						</c:if>
					</div>
				</c:forEach>
				<!-- 리뷰 끝 -->
			</div>
		</div>
	</main>
<%@ include file="/Template/footer.jsp"%>
</html> 