$(()=>{
	$("#reportBtn").on("click", function(){
		if($(".reportname").val().trim() == ''){
			alert("제목을 입력하세요!");
			return;
		}
		
		if($(".reportcontent").val().trim() == ''){
			alert("내용을 입력하세요!");
			return;
		}
		
		$("#reportBtn").submit();
	})
})