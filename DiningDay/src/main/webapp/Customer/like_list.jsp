<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- 회원 아이디로 제목 설정 -->
    <title>{회원 아이디} 찜 목록</title> 
    
    <link href="css/like_list.css" rel="stylesheet">
</head>

<%@ include file="/Template/header.jsp"%> 
	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 100px; padding:20px 0 50px 0; ">
		
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="main_container rounded">
			<div class="titBox">
				<p class="tit">찜 목록</p>
			</div>
			<div class="store_listBox">
				<!-- 리뷰 리스트 -->
				<div class="storeBox">
					<div class="store_img">
						<img alt="칸다소바.jpg" src="칸다소바.jpg" style="width: 100%; height: 100%; border-radius: 10px;">					
					</div>
					<div class="colBox">
						<div class="sotre_name">
							<p style="margin: 0;">칸다소바</p>
							<a style="font-size: 13px; line-height: 140%;">상세보기></a>
						</div>
						<div class="store_info">
							<div class="store_review_score">
								<span class="store_info_text">평점</span>
								<span class="store_info_text">3.8</span>
								<span class="store_info_text">⭐⭐⭐⭐</span>
							</div>
							<div class="store_like">
								<span class="store_info_text">찜❤️</span>
								<span class="store_info_text">30</span>
							</div>
							<div class="price">
								<span class="store_info_text">기본 예약금</span>
								<span class="store_info_text">10,000 원</span>
							</div>
						</div>
					</div>
				</div>
				<!-- 리뷰 리스트 -->
				<div class="storeBox">
					<div class="store_img">
						<img alt="칸다소바.jpg" src="칸다소바.jpg" style="width: 100%; height: 100%; border-radius: 10px;">					
					</div>
					<div class="colBox">
						<div class="sotre_name">
							<p style="margin: 0;">칸다소바</p>
							<a style="font-size: 13px; line-height: 140%;">상세보기></a>
						</div>
						<div class="store_info">
							<div class="store_review_score">
								<span class="store_info_text">평점</span>
								<span class="store_info_text">3.8</span>
								<span class="store_info_text">⭐⭐⭐⭐</span>
							</div>
							<div class="store_like">
								<span class="store_info_text">찜❤️</span>
								<span class="store_info_text">30</span>
							</div>
							<div class="price">
								<span class="store_info_text">기본 예약금</span>
								<span class="store_info_text">10,000 원</span>
							</div>
						</div>
					</div>
				</div>
				<!-- 리뷰 리스트 -->
				<div class="storeBox">
					<div class="store_img">
						<img alt="칸다소바.jpg" src="칸다소바.jpg" style="width: 100%; height: 100%; border-radius: 10px;">					
					</div>
					<div class="colBox">
						<div class="sotre_name">
							<p style="margin: 0;">칸다소바</p>
							<a style="font-size: 13px; line-height: 140%;">상세보기></a>
						</div>
						<div class="store_info">
							<div class="store_review_score">
								<span class="store_info_text">평점</span>
								<span class="store_info_text">3.8</span>
								<span class="store_info_text">⭐⭐⭐⭐</span>
							</div>
							<div class="store_like">
								<span class="store_info_text">찜❤️</span>
								<span class="store_info_text">30</span>
							</div>
							<div class="price">
								<span class="store_info_text">기본 예약금</span>
								<span class="store_info_text">10,000 원</span>
							</div>
						</div>
					</div>
				</div>
			</div>
				
		</div>
		
	</main>
<%@ include file="/Template/footer.jsp"%>
</html> 