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
<style>
#body {
  margin-top: 5%;
}

#label {
  font-weight: bold;
}

.table {
  text-align: center;
}

.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0,0.4);
}

/* 예약내역 모달 */
#res-modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 0px 20px 30px 20px;
  border: 1px solid #888;
  width: 30%;
}

#res-modal-body {
  padding: 20px 10px 20px 0px;
}

#res-modal-footer {
  padding-top: 20px;
}

.res-close {
  color: orange;
  float: right;
  font-size: 50px;
  font-weight: bold;
  border-color: #ffffff;
  background-color: #ffffff;
  border-style: none;
}

.res-close:hover,
.res-close:focus {
  color: gray;
  text-decoration: none;
  cursor: pointer;
}

.res_num {
  border-left: 10px solid #FFF2A6;
  color: orange;
}

#resEdit {
  justify-content: flex-start;
}

#resOk {
  justify-content: flex-end;
}

/* 계정삭제 모달 */
#quit-modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 10px 20px 30px 20px;
  border: 1px solid #888;
  width: 30%;
}

#quit-modal-body {
  padding: 20px 10px 20px 0px;
}

#quit-modal-footer {
  padding-top: 20px;
  align-content: right;
}

#close {
  color: red;
  float: right;
  font-size: 50px;
  font-weight: bold;
  border-color: red;
}

#close:hover,
#close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>
<%@ include file="/Template/header.jsp"%> 
</head>
<c:set var="reservationInfo" value="${requestScope.reservationInfo}"/>
<c:set var="reservationModal" value="${requestScope.reservationModal}"/>
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
                	  		<td class="align-middle"colspan="6">
                	  			존재하는 예약내역이 없습니다.
                	  		</td>
                	  	</tr>
                	  </c:if>
                	  <c:if test="${!empty reservationInfo}">
	                	  <c:forEach var="reservationInfo" items="${reservationInfo}">
	                		<tr>
	                	  	  	<td class="align-middle" scope="row" rowspan="2" width="30px">
	                	  	  		<b><a id="resBtn_${reservationInfo.RES_NO}" href="#" style="color: gray;" class="RES_NO">${reservationInfo.RES_NO}</a></b></td>
	                			<td class="align-middle" rowspan="2" width="20px">${reservationInfo.RES_DATE}</td>
	                			<td class="align-middle" colspan="2">${reservationInfo.STORE_NAME}</td>
	                			<c:if test="${reservationInfo.REQ_STATE eq '2'}">
		                			<td style="vertical-align: middle; color: green;" rowspan="2" width="40px"><b>방문완료</b></td>
		                			<td class="align-middle" rowspan="2" width="20px">
		                				<button type="button" class="btn btn-outline-warning">작성하기</button></td>
	                			</c:if>	
	                			<c:if test="${reservationInfo.REQ_STATE eq '1'}">
	                			    <td style="vertical-align: middle; color: red;" rowspan="2" width="40px"><b>예약취소</b></td>
		                			<td class="align-middle" rowspan="2" width="20px"></td>
	                			</c:if>	
	     			            <c:if test="${reservationInfo.REQ_STATE eq '0'}">
	                				<td style="vertical-align: middle; color: orange;" rowspan="2" width="40px"><b>예약완료</b></td>
		                			<td class="align-middle" rowspan="2" width="20px"></td>
	                			</c:if>	
	                		</tr>
	                		<tr>
	                			<td class="align-middle" width="50px" >${reservationInfo.SEAT_NAME}</td>
	                			<td class="align-middle" width="15px">${reservationInfo.RES_PEOPLE}명</td>
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
			     <h5 id="modal_res_no" class="res_num"></h5>
				 <div class="col-md-12 mt-5">
		          <div class="tab-content profile-tab" id="myTabContent">
		             <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
		                <div class="row">
		                    <div class="col-md-6">
		                        <label id="label">예약일</label>
		                    </div>
		                    <div class="col-md-6">
		                        <p id="modal_res_date"></p>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6">
		                        <label id="label">예약자</label>
		                    </div>
		                    <div class="col-md-6">
		                        <p id="modal_cus_name"></p>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6">
		                        <label id="label">전화번호</label>
		                    </div>
		                    <div class="col-md-6">
		                        <p id="modal_cus_tel"></p>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6">
		                        <label id="label">식당명</label>
		                    </div>
		                    <div class="col-md-6">
		                        <p style="color: gray;">
		                        	<b><a id="modal_store_no" style="color: gray;">
		                        	   <label id="modal_store_name" style="text-decoration: underline;"></label></a></b><br>
		                            (<label id="modal_store_location"></label>)</p>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6">
		                        <label id="label">좌석</label>
		                    </div>
		                    <div class="col-md-6">
		                        <p id="modal_seat_name"></p>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6">
		                        <label id="label">인원</label>
		                    </div>
		                    <div class="col-md-6">
		                        <p id="modal_res_people">명</p>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-md-6">
		                        <label id="label">기타 요청사항</label>
		                    </div>
		                    <div class="col-md-6">
		                        <p id="modal_res_req"></p>
		                    </div>
		                </div>
		                
		                <hr style="color: gray;">
		                <h5 class="res_num">결제정보</h5>
		                <div class="col-md-12 mt-5">
			                <div class="row">
			                    <div class="col-md-6">
			                        <label id="label">결제일</label>
			                    </div>
			                    <div class="col-md-6">
			                        <p id="modal_res_paytime"></p>
			                    </div>
			                </div>
			                <div class="row">
			                    <div class="col-md-2">
			                        <label id="label">메뉴명</label>
			                    </div>
			                    <div class="col-md-2">
			                        <p id="modal_menu_name"></p>
			                    </div>
