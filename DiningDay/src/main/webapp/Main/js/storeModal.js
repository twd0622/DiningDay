$(()=>{

	$(".modalOpen").on("click",()=>{
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