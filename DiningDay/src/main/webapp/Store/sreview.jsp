<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<%@ include file="/Template/store_sidebar_open.jsp"%>
<head>
	<meta charset="utf-8">
	<title>전체리뷰목록 | 다이닝데이</title>

	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    <link href="Review_Report/css/store_review.css" rel="stylesheet" >
    <link href="Store/css/sreview_modal	.css" rel="stylesheet" >
    
    <script src="Store/js/sreview.js"></script> 
</head>

<c:set var="REVIEW_SCORE" value="${requestScope.REVIEW_SCORE}"/>
<c:set var="reviewInfo" value="${requestScope.reviewInfo}"/>

<!-- main은 속성 값은 왠만하면 건들지x -->
<main style="display: flex; align-items: center; text-align: center; justify-content: center; padding: 60px;">
	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="main_container">
		<div class="main_container">
			<div class="store_reivew">
				<div class="store_reivew_info">
					<div class="store_score_box">
						<h1 class="tit">${reviewInfo.REVIEW_SCORE}</h1>
						<c:forEach begin="1" end="${fn:split(reviewInfo.REVIEW_SCORE, '.')[0]}">
							<span class="material-icons grade_icon" style="color: #F7CE3E;">grade</span>
						</c:forEach>
						<c:if test="${fn:split(reviewInfo.REVIEW_SCORE, '.')[1] >= 5}">
							<span class="material-icons grade_icon" style="color: #F7CE3E;">star_half</span>
						</c:if>
						
						<c:if test="${fn:split(reviewInfo.REVIEW_SCORE, '.')[1] < 5 and fn:split(reviewInfo.REVIEW_SCORE, '.')[1] != 0}">
							<span class="material-symbols-outlined grade_icon" style="color: #F7CE3E;">grade</span>
						</c:if>
						<c:if test="${5 - reviewInfo.REVIEW_SCORE > 0.5}">
						<c:forEach begin="1" end="${fn:split(5 - reviewInfo.REVIEW_SCORE, '.')[0]}">
							<span class="material-symbols-outlined grade_icon" style="color: #F7CE3E;">grade</span>
						</c:forEach>
						</c:if>
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
							<span>리뷰 ${reviewInfo.REVIEW_COUNT}개 / 사장님 답글 ${reviewInfo.REVIEW_ANSWER_COUNT}개</span>
						</div>
					</div>
				</div>
			</div>
			<div class="review_box">
				<!-- 리뷰 내용 -->				
			</div>
			
		</div>
	</div>
	
	<div id="reportModalContainer" class="hidden">
	  <div id="modalContent">
	     <h4>신고 하기</h4>
	     <form class="reviewReportForm" action="" method="post">
	     <input id="rev_no" name="REV_NO" type="hidden" value="">
		 <div class="reportResonBox">
		 	 <span class="reportResonHead">신고 사유 (필수)</span>
			 <div class="reportReson">
			 	<input class="form-check-input" type="radio" name="RREP_CONTENT" value="주문과 관련 없는 리뷰(사진/내용)">
			 	<span class="ResonContent">주문과 관련 없는 리뷰(사진/내용)</span>
			 </div>
			 <div class="reportReson" >
			 	<input class="form-check-input" type="radio" name="RREP_CONTENT" value="욕설/비방">
			 	<span class="ResonContent">욕설/비방</span>
			 </div>
			 <div class="reportReson">
			 	<input class="form-check-input" type="radio" name="RREP_CONTENT" value="개인정보 유출 위험">
			 	<span class="ResonContent">개인정보 유출 위험</span>
			 </div>
			 <div class="reportReson">
			 	<input class="form-check-input" type="radio" name="RREP_CONTENT" value="음란/유해">
			 	<span class="ResonContent">음란/유해</span>
			 </div>
			 <div class="reportReson">
			 	<input class="form-check-input" type="radio" name="RREP_CONTENT" value="광고/홍보">
			 	<span class="ResonContent">광고/홍보</span>
			 </div>
			 <div class="reportReson">
			 	<input class="form-check-input" type="radio" name="RREP_CONTENT" value="저작권 불법도용 의심 (사진 등)">
			 	<span class="ResonContent">저작권 불법도용 의심 (사진 등)</span>
			 </div>
			 <div class="reportReson">
			 	<input class="form-check-input" type="radio" name="RREP_CONTENT" value="기타">
			 	<span class="ResonContent">기타</span>
			 </div>
			 <div class="otherContentBox">
			 	<textarea class="otherContent" name="otherContent" placeholder="기타 사유를 입력해 주세요."></textarea>
			 </div>
		 </div>
		 <input class="btn reportBtn"  type="button" value="신고">
	     </form>
	  </div>
	</div>
</main>
<%@ include file="/Template/store_sidevar_close.jsp"%>
	<script>
		/* 01/23_무창_사이드바 click hover 이벤트 css 추가 */
		$(() => {
			$('.nav__link').css('background-color', 'transparent');
			$("#sreview").css('background-color', 'salmon');
			
			$('.nav__link').hover(function(){
				$(this).css('background-color', 'salmon');
			}, function(){
				$(this).css('background-color', 'transparent');  
				$("#sreview").css('background-color', 'salmon');  
			});
		})	
	</script>
</html>
