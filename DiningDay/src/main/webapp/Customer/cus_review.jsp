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
</head>

	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; margin-top: 100px; padding:20px 0 50px 0;">
		
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="main_container">
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