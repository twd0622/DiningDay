//======================= 함수 =====================================
var checkWeekday = function(day){
	var result = "";
	switch(day){
		case 0: result="일"; break;
		case 1: result="월"; break;
		case 2: result="화"; break;
		case 3: result="수"; break;
		case 4: result="목"; break;
		case 5: result="금"; break;
		case 6: result="토"; break;
	}
	return result;
}

//================================================================

$(()=>{
	// -------------- 예약 버튼 ------------------------
	// 최초 페이지 접속 시 날짜, 인원 옵션으로 예약버튼 판단하기
	var disableReservationBtn = function(){
		// 휴무날로 판단하기
		var weekday = new Date($("#dateOption").val()).getDay();
		var weekend = [];
		if($("#close").length != 0){
			weekend = $("#close").attr("class").split(",");	
		}
		var resModalBtn = $(".reservationModalBtn");
		for(holiday of weekend){
			var result = checkWeekday(weekday)
			if(holiday == result){
				for(var i = 0 ; i < resModalBtn.length; i++){
					var modalbtn = resModalBtn.eq(i);
					if(!modalbtn.prop("disabled")){
						modalbtn.attr('disabled', true);
						modalbtn.text('예약 불가');
					}
				}
				return;
			}
		}
		
		// 좌석별 최소, 최대 인원으로 판단하기
		var tables = $(".table_ ul");
		var curPeople = Number($(".people").text());
		if(curPeople == ""){
			return;
		}
		
		
		for(var i = 0; i < tables.length; i++){
			var min = Number(tables.eq(i).find("li[name=minPeople]").attr("class"));
			var max = Number(tables.eq(i).find("li[name=maxPeople]").attr("class"));
			var btn = tables.eq(i).parent("div").next("div").find(".reservationModalBtn");
			if(curPeople < min || curPeople > max){
				btn.attr('disabled', true);
				btn.text('예약 불가');
			} else {
				btn.attr('disabled', false);
				btn.text('예약하기');
			}
		}
	}
	
	disableReservationBtn();
	
	
	// 헤더 버튼 조작 시 예약 인원 수 별 가능한 테이블 예약 버튼 보여주기
	// DOMSubtreeModified 이벤트가 Chrome에선 이제 지원 하지 않음
	$(".people").on("DOMSubtreeModified",function(){
		disableReservationBtn();
	})
	
	$("#dateOption").on("input", function(){
		disableReservationBtn();
	})
	
	
	// -------------- 찜 버튼 ------------------------
	$.ajax({
		type: "get",
		url:"getLike.ma",
		data: {
			CUS_NO: cus_no,
			STORE_NO: $(".store_profile").attr("id")
		}
	})
	.done(
		function(data){
			if(data == '1'){
				$("#like_btn").prepend('<span class="material-icons profile_btn_icon like" style="color: #E21818;">favorite</span>');
			} else {
				$("#like_btn").prepend('<span class="material-symbols-outlined profile_btn_icon unlike" style="color:#E21818;">favorite</span>');
			}
		}
	)
	
	
	$("#like_btn").on(
		"click",
		function(){
			if(cus_no == ""){
				alert("로그인 후 가능");
				return;
			}
			
			var url;
			var resultFuc;
			if($(this).children(".unlike").length == 1){
				url = "insertLike.ma";
				
				resultFuc = (result) =>{
					if(result == "1"){
						$(".unlike").remove();
						$("#like_btn").prepend('<span class="material-icons profile_btn_icon like" style="color: #E21818;">favorite</span>');
						$(".like_count").text((i, oldCount)=>{
							return Number(oldCount) + 1
						})				
					}
				}
			} else{
				if(confirm('찜을 취소하시겠습니까?') == true) {
					url = "deleteLike.ma"
					resultFuc = (result) =>{
						if(result == "1"){
							$(".like").remove();
							$("#like_btn").prepend('<span class="material-symbols-outlined profile_btn_icon unlike" style="color:#E21818;">favorite</span>');
							$(".like_count").text((i, oldCount)=>{
								return Number(oldCount) - 1
							})				
						}
					}
				}
				else return;
			}
			
			$.ajax({
				type: "post",
				url: url,
				data: {
					CUS_NO: cus_no,
					STORE_NO: $(".store_profile").attr("id")
				}
			})
			.done(
				function(data){
					resultFuc(data);
				}
			)
			
		}
	)
	
	//--------------- 리뷰 -----------------------
	$("#reviewBtn").on("click", function(){
		
		location.href = "store_review.re?STORE_NO="+$(".store_profile").attr("id");
	})
	
	
	// -------------- 모달 ------------------------
	// 예약 날짜가 오늘인 경우 현재 시간 기준 2시간 뒤 예약 가능
	var dateObj = new Date();
	var today = dateObj.getFullYear() + "-" + ('0' + (dateObj.getMonth() + 1)).slice(-2) + "-" + ('0' + dateObj.getDate()).slice(-2);
	var curTime = ('0' + (dateObj.getHours())).slice(-2) + dateObj.getMinutes();
	var resAbleTime = 0;
	
	var curTimeCheck = function(){
		if($("#dateOption").val() == today){
			resAbleTime = Number(curTime) + 200;
			
			var allSelectTime = $(".selectTime");
			for(var i = 0; i < allSelectTime.length; i++){
				var selectTimeTag = allSelectTime.eq(i)
				if(selectTimeTag.val() < resAbleTime){
					selectTimeTag.parent(".able").addClass("disable");
					selectTimeTag.parent(".able").removeClass("able");
				}
			}
		}
	}
	
	// 브레이크 타임 고려하기
	var breakTime = $("#BT").attr("class").split("~");
	var breakStart = breakTime[0].replace(":","");
	var breakEnd = breakTime[1].replace(":","");
	
	var breakTimeCheck = function(){
		var allAbleTime = $(".able");
		for(var i = 0; i < allAbleTime.length; i++){
			var ableTime = allAbleTime.eq(i).children(".selectTime")
			if(breakStart < ableTime.val() && ableTime.val() < breakEnd){
				ableTime.parent(".time").addClass("disable");
				ableTime.parent(".time").removeClass("able");
			}
		}
	}
	
	// 예약 모달 열기
	$(".modalOpen").on("click",()=>{
		if(cus_no == ""){
			alert("로그인 후 예약 가능")
			location.href = "login.cu";
			return;
		}
		$("#modalContainer").removeClass("hidden")
	})
	
	// 모달 닫기 버튼
	$("#modalCloseButton").on("click", ()=>{
		$("#modalContainer").addClass("hidden")
		$("#date").val(null);
		
		for(var i = 0; i < $(".time").length; i++){
			var timeBtn = $(".time").eq(i);
			if(timeBtn.hasClass("disable")){
				timeBtn.addClass("able");
				timeBtn.removeClass("disable");
			}
		}
		$(".selected").removeClass("selected");
		$(".selectTime").prop("checked", false);
		$(".timeFont").css("font-weight", "300");
	})
	
	// 예약 버튼 클릭시 모달 창에 정보 넣기
	$(".reservationModalBtn").on(
		"click",
		function(){
			var table_name = $(this).parents(".table_res").prev().children(".table_name").text();
			$("#SEAT_NAME").text(table_name);
			$("input[name=SEAT_NAME]").val(table_name);
			
			var seat_no = $(this).parents(".table_").attr("id");
			$("#seat_no").val(seat_no);

			const regex = /[^0-9]/g;
			var people= $("#peopleOption").val().replace(regex, "");
			$("#res_people_input").val(people);
			$("#res_people").text(people);

			$("#res_date_input").val($("#dateOption").val());
			$("#res_date").text($("#dateOption").val());
			
			
			$.ajax({
				type: "get",
				url: "getResModal.ma",
				data: {
					STORE_NO: $(".store_profile").attr("id"),
					SEAT_NO: seat_no
				},
				dataType:"json"
			})
			.done(
				function(data){
					// 이미 예약한 좌석 판단
					for(soldOut of data){
						$(".selectTime").val(function(i, val){
							if(soldOut.RES_TIME == val){
								$(".time").eq(i).removeClass("able");
								$(".time").eq(i).addClass("disable");
							}
							return val;
						})
					}
					curTimeCheck();
					breakTimeCheck();
					
					$(".able").on("click", function(){
						if($(this).hasClass("disable")) return;
						
						$(this).children(".selectTime").prop("checked", true);
						if($(".able").hasClass("selected")){
							$(".able").removeClass("selected");
						}
						
						$(this).addClass("selected")
						
						$(".timeFont").css("font-weight", "300");
						$(this).children(".timeFont").css({
							"font-weight": "400"
						})
						
					})
					
				}
			)
		}
	)
	
	// -------------- 모달 예약 버튼 클릭 ------------------------
	$(".reservation").submit(function(){
		var times = $(".selectTime");
		var isChecked = false;
		for(var i = 0 ; i < times.length ; i++){
			var result = times.eq(i).prop("checked");
			if(result){
				isChecked = result;
			}
		}
		
		if(!isChecked){
			alert("시간을 선택해 주세요!")
		}
		
		return isChecked;
	})
	
	// ---------- 신고 버튼 로그인 확인 ------------------------
	$("#repoertBtn").on("click", function(){
		if(cus_no != ''){
			location.href = "reportWrite.re?STORE_NO="+$(".store_profile").attr("id")+"&STORE_NAME="+$(".tit-point").find("h1").text();
		} else{
			alert("로그인 후 가능")
		}
		
		
	})
	
})
