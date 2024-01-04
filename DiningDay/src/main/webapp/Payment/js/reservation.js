$(()=>{
	
	$("#optionBox").css("display", "none");
	$(".fixed-top").css("justify-content", "space-around");
	
	$(".decideCusBtn").on(
		"click",
		function(){
			$(this).siblings("input[type=checkbox]").prop("checked", true);
			$(".cus_option").empty();
			$(".cus_option").append('<span class="cart_sub_tit">예약자 정보</span>');
			$(".cus_option").append('<div><span>예약자 이름</span><span>' + $("#cus_name").val() + '</span></div>');
			$(".cus_option").append('<div><span>휴대폰 번호</span><span>' + $("#cus_phone").val() + '</span></div>');
			$(".cus_option").append('<div><span>이메일</span><span>' + $("#cus_email").val() + '</span></div>');
			$(".cus_option").append('<div><span>요청 사항</span><span>' + $("#cus_plus").val() + '</span></div>');
			
		}
	)
	
	$(".decideTableBtn").on(
		"click",
		function(){
			$(this).siblings("input[type=checkbox]").prop("checked", true);
			$(".res_option").empty();
			$(".res_option").append('<span class="cart_sub_tit">좌석 정보</span>');
			$(".res_option").append('<div><span>좌석명</span><span>' + $("#table_name").text() + '</span></div>');
			$(".res_option").append('<div><span>인원수</span><span>' + $("#table_people").text() + '</span></div>');
			$(".res_option").append('<div><span>날짜</span><span>' + $("#table_date").text() + '</span></div>');
			$(".res_option").append('<div><span>시간</span><span>' + $("#table_time").text() + '</span></div>');
		}
	)
	
	$(".defaultBtn").on(
		"click",
		function(){
			$(".choice_menu ul").empty();
			$(".choice_menu ul").append('<li class="choice_list defaultMenu"><div style="display: flex; justify-content: space-around;"><span>기본 예약금</span><span class="price">10,000 원</span></div></li>');
			calcSum();
		}
	)
	
	$(".menuPlusBtn").on("click",function(){
		$(".defaultMenu").remove();
		var no = $(this).find(".menu_info").attr("name");
		var price = $(this).find(".menu_price").text();
		
		if($("."+no).length > 0){
			$("."+no).find(".menuCount").text((i, oldCnt)=>{
				return Number(oldCnt) + 1;
			});
			$("."+no).find(".price").text(function(i, oldPrice){
				var newPrice = parseInt(oldPrice.replace(/,/g , '')) + parseInt(price.replace(/,/g , ''));
				return newPrice.toLocaleString('ko-KR') + ' 원';
			})
			calcSum();
			return;
		}
			
		var menuInfo = '<li class="choice_list cart_menu '+$(this).find(".menu_info").attr("name")+'"><div style="width: 80%;"><div>'
		 +'<span>'+ $(this).find(".menu_name").text() +'</span>'
		 +'<span class="price">'+ price +'</span></div><div class="count_box"><span class="minus">-</span><span class="menuCount" style="font-size: 18px;">1</span><span class="plus">+</span></div></div><span class="material-symbols-outlined deleteBtn" style="font-size: 18px;">delete</span></li>'
		
		$(".choice_menu ul").append(menuInfo);
		
		$("."+no).find(".plus").on("click", function(){
			$(this).siblings(".menuCount").text((i, oldCnt)=>{
				return Number(oldCnt) + 1;
			});
			
			$(this).parent(".count_box").prev("div").children(".price").text(function(i, oldPrice){
				var newPrice = parseInt(oldPrice.replace(/,/g , '')) + parseInt(price.replace(/,/g , ''));
				return newPrice.toLocaleString('ko-KR') + ' 원';
			});
			calcSum();
		})
		
		$("."+no).find(".minus").on("click", function(){
			var menuCount = $(this).siblings(".menuCount").text();
			
			if (menuCount == '1'){
				return;
			}
			
			$(this).siblings(".menuCount").text((i, oldCnt)=>{
				return Number(oldCnt) - 1;
			});
			
			$(this).parent(".count_box").prev("div").children(".price").text(function(i, oldPrice){
				var newPrice = parseInt(oldPrice.replace(/,/g , '')) - parseInt(price.replace(/,/g , ''));
				return newPrice.toLocaleString('ko-KR') + ' 원';
			});
			calcSum();
		})
		
		$(".deleteBtn").on("click",function(){
				$(this).parent(".cart_menu").remove();
				calcSum();
		})
		
		calcSum();
	})
	
		
})

function calcSum(){
	var resultPrice = 0;
	$('.choice_menu').find(".price").text(function(i,oldText){
		
		resultPrice += parseInt(oldText.replace(/,/g , ''));			
	});
	
	$(".price_result").text(resultPrice.toLocaleString('ko-KR') + " 원");
}



