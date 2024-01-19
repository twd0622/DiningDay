<!-- 12/20/18:10_강현아 + mypage 개설 -->
<!-- 12/21/15:30_강현아 + 예약내역 수정 및 회원탈퇴 모달창 추가 -->
<!-- 12/22/11:00_강현아 + 예약내역 모달창 추가 -->
<!-- 12/26/14:10_강현아 + 페이지 연결 -->
<!-- 12/27/9:50_강현아 + margin 수정 -->
<!-- 01/02/10:00_강현아 + 닉네임 추가 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 마이페이지</title>
<link href="Customer/css/mypage.css" rel="stylesheet">
<%@ include file="/Template/header.jsp"%> 
</head>
<c:set var="reservationInfo" value="${requestScope.reservationInfo}"/>
<c:set var="reservationModal" value="${requestScope.reservationModal}"/>
<c:set var="menuModal" value="${requestScope.menuModal}"/>
<body id="body">
<div class="container rounded bg-white mt-5 mb-5">
	<div class="row">
    
		<div class="col-md-9 border-right">
			<div class="p-3 py-5">
				<div class="d-flex justify-content-between align-items-center mb-3">
					<h2><b>고객 마이페이지</b></h2>
				</div>
				<div class="row mt-3">
					<h4>예약내역</h4>
                	<table class="table" id="table">
                	<thead class="table-warning">
						<tr>
							<th scope="col" >예약번호</th>
                			<th scope="col" >예약일</th>
                			<th scope="col" colspan="2">예약내용</th>
                			<th scope="col" >예약상황</th>
                			<th scope="col" >리뷰</th>
                		</tr>
                	</thead>
					<tbody>		
                	  <c:if test="${empty reservationInfo}">
						<tr>
							<td colspan="6">존재하는 예약내역이 없습니다.</td>
						</tr>
                	  </c:if>
                	  <c:if test="${!empty reservationInfo}">
						<c:forEach var="reservationInfo" items="${reservationInfo}">
							<tr>
	                	  	  	<td scope="row" rowspan="2" width="30px">
	                	  	  		<b><a id="${reservationInfo.RES_NO}" href="#" class=resBtn>${reservationInfo.MERCHANT_UID}</a></b></td>
	                			<td rowspan="2" width="20px">${reservationInfo.RES_DATE}</td>
	                			<td colspan="2">${reservationInfo.STORE_NAME}</td>
	                			<td id="REQ_STATE_${reservationInfo.REQ_STATE}" rowspan="2"><b>${reservationInfo.STATE_NAME}</b></td>
	                			<td rowspan="2" width="20px">
		                			<c:if test="${reservationInfo.REVIEW_ON eq 'Y'}">
	                					<button onclick="location.href='reviewWrite.re?STORE_NAME=${reservationInfo.STORE_NAME}&RES_NO=${reservationInfo.RES_NO}'"
	                							type="button" class="btn btn-outline-warning">작성하기</button>
	                				</c:if>
	                			</td>
	                		</tr>
	                		<tr>
	                			<td width="50px">${reservationInfo.SEAT_NAME}</td>
	                			<td width="15px">${reservationInfo.RES_PEOPLE}명</td>
	                		</tr>
	                	  </c:forEach>
                	  </c:if>
                	</tbody>
                	</table>
                </div>
                </div>
			</div>
		
        <!-- 예약내역 모달창 -->
		<div id="resModal" class="modal">
		  <div class="modal-content" id="res-modal-content">
		     <div class="modal-header" id="res-modal-header">
			     <h2 class="modal-title" id="res-modal-body">상세 예약내역</h2><br>
			     <button type="button" class="res-close" data-dismiss="modal" aria-label="Close">&times;</button>
		     </div>
		     <div class="modal-body" id="res-modal-body">
			     <h5 id="modal_merchant_uid" class="res_num"></h5>
				 <div class="col-md-12 mt-5">
		          <div class="tab-content profile-tab" id="myTabContent">
		             <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
		                <div class="row">
		                    <div class="col-md-6"><label id="label">예약일</label></div>
		                    <div class="col-md-6"><p id="modal_res_date"></p></div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6"><label id="label">예약자</label></div>
		                    <div class="col-md-6"><p id="modal_cus_name"></p></div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6"><label id="label">전화번호</label></div>
		                    <div class="col-md-6"><p id="modal_cus_tel"></p></div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6"><label id="label">식당명</label></div>
		                    <div class="col-md-6">
		                        <p id="store">
		                        <b><a id="modal_store_no">
		                        <label id="modal_store_name"></label></a></b><br>
		                        (<label id="modal_store_location"></label>)</p>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6"><label id="label">좌석</label></div>
		                    <div class="col-md-6"><p id="modal_seat_name"></p></div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6"><label id="label">인원</label></div>
		                    <div class="col-md-6"><p id="modal_res_people">명</p></div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6"><label id="label">기타 요청사항</label></div>
		                    <div class="col-md-6"><p id="modal_res_req"></p></div>
		                </div>

		                <hr id="res_hr">
		                <h5 class="res_num">결제정보</h5>
		                <div class="row mt-5 mb-2" id="menuForm">
		                    <div class="col-md-4"><label id="label">메뉴명</label></div>
							<div class="col-md-4"><label id="label">메뉴수량</label></div>
							<div class="col-md-4"><label id="label">금액</label></div>
						</div>
						<div class="row" id="menuForm">
		                    <div class="col-md-4" id="menuName"></div>
		                    <div class="col-md-4" id="menuCount"></div>
		                    <div class="col-md-4" id="menuPrice"></div>
			            </div>  
		                <hr id="menu_hr">
		                <div class="row">
		                    <div class="col-md-6"><label id="label">총 결제금액</label></div>
		                    <div class="col-md-6"><p id="modal_paid_amount"></p></div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6"><label id="label">결제자명</label></div>
		                    <div class="col-md-6"><p id="modal_buyer_name"></p></div>
		                </div>
            			<div class="row">
		                    <div class="col-md-6"><label id="label">결제일</label></div>
		                    <div class="col-md-6"><p id="modal_res_paytime"></p></div>
		                </div>
	                	<div class="row">
		                    <div class="col-md-6"><label id="label">결제카드</label></div>
		                    <div class="col-md-6"><p id="modal_card_name"></p></div>
		                </div>
	                	<div class="row">
		                    <div class="col-md-6"><label id="label">카드번호</label></div>
		                    <div class="col-md-6"><p id="modal_card_number"></p></div>
		                </div>
		            </div>
		          </div>
		        </div>
		     </div>
		     <div class="modal-footer" id="res-modal-footer">
		     	<div class="col">
					<div id="modal_req_state">
					</div>    
				    <div id="resOk_div">
	    		 		<button type="button" class="btn btn-secondary" data-dismiss="modal" id="resOk">확인</button>   
		     	 	</div>
		     	</div>
		     </div>

		  </div>
		</div>

        
        
        <div class="col-md-3">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5 mt-5">
            <h4>고객 정보</h4>
            <c:set var="customerInfo" value="${requestScope.customerInfo}"/>
           	 <img class="rounded-circle mt-5 mb-3" id="profileImage" src="upload/${customerInfo.CUS_IMAGE}">
            	<span class="font-weight-bold">${customerInfo.CUS_NICK}</span>
			<button type="submit" class="btn btn-primary btn-block mt-5" onclick="location.href='cus_edit.cu'"
  		  		    id="myBtn">고객 정보 수정하기</button>
			<button type="submit" class="btn btn-primary btn-block" onclick="#"
  		  		    id="myBtn">나의 리뷰 보기</button>
			<button type="submit" class="btn btn-primary btn-block mb-4" onclick="location.href='like_list.cu'"
  		  		    id="myBtn">찜한 식당 보기</button>  	  
			<a id="exBtn" data-mdb-toggle="pill" href="#" role="tab"
			   aria-controls="register" aria-selected="true"> > 계정 삭제</a>
		
			<!-- 계정삭제 모달창 -->
			<div id="exModal" class="modal">
			  <div class="modal-content" id="quit-modal-content">
			     <div class="modal-header" id="quit-modal-header">
				     <h3 class="modal-title" id="quit-modal-title"><b>계정 삭제</b></h3>
				     <button type="button" class="close" id="close" data-dismiss="modal" aria-label="Close">
				     	&times;</button>
			     </div>
			     <div class="modal-body" id="quit-modal-body">
				     <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
					  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
					    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
					  </symbol>
					</svg>
				     <div class="alert alert-danger d-flex align-items-center" role="alert">
						  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img"
						  	   aria-label="Danger:">
						  <use xlink:href="#exclamation-triangle-fill"/></svg>
				     '계정 삭제'를 클릭하시면 탈퇴가 완료되니 신중하게 선택해 주십시오.
				     </div>
				     <div class="form-outline mt-5 mb-3 text-left">
					  	<p><label>본인 계정 확인을 위해 이메일을 입력해 주십시오.</label>
					    	<input type="text" id="cus_EmailCheck" class="form-control" 
					    		   placeholder="이메일 입력"/></p>
					 </div>
				     <div class="form-outline mt-5 mb-3 text-left">
				        <label>계정을 삭제하려는 이유를 선택해 주십시오.</label>
						<select name="CUS_REASON" id="CUS_REASON" class="form-select">
							<option selected hidden disabled>계정 삭제 이유</option>
							<option value="0">다른 계정 이용</option>
							<option value="1">서비스 이용 불편</option>
							<option value="2">사용빈도 적음</option>
							<option value="3">기타</option>
						</select>
					 </div>
			     </div>
			     <div class="modal-footer" id="quit-modal-footer">
			       <button type="button" id="deleteBtn" class="btn btn-outline-danger">계정 삭제</button>
			       <button type="button" id="cancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>     
			     </div>
			  </div>
			</div>
			
			</div>
		</div>	
		
	</div>
</div>
</body>
<%@ include file="/Template/footer.jsp"%> 
<script src="Customer/js/mypage.js"></script>
</html>