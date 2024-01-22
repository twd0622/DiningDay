$(()=>{
	// -------------- 찜 버튼 ------------------------
	$.ajax({
		type: "get",
		url:"getLike.ma",
		data: {
			CUS_NO: cus_no,
			STORE_NO: $(".store_profile").attr("id")
		}
	})
	.done(function(data){
		if(data == '1'){
			$("#like_btn").prepend('<span class="material-icons profile_btn_icon like" style="color: #E21818;">favorite</span>');
		} else {
			$("#like_btn").prepend('<span class="material-symbols-outlined profile_btn_icon unlike" style="color:#E21818;">favorite</span>');
		}
	})
	
	
	$("#like_btn").on("click",function(){
		if(cus_no == ""){
			alert("로그인 후 가능");
			return;
		}
			
		var url;
		var resultFuc;
		if($(this).children(".unlike").length == 1){
			url = "insertLike.ma";
			
			resultFuc = (result) =>{
				if(result == "1"){
					$(".unlike").remove();
					$("#like_btn").prepend('<span class="material-icons profile_btn_icon like" style="color: #E21818;">favorite</span>');
					$(".like_count").text((i, oldCount)=>{
						return Number(oldCount) + 1
					})				
				}
			}
		} else{
			if(confirm('찜을 취소하시겠습니까?') == true) {
				url = "deleteLike.ma"
				resultFuc = (result) =>{
					if(result == "1"){
						$(".like").remove();
						$("#like_btn").prepend('<span class="material-symbols-outlined profile_btn_icon unlike" style="color:#E21818;">favorite</span>');
						$(".like_count").text((i, oldCount)=>{
							return Number(oldCount) - 1
						})				
					}
				}
			}
			else return;
		}
			
		$.ajax({
			type: "post",
			url: url,
			data: {
				CUS_NO: cus_no,
				STORE_NO: $(".store_profile").attr("id")
			}
		})
		.done(function(data){
			resultFuc(data);
		})
			
	})
	// -------------- 찜 버튼 기능 종료 ------------------------
	
	// -------------- 리뷰 공감 버튼 --------------------------
	$.ajax({
		type: "get",
		url: "checkReviewLike.re",
		data: {
			STORE_NO: $(".store_profile").attr("id"),
			CUS_NO:cus_no
		}
		
	})
	.done(function(data){
		for(rev_no of data){
			var goodBtnIcon = $("#"+rev_no.REV_NO).find(".goodBtn").children("span").eq(0);
			goodBtnIcon.removeClass("material-symbols-outlined");
			goodBtnIcon.addClass("material-icons");
		}
		
	})
	
	$(".goodBtn").on("click", function(){
		if(cus_no == ""){
			alert("로그인 후 가능");
			return;
		}
		
		var good = 'material-icons';
		var notGood ='material-symbols-outlined';
	
		var goodBtnIcon = $(this).children("span").eq(0);
		var good_count = Number($(this).children("span").eq(2).text().slice(1, -1));
		var good_count_tag = $(this).children("span").eq(2);
		var url;
		var upDown;
		if(goodBtnIcon.attr("class") == notGood){
			url = "reviewLikeUP.re";
			
			upDown = function(){
				goodBtnIcon.removeClass(notGood);
				goodBtnIcon.addClass(good);
				good_count_tag.text('('+ (good_count + 1) +')')
			}
			
		} else {
			url = "reviewLikeDOWN.re";
			
			upDown = function(){
				goodBtnIcon.removeClass(good);
				goodBtnIcon.addClass(notGood);
				good_count_tag.text('('+ (good_count - 1) +')')
			}
		}
		
		debugger
		$.ajax({
			type: "post",
			url: url,
			data: {
				CUS_NO: cus_no,
				REV_NO: $(this).parents(".review").attr("id")
			}
		})
		.done(function(data){
			debugger;
			if(data == 1){
				upDown();
			}
		})
		
		
		
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
})