$(()=>{
	$(".storeName").on("click", function(){
		location.href = "admin_storeDetail.ad?STORE_NO="+$(this).attr("id");
	})
})