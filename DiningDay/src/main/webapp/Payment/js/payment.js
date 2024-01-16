$(()=>{
	$("#paymentBtn").on("click", function(){
		if(!$("#cusCheck").prop("checked")){
			alert("예약자 정보를 확정해 주세요!");
			return;
		}
		
		if(!$("#tableCheck").prop("checked")){
			alert("좌석 정보를 확정해 주세요!");
			return;
		}
		
		
		if($(".choice_menu").find(".choice_list").length == 0){
			alert("메뉴를 선택해 주세요!");
			return;
		}
		var storeName = $("#storeName").text();
		
		// calcSum();
		var priceResult = parseInt($(".price_result").text().replace(/,/g , ''));
		
		requestPay(storeName, priceResult);
		
	})
})

var IMP = window.IMP;
IMP.init('imp13773025');

var today = new Date();
var year = today.getFullYear();
var month = today.getMonth() + 1;
var date = today.getDate();
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = year + month + date + hours +  minutes + seconds + milliseconds;


function requestPay(storeName, priceResult) {
    IMP.request_pay({
        pg : 'html5_inicis.INIpayTest',
        pay_method : 'card',
        merchant_uid: "DD"+makeMerchantUid, 
        name : storeName,
        amount : priceResult,
        buyer_email : buyer_email,
        buyer_name : buyer_name,
        buyer_tel : buyer_tel,
    }, function (rsp) { // callback
        if (rsp.success) {
			rsp.CUS_NO = cus_no;
			rsp.STORE_NO = store_no;
			rsp.SEAT_NO = seat_no;
			
			rsp.CUS_NAME = $("#res_name").text();
			rsp.CUS_TEL = $("#res_tel").text();
			rsp.RES_REQ = $("#cus_plus").val();
			rsp.RES_PEOPLE = $("#table_people").text();
			rsp.RES_DATE = $("#table_date").text();
			rsp.RES_TIME = $("#table_time").text();
			
			var MENU_NO_list = [];
			$(".choice_list").attr("id", function(i, id){
				MENU_NO_list.push(id);
			})
			
			var MENU_NAME_list = [];
			$(".cart_menu_name").attr("id", function(i, id){
				MENU_NAME_list.push(id);
			})
			
			var MENU_COUNT_list = [];
			$(".menuCount").text(function(i, text){
				MENU_COUNT_list.push(text);
			})
			
			
			rsp.MENU_NO = MENU_NO_list.join();
			rsp.MENU_NAME = MENU_NAME_list.join();
			rsp.MENU_COUNT = MENU_COUNT_list.join();
			
			
            $.ajax({
				type: "post",
				url:"paymentInsert.pa",
				data: rsp,
			})
			.done(function(data){
				location.href = "payment_success.pa?RES_NO="+data.RES_NO;								
			})

        } else {
			alert(rsp.error_msg);
        }
    });
}