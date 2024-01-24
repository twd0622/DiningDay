$(()=>{
	
	$(".goStore").on("click", function(){
		var store_no = $(this).attr("class").replace("goStore ", "");
		
		location.href = "store.ma?STORE_NO="+store_no;
	})
	
	// -------------- 리뷰 공감 버튼 --------------------------
	$.ajax({
		type: "get",
		url: "checkReviewLike.cu",
		data: {
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
		
		$.ajax({
			type: "post",
			url: url,
			data: {
				CUS_NO: cus_no,
				REV_NO: $(this).parents(".review").attr("id")
			}
		})
		.done(function(data){
			if(data == 1){
				upDown();
			}
		})
		
		
		
	})
	
})