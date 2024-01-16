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
						debugger;
						if($(this).parent("td").siblings(".title").text().substring(0,2) == "NO") {
							var notice_no = $(this).parent("td").siblings(".title").text();
			    			location.href = "admin_noticeDelete.ad?NOT_NO="+notice_no;
						} else if($(this).parent("td").siblings(".title").text().substring(0,2) == "ST") {
							var store_no = $(this).parent("td").siblings(".title").text();
			    			location.href = "admin_storeDelete.ad?STORE_NO="+store_no;
						} else if($(this).parent("td").siblings(".title").text().substring(0,2) == "SR") {
							var sRep_no = $(this).parent("td").siblings(".title").text();
			    			location.href = "admin_storeReportDelete.ad?SREP_NO="+sRep_no;
						} else if($(this).parent("td").siblings(".title").text().substring(0,2) == "RR") {
							var cRep_no = $(this).parent("td").siblings(".title").text();
			    			location.href = "admin_userReportDelete.ad?CREP_NO="+cRep_no;
						} else if($(this).parent("td").siblings(".title").text().substring(0,2) == "CU") {
							var cus_no = $(this).parent("td").siblings(".title").text();
							location.href = "admin_userDelete.ad?CUS_NO="+cus_no;
						}
				    	
					})
				}
			});
	})
})