$(()=>{
	$("#myform").submit(function(){
		star = true;
		for(var i = 0 ; i < $("input[type=radio]").length ; i ++){
			if($("input[type=radio]").eq(i).prop("checked")){
				star = false;
			}
		}
		
		if(star){
			alert("별점을 입력하세요!");
			return false;
		}
				
		if($(".review_content").val() == undefined || $(".review_content").val() == null || $(".review_content").val() == ""){
			alert("내용을 입력하세요!");
			return false;
		}
		
		return true;
	})
})