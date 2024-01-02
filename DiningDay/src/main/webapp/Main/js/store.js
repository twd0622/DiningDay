$(()=>{
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
	
	
	$(".reservationModalBtn").on(
		"click",
		function(){
			var table_name = $(this).parents(".table_res").prev().children(".table_name").text();
			$("#SEAT_NAME").text(table_name);
			
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
