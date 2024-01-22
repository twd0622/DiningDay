<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<%@ include file="/Template/header.jsp"%> 
<html>
<head>
    <meta charset="utf-8">
    <title>(고객 닉네임) 리뷰</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    <link href="Review_Report/css/store_review.css" rel="stylesheet" >
    
    <script src="Customer/js/cus_review.js"></script> 
</head>

	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; margin-top: 100px; padding:20px 0 50px 0;">
	<c:set var="reviewList" value="${requestScope.reviewList}" />		
		
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="main_container">
			<div class="review_box">
				
				<c:forEach var="review" items="${reviewList}" >
					<div class="review" id="${review.REV_NO}">
						<div class="reviewWriter_box_cus_review_ver">
							<div>
								<span class="cus_nick">${review.CUS_NICK}</span>
								<span class="review_date">${review.REV_DATE}</span>
							</div>
							<div>
								<span class="goStore ${review.STORE_NO}">식당 바로가기>></span>
							</div>
						</div>
						<div class="review_score_box">
							<c:forEach begin="1" end="${review.REV_SCORE}">
								<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>
							</c:forEach>
							<c:forEach begin="1" end="${5- review.REV_SCORE}">
								<span class="material-symbols-outlined review_grade_icon" style="color: #F7CE3E;">grade</span>
							</c:forEach>
							<span class="review_grade">${review.REV_SCORE}</span>
						</div>
						<c:if test="${review.REV_IMAGE != '0'}">
						<div class="review_image_box">
							<div class="review_image">
								<img src="upload/${review.REV_IMAGE}" alt="${review.REV_IMAGE}" style="width:100%; height:100%"/>
							</div>
						</div>
						</c:if>
						<div class="flexBox">
							<div class="reservation_info_box">
								<span>좌석: ${review.SEAT_NAME}</span>
								<span>메뉴: ${review.MENU_NAME}</span>
							</div>
							<span class="goodBtn">
								<span style="font-size:15px;" class="material-symbols-outlined">thumb_up</span>
								<span style="font-size:13px; margin: 0 3px;">공감</span>
								<span style="font-size:13px;">(100)</span>
							</span>
						</div>
						<div class="review_content">
							<span>${review.REV_CONTENT}</span>
						</div>
						<c:if test="${review.ANSWER_CONTENT != '0'}">
						<div class="review_answer_box">
							<div class="review_answer_info">
								<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span>
								<span class="owner">사장님</span>
								<span class="review_answer_date">${review.ANSWER_DATE}</span>
							</div>
							<div class="review_answer_content">
								<span>${review.ANSWER_CONTENT}</span>
							</div>
						</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	</main>
<%@ include file="/Template/footer.jsp"%>
</html> 