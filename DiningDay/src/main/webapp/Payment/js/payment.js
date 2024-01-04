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
		var cusInfo = [$("#cus_name").val(), $("#cus_phone").val(), $("#cus_email").val()]
		
		var storeName = $("#storeName").text();
		var priceResult = parseInt($(".price_result").text().replace(/,/g , ''));
		
		requestPay(storeName, priceResult, cusInfo);
	})
})

var IMP = window.IMP;
IMP.init('imp13773025');

var today = new Date();   
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours +  minutes + seconds + milliseconds;


function requestPay(storeName, priceResult, cusInfo) {
    IMP.request_pay({
        pg : 'html5_inicis.INIpayTest',
        pay_method : 'card',
        merchant_uid: "IMP"+makeMerchantUid, 
        name : storeName,
        amount : priceResult,
        buyer_email : cusInfo[2],
        buyer_name : cusInfo[0],
        buyer_tel : cusInfo[1],
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log(rsp);
        } else {
           	console.log("결제에 실패했습니다!");
        }
    });
}