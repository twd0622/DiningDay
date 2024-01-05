$(()=>{
	var today = $("#dateOption").val(); 
	
	$("#dateOption").on(
		"change",
		function(){
			if($(this).val() == ''){
				$(this).val(today);
			}
			
			$.ajax({
				type: "get",
				url: "dateSession.ma",
				data:{
					date : $(this).val()
				}
			})
			
		}
	)
	var optionModal = $("#peopleOptionModal");
	
	$("#peopleOption").on(
		"click",
		function(){
			optionModal.css("display", "block")
		}
	)
	
	$(window).on(
		"click",
		function(e){
			if (e.target == optionModal[0]) {
				optionModal.css("display" , "none")
			}
		}
	)

	$(".decrease").on(
		"click",
		function(){
			var curPeople = Number($(".people").text()); 
			if(curPeople > 1){
				var changePeople = curPeople - 1;
				$(".people").text(changePeople)
				$("#peopleOption").val("인원 " + changePeople +"명")
				
				$.ajax({
					type: "get",
					url: "peopleSession.ma",
					data:{
						people : changePeople
					}
				})
			}
		}
	)
	
	$(".increase").on(
		"click",
		function(){
			var changePeople = Number($(".people").text()) + 1;
			$(".people").text(changePeople)
			$("#peopleOption").val("인원 " + changePeople +"명")
			
			$.ajax({
					type: "get",
					url: "peopleSession.ma",
					data:{
						people : changePeople
					}
				})
			
		}
	)

})