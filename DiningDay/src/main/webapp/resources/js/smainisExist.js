/**
 * 
 */

document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/variableCode.js">' +
			   '</script>');
			   
			   
$(() => {
	
	targetColor($("#smainIsExist"));
	showHide(true);
//	$(".STORE_BRT").hide();
//	$(".STORE_BRT").show();
	
	$(document).on("click", "#storeBtn button", function(){
		showHide(false);
		btnName($(this))
	}) 
	
})		

function btnName(btn){
	
	var btnName = btn.text();
	
	switch(btnName){
		case "수정하기": 
			수정버튼.hide(); 
			저장취소버튼.show();
			break;
		case "저장하기":
			수정버튼.show();
			저장취소버튼.hide(); 
			break;
		case "취소하기": 
			수정버튼.show();
			저장취소버튼.hide();
			break;
	}
	
}


function showHide(boolean){
	
	$("#newData input").prop("readonly", boolean);
	$("#newData textarea").prop("readonly", boolean);
	$("#newData select").prop("disabled", boolean);
	$("#newData button").prop("disabled", boolean);
	$(".STORE_BRT button").prop("disabled", false);
	$("#storeBtn button").prop("disabled", false);	
}


let 수정버튼 = $($("#storeBtn div")[0]).find("button");
let 저장취소버튼 =	$($("#storeBtn div")[1]).find("button");
