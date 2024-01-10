$(()=>{
	// 최초 예약 인원 수 별 가능한 테이블 예약 버튼 보여주기
	var curPeople = Number($(".people").text());
	var tables = $(".table_ ul");
	for(var i = 0; i < tables.length; i++){
				var min = Number(tables.eq(i).find("li[name=minPeople]").attr("class"));
				var max = Number(tables.eq(i).find("li[name=maxPeople]").attr("class"));
				if(curPeople < min || curPeople > max){
					var btn = tables.eq(i).parent("div").next("div").find(".reservationModalBtn")
					btn.attr('disabled', true)
					btn.text('예약 불가')
				}
	}
	
	// 헤더 버튼 조작 시 예약 인원 수 별 가능한 테이블 예약 버튼 보여주기
	$(".people").on(
		"DOMSubtreeModified",
		function(){
			curPeople = Number($(".people").text());
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
	)
	
	// 찜 버튼
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
	
	// 예약 모달 열기
	$(".modalOpen").on("click",()=>{
		if(cus_no == ""){
			alert("로그인 후 예약 가능")
			location.href = "login.cu";
			return;
		}
		$("#modalContainer").removeClass("hidden")
	})
	
	$("#modalCloseButton").on("click", ()=>{
		$("#modalContainer").addClass("hidden")
		$("#date").val(null);
		
		var timeBtn = $(".time").hasClass("disable");
		for(var i = 0; i < timeBtn.length; i++){
			timeBtn.eq(i).addClass("able");
			timeBtn.eq(i).removeClass("disable");
		}
		$(".selectTime").prop("checked", false);
		$(".able").css({
			"background": "white",
			"color": "black"
		});
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
					for(soldOut of data){
						$(".selectTime").val(function(i, val){
							if(soldOut.RES_TIME == val){
								$(".time").eq(i).removeClass("able");
								$(".time").eq(i).addClass("disable");
							}
							return val;
						})
					}
					$(".able").on("click", function(){
						$(this).children(".selectTime").prop("checked", true);
						
						$(".able").css({
							"background": "white",
							"color": "black"
						});
						$(this).css({
							"background": "#9ced92",
							"color": "white",
						});
						
						$(".timeFont").css("font-weight", "300");
						$(this).children(".timeFont").css({
							"font-weight": "400"
						})
						
					})
					
				}
			)
		}
	)
	
	$(".reservation").submit(function(){
		var times = $(".selectTime");
		var isChecked = false;
		for(var i = 0 ; i < times.length ; i++){
			var result = times.eq(i).prop("checked");
			console.log(result);
			if(result){
				isChecked = result;
			}
		}
		
		if(!isChecked){
			alert("시간을 선택해 주세요!")
		}
		
		return isChecked;
	})
	
	
})
