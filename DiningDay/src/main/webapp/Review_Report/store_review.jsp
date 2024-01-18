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
</head>

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
			<div class="store_reivew">
				<div class="store_reivew_info">
					<div class="store_score_box">
						<h1 class="tit">5.0</h1>
						<span class="material-icons grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons grade_icon" style="color: #F7CE3E;">grade</span>
					</div>
					<div class="store_review_count_box">
						<span>리뷰 1000개 / 사장님 답글 890개</span>
					</div>
				</div>
			</div>
			<div class="review_box">
			
				<div class="review">
					<div class="reviewWriter_box">
						<span class="cus_nick">유저 닉네임</span>
						<span class="review_date">리뷰 날짜</span>
					</div>
					<div class="review_score_box">
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="review_grade">5.0</span>
					</div>
					<div class="reivew_image_box">
						<div class="review_image">
							사진영역
						</div>
					</div>
					<div class="flexBox">
						<div class="reservation_info_box">
							<span>좌석: A1</span>
							<span>메뉴: 메뉴 이름/1</span>
						</div>
						<span class="likeBtn">
							<span style="font-size:15px;" class="material-symbols-outlined">thumb_up</span>
							<span style="font-size:13px; margin: 0 3px;">공감</span>
							<span style="font-size:13px;">(100)</span>
						</span>
					</div>
					<div class="review_content">
						<span>맛있어요~</span>
					</div>
					<div class="review_answer_box">
						<div class="review_answer_info">
							<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span>
							<span class="owner">사장님</span>
							<span class="review_answer_date">답글 날짜</span>
						</div>
						<div class="review_answer_content">
							<span>(고객 닉네임)님, 별점 5점 감사드립니다^^*</span>
						</div>
					</div>
				</div>
				
				<div class="review">
					<div class="reviewWriter_box">
						<span class="cus_nick">유저 닉네임</span>
						<span class="review_date">리뷰 날짜</span>
					</div>
					<div class="review_score_box">
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="review_grade">5.0</span>
					</div>
					<div class="reivew_image_box">
						<div class="review_image">
							사진영역
						</div>
					</div>
					<div class="flexBox">
						<div class="reservation_info_box">
							<span>좌석: A1</span>
							<span>메뉴: 메뉴 이름/1</span>
						</div>
						<span class="likeBtn like">
							<span style="font-size:15px;" class="material-icons">thumb_up</span>
							<span style="font-size:13px; margin: 0 3px;">공감</span>
							<span style="font-size:13px;">(100)</span>
						</span>
					</div>
					<div class="review_content">
						<span>맛있어요~</span>
					</div>
					<div class="review_answer_box">
						<div class="review_answer_info">
							<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span>
							<span class="owner">사장님</span>
							<span class="review_answer_date">답글 날짜</span>
						</div>
						<div class="review_answer_content">
							<span>(고객 닉네임)님, 별점 5점 감사드립니다^^*</span>
						</div>
					</div>
				</div>
				
				<div class="review">
					<div class="reviewWriter_box">
						<span class="cus_nick">유저 닉네임</span>
						<span class="review_date">리뷰 날짜</span>
					</div>
					<div class="review_score_box">
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="review_grade">5.0</span>
					</div>
					<div class="reivew_image_box">
						<div class="review_image">
							사진영역
						</div>
					</div>
					<div class="flexBox">
						<div class="reservation_info_box">
							<span>좌석: A1</span>
							<span>메뉴: 메뉴 이름/1</span>
						</div>
						<span class="likeBtn like">
							<span style="font-size:15px;" class="material-icons">thumb_up</span>
							<span style="font-size:13px; margin: 0 3px;">공감</span>
							<span style="font-size:13px;">(100)</span>
						</span>
					</div>
					<div class="review_content">
						<span>맛있어요~</span>
					</div>
					<div class="review_answer_box">
						<div class="review_answer_info">
							<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span>
							<span class="owner">사장님</span>
							<span class="review_answer_date">답글 날짜</span>
						</div>
						<div class="review_answer_content">
							<span>(고객 닉네임)님, 별점 5점 감사드립니다^^*</span>
						</div>
					</div>
				</div>
				
				<div class="review">
					<div class="reviewWriter_box">
						<span class="cus_nick">유저 닉네임</span>
						<span class="review_date">리뷰 날짜</span>
					</div>
					<div class="review_score_box">
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
						<span class="review_grade">5.0</span>
					</div>
					<div class="reivew_image_box">
						<div class="review_image">
							사진영역
						</div>
					</div>
					<div class="flexBox">
						<div class="reservation_info_box">
							<span>좌석: A1</span>
							<span>메뉴: 메뉴 이름/1</span>
						</div>
						<span class="likeBtn like">
							<span style="font-size:15px;" class="material-icons">thumb_up</span>
							<span style="font-size:13px; margin: 0 3px;">공감</span>
							<span style="font-size:13px;">(100)</span>
						</span>
					</div>
					<div class="review_content">
						<span>맛있어요~</span>
					</div>
				</div>
			</div>
			
			
		</div>
	</main>
<%@ include file="/Template/footer.jsp"%>
</html> 