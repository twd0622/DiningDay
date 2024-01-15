$(function(){
// 	// 예약내역 모달
	var resModal = document.getElementById("resModal");

	$('.resBtn').on('click', function(){
	 	$.ajax({
	 		type: "get",
	 		url: "resDetail.cu",
	 		data: {RES_NO: this.text},
	 		dataType: "json"
	 	})
	 	.done(function(data){
	 		var resMap = data[data.length-1];
	 		$('#modal_res_no').text(resMap.RES_NO);
	 		$('#modal_res_date').text(resMap.RES_DATE);
	 		$('#modal_cus_name').text(resMap.CUS_NAME);
	 		$('#modal_cus_tel').text(resMap.CUS_TEL);
	 		$('#modal_store_name').text(resMap.STORE_NAME);
	 		$('#modal_store_location').text(resMap.STORE_LOCATION);
	 		$('#modal_seat_name').text(resMap.SEAT_NAME);
	 		$('#modal_res_people').text(resMap.RES_PEOPLE); 
	 		$('#modal_res_req').text(resMap.RES_REQ);
	 		$('#modal_res_paytime').text(resMap.RES_PAYTIME);
	 		$('#modal_paid_amount').text(resMap.PAID_AMOUNT);
	 		$('#modal_buyer_name').text(resMap.BUYER_NAME);
	 		$('#modal_card_name').text(resMap.CARD_NAME);
	 		$('#modal_card_number').text(resMap.CARD_NUMBER);
	 		
	 		if($.trim(resMap.REQ_STATE) == '0'){
	 			$("#modal_req_state").append("<button type='button' class='btn btn-outline-warning' id='resEdit'>수정</button> ");
	 			$("#modal_req_state").append("<button type='button' class='btn btn-outline-danger' id='resDelete'>취소</button>");
	 			
	 			$('#resEdit').on('click', function(){
	 				location.href = "payment_change.pa";
	 			})
	 			
	 			$('#resDelete').on('click', function(){
	 				var result = confirm("예약을 취소하시겠습니까?");
	 		        if(result){
	 		        	alert("예약취소가 되었습니다.");
	 		    	 	location.reload(true);
	 		       	} else {
	 		       		return false;
	 		       	}
	 			})
	 		}

	 		for (let menuList of data.slice(0, -1)) {
	 			$("#menuName").append("<div class='row'><p>" + menuList.MENU_NAME + "</p></div>");
	 			$("#menuCount").append("<div class='row'><p>" + menuList.MENU_COUNT + "</p></div>");
	 			$("#menuPrice").append("<div class='row'><p>" + menuList.PAID_PRICE + "</p></div>");
			}
	 		
	 		resModal.style.display = "block";	
	 		
	 		$('#modal_store_no').on('click', function(){
	 			location.href = "store.ma?STORE_NO="+resMap.STORE_NO;
	 		})
	 	})
	});
	
	$('.res-close').on('click', function(){
		$('#menuName').empty();
		$('#menuCount').empty();
		$('#menuPrice').empty();
		$('#modal_req_state').empty();
		resModal.style.display = "none";
	})

	
	$('#resOk').on('click', function(){
		$('#menuName').empty();
		$('#menuCount').empty();
		$('#menuPrice').empty();
		$('#modal_req_state').empty();
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
		var result = confirm('정말로 삭제하시겠습니까?');
	        if(result){
	     	 	$.ajax({
		 	 		type: "post"
		 	 		, url: "deletePro.cu"
		 	 		, dataType: "json"
		 	 		, data: {CUS_REASON: $("#CUS_REASON").val(),
		 	 			     CUS_EMAIL: $("#cus_EmailCheck").val()}
	     	 		, success: function(data) {
		 	 			alert("계정 삭제가 완료되었습니다.");
		 	 			location.replace('main.ma');
	     	 		}
	     	 		, error : function(){
	     	 			alert("이메일을 다시 작성해 주십시오.");
	                }
	 	 		})
	       	} else {
	       		alert("삭제가 취소되었습니다.");
	       		modal.style.display = "none";
	       	}
	})
	
	
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	    
	  }
	}
});