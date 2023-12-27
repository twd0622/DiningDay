<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="../resources/css/styles2.css" rel="stylesheet" />
<title>아이티윌 2강 1조</title>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
</head>

<%@ include file="/Template/header.jsp"%>
<!-- main은 속성 값은 왠만하면 건들지x -->
<main
	style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 68.5px; padding: 20px 0 50px 0;">

	<!-- 예시div style속성 값 조절해서 사용! -->
	<div class="container px-4 px-lg-5">
		<!-- Heading Row-->
		<div class="row gx-4 gx-lg-5 align-items-center my-5" style=" justify-content: center">
			<div class="col-lg-7" style="text-decoration: none; display:flex; flex-direction: row; align-items: center; width: 500px;">
				<span class="material-symbols-outlined" style="color:#9CED92; font-size:60px; -webkit-text-stroke: 0.5px #FFF2A6;">lunch_dining</span>
				<span id="logo"style="color:#9CED92; -webkit-text-stroke:0.5px #FFF2A6; font-size: 60px; letter-spacing:-2px; font-weight: bold;" >Dining Day</span>
			</div>
			<div class="col-lg-5">
				<h1 class="font-weight-light"><b>다이닝 데이</b></h1> <br>
				<p> "특별한 날에 맛있는 음식을 즐기세요!"<br> 
					It Enjoy delicious food on your special day! <br>
					特別な日においしい食べ物をお楽しみください!<br>
					在您的特殊日子里享用美味佳肴!</p>
			</div>
		</div>
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<p class="text-white m-0">"예약의 모든 경험을 연결합니다. 
					다이닝데이는 예약뿐만 아니라 모든 행복을 책임질 수 있도록 원스톱 예약 플랫폼을 만들고 있어요." </p>
			</div>
		</div>
		            <div class="row gx-4 gx-lg-5">
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">VIP CS 센터 운영</h2>
                            <hr>
                            <p class="card-text">재방문 고객을 위한 VIP CS 센터를 운영하고 <br> 있어요. 이용 중 어려움이 있다면 가장 먼저 <br> 응대하여 문제를 신속하게 해결해 드려요. </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">고객 안심 예약제 운영</h2>
                            <hr>
                            <p class="card-text">식당 사정으로 예약이 취소되더라도 걱정하지 <br> 마세요. 안심 예약제가 적용된 숙소라면 안심 <br> 예약 전담팀에서 더 나은 식당을 <br> 직접 찾아 안내해 드려요. </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">고객 리얼 리뷰 제공</h2>
                            <hr>
                            <p class="card-text">600만 개가 넘는 고객 리뷰를 제공하고 있어요. <br> 클린 정책을 기반으로 리뷰 커뮤니티를 <br> 운영하고 있어 신뢰할 수 있는 리뷰를 <br> 확인할 수 있어요. </p>
                        </div>
                    </div>
                </div>
            </div>
	</div>
</main>
<%@ include file="/Template/footer.jsp"%>
</html>
