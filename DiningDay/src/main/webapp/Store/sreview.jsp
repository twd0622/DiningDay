<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/Template/store_sidebar_open.jsp"%>
<head>
	<meta charset="utf-8">
	<title>전체리뷰목록 | 다이닝데이</title>

	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    <link href="Review_Report/css/store_review.css" rel="stylesheet" >
    
    <script src="Store/js/sreview.js"></script> 
</head>

<!-- main은 속성 값은 왠만하면 건들지x -->
<main style="display: flex; align-items: center; text-align: center; justify-content: center; padding: 60px;">
	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="main_container">
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
					<div class="flexBox">
						<div>
							<select class="select">
								<option value="0">전체</option>
								<option value="1">답글 작성</option>
								<option value="2">답글 미작성</option>
							</select>
						</div>
						<div class="store_review_count_box">
							<span>리뷰 1000개 / 사장님 답글 890개</span>
						</div>
					</div>
				</div>
			</div>
			<div class="review_box">
			
<!-- 				<div class="review"> -->
<!-- 					<div class="flexBox"> -->
<!-- 						<div class="reviewWriter_box"> -->
<!-- 							<span class="cus_nick">유저 닉네임</span> -->
<!-- 							<span class="review_date">리뷰 날짜</span> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<span class="reviewReportBtn">신고</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="review_score_box"> -->
<!-- 						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span> -->
<!-- 						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span> -->
<!-- 						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span> -->
<!-- 						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span> -->
<!-- 						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span> -->
<!-- 						<span class="review_grade">5.0</span> -->
<!-- 					</div> -->
<!-- 					<div class="reivew_image_box"> -->
<!-- 						<div class="review_image"> -->
<!-- 							사진영역 -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="flexBox"> -->
<!-- 						<div class="reservation_info_box"> -->
<!-- 							<span>좌석: A1</span> -->
<!-- 							<span>메뉴: 메뉴 이름/1</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="review_content"> -->
<!-- 						<span>맛있어요~</span> -->
<!-- 					</div> -->
<!-- 					<div class="review_answer_box"> -->
<!-- 						<div class="flexBox"> -->
<!-- 							<div class="review_answer_info"> -->
<!-- 								<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span> -->
<!-- 								<span class="owner">사장님</span> -->
<!-- 								<span class="review_answer_date">답글 날짜</span> -->
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<span class="updateBtn">수정</span> -->
<!-- 							</div>						 -->
<!-- 						</div> -->
<!-- 						<div class="review_answer_content"> -->
<!-- 							<span>(고객 닉네임)님, 별점 5점 감사드립니다^^*</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 				<div class="review"> -->
<!-- 					<div class="reviewWriter_box"> -->
<!-- 						<span class="cus_nick">유저 닉네임</span> -->
<!-- 						<span class="review_date">리뷰 날짜</span> -->
<!-- 					</div> -->
<!-- 					<div class="review_score_box"> -->
<!-- 						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span> -->
<!-- 						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span> -->
<!-- 						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span> -->
<!-- 						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span> -->
<!-- 						<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span> -->
<!-- 						<span class="review_grade">5.0</span> -->
<!-- 					</div> -->
<!-- 					<div class="reivew_image_box"> -->
<!-- 						<div class="review_image"> -->
<!-- 							사진영역 -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="flexBox"> -->
<!-- 						<div class="reservation_info_box"> -->
<!-- 							<span>좌석: A1</span> -->
<!-- 							<span>메뉴: 메뉴 이름/1</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="review_content"> -->
<!-- 						<span>맛있어요~</span> -->
<!-- 					</div> -->
<!-- 					<div class="review_answer_box"> -->
<!-- 						<div class="review_answer_info"> -->
<!-- 							<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span> -->
<!-- 							<span class="owner">사장님</span> -->
<!-- 						</div> -->
<!-- 						<div class="answer_write_box"> -->
<!-- 							<textarea class="form-control answer_write"></textarea> -->
<!-- 							<button class="btn">작성</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				
				
				
			</div>
			
		</div>
	</div>

</main>
<%@ include file="/Template/store_sidevar_close.jsp"%>
</html>