<!-- 			                </div> -->
<!-- 			                <div class="row"> -->
			                    <div class="col-md-2">
			                        <label id="label">메뉴수량</label>
			                    </div>
			                    <div class="col-md-2">
			                        <p id="modal_menu_count"></p>
			                    </div>
<!-- 			                </div> -->
<!-- 			                <div class="row"> -->
			                    <div class="col-md-2">
			                        <label id="label">금액</label>
			                    </div>
			                    <div class="col-md-2">
			                        <p id="modal_paid_price"></p>
			                    </div>
			                </div>
			                <hr style="border:2px dashed;">
			                <div class="row">
			                    <div class="col-md-6">
			                        <label id="label">총 결제금액</label>
			                    </div>
			                    <div class="col-md-6">
			                        <p id="modal_paid_amount"></p>
			                    </div>
			                </div>
			                <div class="row">
			                    <div class="col-md-6">
			                        <label id="label">결제자명</label>
			                    </div>
			                    <div class="col-md-6">
			                        <p id="modal_buyer_name"></p>
			                    </div>
			                </div>
		                	<div class="row">
			                    <div class="col-md-6">
			                        <label id="label">결제카드</label>
			                    </div>
			                    <div class="col-md-6">
			                        <p id="modal_card_name"></p>
			                    </div>
		                	<div class="row">
			                    <div class="col-md-6">
			                        <label id="label">카드번호</label>
			                    </div>
			                    <div class="col-md-6">
			                        <p id="modal_card_number"></p>
			                    </div>
			                </div>
			                
		                </div>
		            </div>
		          </div>
		       </div>
		     </div>
		     <div class="modal-footer" id="res-modal-footer">
		       <div align="left">
		       <button type="button" class="btn btn-outline-warning" id="resEdit">수정</button>
		       <button type="button" class="btn btn-outline-danger" id="resDelete">취소</button>
		       </div> 
		       <div align="right">
      		   <button type="button" class="btn btn-secondary right" data-dismiss="modal" id="resOk">확인</button>   
      		   </div> 
		     </div>
		     
		  </div>
		</div>
        
        
        
        <div class="col-md-3">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5 mt-5">
            <h4>고객 정보</h4>
           	 <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
            	<span class="font-weight-bold">${sessionScope.CUS_NICK}</span>
			<button type="submit" class="btn btn-primary btn-block mt-5" onclick="location.href='cus_edit.cu'"
  		  		    style="color: #111111; background-color: white; border-color: #111111;">고객 정보 수정하기</button>
			<button type="submit" class="btn btn-primary btn-block" onclick="#"
  		  		    style="color: #111111; background-color: white; border-color: #111111;">나의 리뷰 보기</button>
			<button type="submit" class="btn btn-primary btn-block mb-4" onclick="location.href='like_list.cu'"
  		  		    style="color: #111111; background-color: white; border-color: #111111;">찜한 식당 보기</button>  	  
          	  
          	  
			<a id="exBtn" data-mdb-toggle="pill" href="#" role="tab"
			   aria-controls="register" aria-selected="true" style="color: gray;"> > 계정 삭제</a>
			
			<!-- 계정삭제 모달창 -->
			<div id="exModal" class="modal">
			  <div class="modal-content" id="quit-modal-content">
