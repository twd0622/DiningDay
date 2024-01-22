$(()=>{
	
	$(".goStore").on("click", function(){
		var store_no = $(this).attr("class").replace("goStore ", "");
		
		location.href = "store.ma?STORE_NO="+store_no;
	})
	
})