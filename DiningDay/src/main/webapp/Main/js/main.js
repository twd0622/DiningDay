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
	
	// 추천 식당
	$.ajax({
		type: "get",
		url:"getMainInfo.ma",
		dataType:"json"
	})
	.done(function(data){
		for(storeInfo of data){
			var recomannedStore = 
			 '<div class="col-lg-3 mb-4">'
	        +    '<div class="portfolio-item">'
	        +        '<a class="portfolio-link" href="store.ma?STORE_NO='+storeInfo.STORE_NO+'">'
	        +            '<div class="portfolio-hover">'
	        +                '<div class="portfolio-hover-content">'
	        +                	'<div class="storeInfo">'
	        +                		'<div class="storeInfo storeInfo_top">'
	        +                    		'<span style="font-size: 20px; font-weight: bold">'+storeInfo.STORE_NAME+'</span>'
	        +                    		'<span style="font-size: 14px;">'+storeInfo.STORE_CATEGORY+' | '+storeInfo.STORE_DETAIL+'</span>'
	        +                		'</div>'
	        +                		'<div class="storeInfo storeInfo_bottom">'	
	        +                    		'<span><span class="material-icons icon" style="color: #F7CE3E;">grade</span> 점수(리뷰 갯수)</span>'
	        +                    		'<span><span class="material-icons icon" style="color: #E21818;">favorite</span> '+storeInfo.LIKE_COUNT+'</span>'
	        +                		'</div>'
	        +                	'</div>'
	        +                '</div>'
	        +            '</div>'
	        +            '<img class="img-fluid" src="upload/'+storeInfo.PHOTO_NAME+'" alt="'+storeInfo.PHOTO_NAME+'" />'
	        +        '</a>'
	        +        '<div class="portfolio-caption">'
	        +            '<div class="portfolio-caption-heading">'+storeInfo.STORE_NAME+'</div>'
	        +        '</div>'
	        +    '</div>'
	        +'</div>'
			
			$(".recomannedStore").append(recomannedStore);
		}
		
		
	})
	
	$(".leftBtn").on("click",function(){
		$(".recomannedStore").css({
			transform: "translate(0)"
		})
	})
	
	$(".rightBtn").on("click",function(){
		$(".recomannedStore").css({
			transform: "translate(-1248px)"
		})
	})
	
})