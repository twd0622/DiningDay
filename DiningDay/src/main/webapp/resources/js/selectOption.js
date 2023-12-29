$(()=>{
	var today = $("#dateOption").val(); 
	
	$("#dateOption").on(
		"change",
		function(){
			if($(this).val() == ''){
				$(this).val(today);
			}
		}
	)
	
	$("#peopleOption").on(
		"click",
		function(){
			var optionModal = $("#peopleOptionModal");
			debugger;
			if(optionModal.hasClass("hidden")){
				optionModal.css("display", "")
				optionModal.removeClass("hidden")
			} else {
				optionModal.css("display", "none")
				optionModal.addClass("hidden")
			}
			
		}
	)
	
})