$(()=>{

	$(".store_result_btn").on(
		"click",
		function(){
			var STORE_NO = $(this).attr('name');
			location.href = 'store.ma?STORE_NO='+STORE_NO;
		}
	)
	
	
})
// ${storeInfo.STORE_TEL}
//STORE_NO
//, STORE_NAME
//, STORE_TEL
//, STORE_LOCATION
//, STORE_CATEGORY
//, STORE_INFO
//, STORE_PLUS
//, STORE_TIME
//, STORE_BT
//, STORE_LO
//, SOTRE_CLOSE
//, STORE_SCORE
//, LIKE_COUNT

// 요일 별 시간 설정? 몇시부터 몇시까지? 휴무 일은?

//${menu.MENU_PRICE}
// MENU_NO
//, STORE_NO
//, MENU_NAME
//, MENU_PRICE
//, MENU_HIDE
//, MENU_INFO

//${table.SEAT_OC}
//SEAT_NO
//, STORE_NO
//, SEAT_NAME
//, SEAT_USETIME
//, SEAT_MIN
//, SEAT_MAX
//, SEAT_CONTENT
//, SEAT_OC