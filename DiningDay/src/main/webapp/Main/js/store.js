$(()=>{
	
	$(".reservationBtn").on(
		"click",
		function(){
			var store_no = $(".store_profile").attr("id");
			var table_no = $(this).closest(".table_").attr("id");
			
			$.ajax({
				type: "get",
				url: "getTable.ma",
				data:{
					"STORE_NO": store_no,
					"TABLE_NO": table_no
				},
				dataType:"json"
			})
			.done(
				function(data){
					console.log(data);
					
					$("#SEAT_NAME").text(data.SEAT_NAME);
					$("#SEAT_MIN").text(data.SEAT_MIN);
					
				}
			)
		}
	)
	
	$(".decreaseBtn").on(
		"click",
		function(){
			$(this).siblings("#SEAT_MIN").text(
				function(new_text, old_text){
					new_text = old_text - 1;
					debugger;
				}
			);
			debugger;
		}
	)
	
})
