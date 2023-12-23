<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/Template/header.jsp"%> 
<head>
    <meta charset="utf-8">
    <title>location_select_modal</title>
    
    <script src="js/location_select_modal.js"></script>
    
    <link href="css/location_select_modal.css" rel="stylesheet">
</head>

	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 100px; padding:20px 0 50px 0; ">
		
		<div class="modal_layer" id="modal_layer">
			<div class="modal_wrap">
				<div class="modal_container" >
				
					<div class="location_modal_header">
						<div></div>
						<span class="Location__Popup__Title">지역 선택</span>
						<button class="Location__Popup__Close">
						<img class="Location__Popup__Close__Image" src="https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/web/react_components/indexPage/popup_close.png" alt=""></button>
					</div>
					
					<div class="Location__Popup__Main">
						<div class="Location__District__Header">
							<div class="District__Header__Title">광역시도</div>
							<div class="District__Header__Title">시군구</div>
							<div class="District__Header__Title">읍면동</div>
						</div>
						<div class="District__List__Box">
							<ul class="District__List">
								<li class="District__Item">
									<button class="District__Item__Button now">서울<img class="District__Item__Button__Img" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAoCAYAAAD6xArmAAAABHNCSVQICAgIfAhkiAAAAXpJREFUSEu917FKA0EQBuDbF7CKIUWKFBb2BiSCkjS+R3oLH8F3yBNJQAvLRBBikSKQiErwCc5/ZBIml7vbnZ09D5ZdyOVjmZ292XV5no+zLHtAW6DdO+fm6M2PA/wD5YSlb/Qj4DOrTPALkL6AthhfA3+14AR3AUzRegL6xPgG+Fss7uiPTeB/cBP4Hk6NH8ACf8aYYr971DE/ghmnhaQFjcZLYQ9+hWx592VLJVyDbzjPa/Fa2IJ7YYHTgnZECGpnHgQzfsYLGoQHw1pcBWtwNezBB0jFJb0TBQv8CeNTsaArTsVlNMz4OfpHtHYBvzTBAqft3xL4JBVcnLUNRoEoC8UHZn4RPWOgtGGKi7ffjVEwoxTXyl2ohkNQdR6HoipYgwbDQHt4Oe1nk9Fi/fNWkZjSRBXbW/diimnQ0ev/yn9FTG0HFj4cmk9BB+mW+sTZ3DE29Ux3H/uyq8IXfhymuCrIyw3dPyhPzTcnmvEdsAnaGu02BUrh+AU3Het2tPvd3gAAAABJRU5ErkJggg==" alt=""></button>
								</li>
								<li class="District__Item"><button class="District__Item__Button ">강원</button></li>
								<li class="District__Item"><button class="District__Item__Button ">경기</button></li>
								<li class="District__Item"><button class="District__Item__Button ">경남</button></li>
								<li class="District__Item"><button class="District__Item__Button ">경북</button></li>
								<li class="District__Item"><button class="District__Item__Button ">광주</button></li>
								<li class="District__Item"><button class="District__Item__Button ">대구</button></li>
								<li class="District__Item"><button class="District__Item__Button ">대전</button></li>
								<li class="District__Item"><button class="District__Item__Button ">부산</button></li>
								<li class="District__Item"><button class="District__Item__Button ">울산</button></li>
								<li class="District__Item"><button class="District__Item__Button ">인천</button></li>
								<li class="District__Item"><button class="District__Item__Button ">전남</button></li>
								<li class="District__Item"><button class="District__Item__Button ">전북</button></li>
								<li class="District__Item"><button class="District__Item__Button ">제주</button></li>
								<li class="District__Item"><button class="District__Item__Button ">충남</button></li>
								<li class="District__Item"><button class="District__Item__Button ">충북</button></li>
							</ul>
							<ul class="District__List">
								<li class="District__Item"><button class="District__Item__Button now">전체<img class="District__Item__Button__Img" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAoCAYAAAD6xArmAAAABHNCSVQICAgIfAhkiAAAAXpJREFUSEu917FKA0EQBuDbF7CKIUWKFBb2BiSCkjS+R3oLH8F3yBNJQAvLRBBikSKQiErwCc5/ZBIml7vbnZ09D5ZdyOVjmZ292XV5no+zLHtAW6DdO+fm6M2PA/wD5YSlb/Qj4DOrTPALkL6AthhfA3+14AR3AUzRegL6xPgG+Fss7uiPTeB/cBP4Hk6NH8ACf8aYYr971DE/ghmnhaQFjcZLYQ9+hWx592VLJVyDbzjPa/Fa2IJ7YYHTgnZECGpnHgQzfsYLGoQHw1pcBWtwNezBB0jFJb0TBQv8CeNTsaArTsVlNMz4OfpHtHYBvzTBAqft3xL4JBVcnLUNRoEoC8UHZn4RPWOgtGGKi7ffjVEwoxTXyl2ohkNQdR6HoipYgwbDQHt4Oe1nk9Fi/fNWkZjSRBXbW/diimnQ0ev/yn9FTG0HFj4cmk9BB+mW+sTZ3DE29Ux3H/uyq8IXfhymuCrIyw3dPyhPzTcnmvEdsAnaGu02BUrh+AU3Het2tPvd3gAAAABJRU5ErkJggg==" alt=""></button></li>
								<li class="District__Item"><button class="District__Item__Button false">강남역</button></li>
								
							</ul>
							<ul class="District__List">
							</ul>
						</div>
					</div>
					
					<div class="Location__Popup__User__Confirm">
						<button class="Location__Popup__Cancle"><span>취소</span></button>
						<button class="Location__Popup__Submit"><span>선택 완료</span></button>
					</div>
					
				</div>
			</div>
		</div>
		
		
		
	</main>
<%@ include file="/Template/footer.jsp"%>
</html> 