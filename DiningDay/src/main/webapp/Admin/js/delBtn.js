$(()=>{
	$(".delBtn").on("click", function() {
		Swal.fire({	
			title: "정말 삭제하시겠습니까?",
			text: "다시 되돌릴 수 없습니다.",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor: "#ED6273",
			cancelButtonColor: "#63ACDE",
			confirmButtonText: "삭제",
			cancelButtonText: "취소",
			showCancelButton: true,
			showConfirmButton: true
			})
			.then((result) => {
				if (result.isConfirmed) {
					Swal.fire({
						title: "삭제됨",
					    icon: "success",
					    showConfirmButton: false,
					    timer: 800
					    
					})
					.then((result) => {
						if($(this).parent("div").parent("div").siblings(".container").children().children().children(".tr1").children("#sRep_no").text().substring(0,2) == "SR"){
							var sRep_no = $(this).parent("div").parent("div").siblings(".container").children().children().children(".tr1").children("#sRep_no").text();
							location.href = "admin_storeReportDelete.ad?SREP_NO="+sRep_no;
						} 
						else if($(this).parent().parent().siblings(".row2").children("#article-table1").children().children(".tr1").children().siblings("td").text().substring(0,2) == "RR") {
							var rRep_no = $("#rrep_no").text();
							var rev_no = $("#rev_no").text();
							location.href = "admin_userReportDelete.ad?RREP_NO="+rRep_no+"&REV_NO="+rev_no;
						} 
						else if($(this).parent().parent().siblings(".row2").children("#article-table1").children().children(".tr1").children().siblings("td").text() == $("#not_no").text() && $("#not_no").text() != '') {
							var notice_no = $(this).parent().parent().siblings(".row2").children("#article-table1").children().children(".tr1").children().siblings("td").text();
			    			location.href = "admin_noticeDelete.ad?NOT_NO="+notice_no;
						} 
						else if($(this).parent().siblings("#div2").children().siblings(".store_no").text().substring(0,2) == "ST") {
							var store_no = $(this).parent().siblings("#div2").children().siblings(".store_no").text();
			    			location.href = "admin_storeDelete.ad?STORE_NO="+store_no;
						} 
						else if($(this).parent().parent().siblings(".row2").children("#article-table1").children().children(".tr1").children("td").text().substring(0,2) == "RV") {
							var review_no = $(this).parent().parent().siblings(".row2").children("#article-table1").children().children(".tr1").children("td").text();
							location.href = "admin_reviewDelete.ad?REV_NO="+review_no;
						}
						
						
						if($(this).parent("td").siblings(".title").text().substring(0,2) == "CU") {
							var cus_no = $(this).parent("td").siblings(".title").text();
							location.href = "admin_userDelete.ad?CUS_NO="+cus_no;
						}
				    	
					})
				}
			});
	})
})