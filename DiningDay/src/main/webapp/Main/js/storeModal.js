$(()=>{

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
	})
	
	$(".time").on("click", function(){
		$(this).children(".selectTime").prop("checked", true);
		$(".time").css("background", "white");
		$(this).css("background", "orange");
		
	})
	
	
})