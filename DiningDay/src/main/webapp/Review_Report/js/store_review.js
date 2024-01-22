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
	
	$(".goodBtn").on("click", function(){
		var good = 'material-icons';
		var notGood ='material-symbols-outlined';
		
		var goodBtn = $(this).children("span").eq(0);
		var goodCount = $(this).children("span").eq(3).text();
		
		if(goodBtn.attr("class") == notGood){
			goodBtn.removeClass(notGood);
			goodBtn.addClass(good);
			
		} else {
			goodBtn.removeClass(good);
			goodBtn.addClass(notGood);
		}
		
		
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
})