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
	
	
})