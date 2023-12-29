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
	var optionModal = $("#peopleOptionModal");
	
	$("#peopleOption").on(
		"click",
		function(){
			if(optionModal.hasClass("hidden")){
				optionModal.css("display", "")
				optionModal.removeClass("hidden")
			} else {
				optionModal.css("display", "none")
				optionModal.addClass("hidden")
			}
			
		}
	)
	
	$(window).on(
		"click",
		function(e){
			if (e.target != optionModal[0]) {
				optionModal.css("display" , "none")
				optionModal.addClass("hidden")
  			}
		}
	)

	

	$(".decrease").on(
		"click",
		function(){
			var curPeople = Number($(".people").text()); 
			if(curPeople > 1){
				$(".people").text(curPeople - 1)
				$("#peopleOption").val("인원 " + (curPeople - 1) +"명")
			}
		}
	)
	
	$(".increase").on(
		"click",
		function(){
			var curPeople = Number($(".people").text());
			$(".people").text(curPeople + 1)
			$("#peopleOption").val("인원 " + (curPeople + 1) +"명")
		}
	)

	



})