<!-- 			   <form action="deletePro.cu" method="post" name="deleteCustomer"> -->
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
					    	<input type="text" name="CUS_EMAIL" class="form-control" 
					    		   placeholder="이메일 입력"/></p>
					 </div>
				     <div class="form-outline mt-5 mb-3 text-left">
				        <label>계정을 삭제하려는 이유를 선택해 주십시오.</label>
						<select name="quit_why" id="quit_why" class="form-select">
							<option selected>계정 삭제 이유</option>
							<hr>
							<option value="다른 계정 이용">다른 계정 이용</option>
							<option value="서비스 이용 불편">서비스 이용 불편</option>
							<option value="사용빈도 적음">사용빈도 적음</option>
							<option value="기타">기타</option>
						</select>
					 </div>
			     </div>
			     <div class="modal-footer" id="quit-modal-footer">
			       <button type="button" id="deleteBtn" class="btn btn-outline-danger">계정 삭제</button>
			       <button type="button" id="cancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>     
			     </div>
<!-- 			   </form> -->
			  </div>
			</div>

			</div>
		</div>	
	</div>
</div>

</body>
<%@ include file="/Template/footer.jsp"%> 
<script>
$(function(){
	// 예약내역 모달
	var resModal = document.getElementById("resModal");

	$('.RES_NO').on('click', function(){
	 	$.ajax({
	 		type: "get",
	 		url: "resDetail.cu",
	 		data: { id: this.text}
	 	})
	 	.done(function(data){
	 		$('#modal_res_no').text(data.RES_NO);
	 		$('#modal_res_date').text(data.RES_DATE);
	 		$('#modal_cus_name').text(data.CUS_NAME);
	 		$('#modal_res_people').text(data.RES_PEOPLE); 
	 		$('#modal_res_req').text(data.RES_REQ);
	 		$('#modal_res_paytime').text(data.RES_PAYTIME);
	 		$('#modal_store_name').text(data.STORE_NAME);
	 		$('#modal_store_location').text(data.STORE_LOCATION);
	 		$('#modal_seat_name').text(data.SEAT_NAME);
	 		resModal.style.display = "block";	
	 		
	 		$('#modal_store_no').on('click', function(){
	 			location.href = "store.ma?STORE_NO="+data.STORE_NO;
	 		})
	 	})
	});

	$('.res-close').on('click', function(){
		resModal.style.display = "none";
	})
	
	$('#resEdit').on('click', function(){
		location.href = "payment_change.pa";
	})
	
	$('#resDelete').on('click', function(){
		var result = confirm("예약을 취소하시겠습니까?");
        if(result){
    	 	$.ajax({
//             	debbuger;
    	 		type: "get",
    	 		url: "resDetail.cu",
    	 		data: { id: this.text}
    	 	})
        	alert("예약취소가 되었습니다.");
    	 	location.reload(true);
       	} else {
       		return false;
       	}
	})
	
	$('#resOk').on('click', function(){
		resModal.style.display = "none";
	})

	
	// 계정삭제 모달
	var modal = document.getElementById("exModal");
	var btn = document.getElementById("exBtn");
	var span = document.getElementsByClassName("close")[0];
	var cancelBtn = document.getElementById("cancelBtn");
	
	$('#exBtn').on('click', function(){
		modal.style.display = "block";	
	})
	
	$('#close').on('click', function(){
		modal.style.display = "none";
	})
	
	$('#cancelBtn').on('click', function(){
		modal.style.display = "none";
	})
	
	// 계정삭제 버튼
	$('#deleteBtn').on('click', function(){
		alert('정말로 삭제하시겠습니까?');
		location.href = "deletePro.cu";
	})
	
	
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
});
</script>
</html>