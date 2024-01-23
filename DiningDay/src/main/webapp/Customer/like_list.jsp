<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/Template/header.jsp"%> 
<head>
    <meta charset="utf-8">
    
    <c:set var="LikeList" value="${requestScope.LikeList }" />
    
    <title>찜 목록</title> 
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    <link href="Customer/css/like_list.css" rel="stylesheet">
</head>

	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 100px; padding:20px 0 50px 0; ">
		
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="main_container rounded">
			<div class="titBox">
				<p class="tit">찜 목록</p>
			</div>
			<div class="store_listBox">
				<c:forEach var="store" items="${LikeList}">
				<!-- 리뷰 리스트 -->
				<div class="storeBox">
					<div class="store_img">
						<img alt="${store.PHOTO_NAME}" src="upload/${store.PHOTO_NAME}" style="width: 100%; height: 100%; border-radius: 10px;">					
					</div>
					<div class="colBox">
						<div>
							<div class="store_name">
								<p style="margin: 0;">${store.STORE_NAME}</p>
								<a href="store.ma?STORE_NO=${store.STORE_NO}" style="font-size: 13px; line-height: 175%;">상세보기></a>
							</div>
							<div class="store_category">
								<span class="store_info_text">${store.STORE_CATEGORY}
								<c:if test="${!empty store.STORE_DETAIL}">
									| ${store.STORE_DETAIL}
								</c:if>								
								</span>
							</div>
						</div>
						<div class="store_info">
							<div class="store_review_score">
								<span class="store_info_icon material-icons" style="color: #F7CE3E;">grade</span>
								<span class="store_info_text">${store.STORE_SCORE}점 (${store.REVIEW_COUNT}명)</span>
							</div>
							<div class="store_like">
								<span class="store_info_icon material-icons" style="color: #E21818;">favorite</span>
								<span class="store_info_text">${store.LIKE_COUNT}</span>
							</div>
						</div>
					</div>
				</div>
				
				</c:forEach>
			</div>
				
		</div>
		
	</main>
<%@ include file="/Template/footer.jsp"%>
</html> 