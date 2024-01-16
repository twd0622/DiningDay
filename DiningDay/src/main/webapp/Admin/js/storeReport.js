$(()=>{
	$(".sRep_no").on("click", function(){
		
		var SREP_NO = $(this).attr("id");
		var CUS_NO = $(this).find(".CUS_NO").attr("id");
		var STORE_NO = $(this).find(".STORE_NO").attr("id");
		location.href='admin_storeReportDetail.ad?SREP_NO='+SREP_NO+'&CUS_NO='+CUS_NO+'&STORE_NO='+STORE_NO;
	})
})