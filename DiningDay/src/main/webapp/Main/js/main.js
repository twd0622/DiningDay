$(()=>{
	// 모달창 띄우기
	$("#locationBtn").on(
		"click",
		function(){
			$("#modal_layer").css(
				"display", ""
			)
		}
	)
	
	$("#searchBtn").on(
		"click",
		function(){
			var form = $("#searchForm");
			
			form.submit();
		}
	)
	
	$("#searchForm").submit(()=>{
		
		if($("#searchInput").val() == ""){
			alert("검색어를 입력해주세요!")
			return false;
		}
		
		return true;
	})
	
	$(".leftBtn").on("click",function(){
		$(".recomannedStroe").css({
			transform: "translate(0)"
		})
	})
	
	$(".rightBtn").on("click",function(){
		$(".recomannedStroe").css({
			transform: "translate(-1248px)"
		})
	})
	
})