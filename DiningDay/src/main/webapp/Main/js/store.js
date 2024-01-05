$(()=>{
	// 테이블 정보 출력
	var curPeople = Number($(".people").text());
	var tables = $(".table_ ul");
	for(var i = 0; i < tables.length; i++){
				var min = Number(tables.eq(i).find("li[name=minPeople]").attr("class"));
				var max = Number(tables.eq(i).find("li[name=maxPeople]").attr("class"));
				if(curPeople < min || curPeople > max){
					tables.eq(i).parent("div").next("div").find(".reservationModalBtn").css(
						"display", "none"
					)	
				}
	}
	
	// 예약 인원 수 별 가능한 테이블 예약 버튼 보여주기
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
				if(curPeople < min || curPeople > max){
					tables.eq(i).parent("div").next("div").find(".reservationModalBtn").css(
						"display", "none"
					)	
				} else {
					tables.eq(i).parent("div").next("div").find(".reservationModalBtn").css(
						"display", "block"
					)
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
	
	// 예약 버튼 클릭시 모달 창에 정보 넣기
	$(".reservationModalBtn").on(
		"click",
		function(){
			var table_name = $(this).parents(".table_res").prev().children(".table_name").text();
			$("#SEAT_NAME").text(table_name);
			$("input[name=SEAT_NAME]").val(table_name);
			
			var seat_no = $(this).parents(".table_").attr("id");
			$("#seat_no").val(seat_no);
			
			$.ajax({
				type: "get",
				url: "getSession.ma",
				dataType:"json"
			})
			.done(
				function(data){
					$("#res_date_input").val(data.date);
					$("#res_date").text(data.date);
					$("#res_people_input").val(data.people);
					$("#res_people").text(data.people);
					
				}
			)
		}
	)
})
