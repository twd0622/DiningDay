/**
 * 
 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/variableCode.js">' +
			    '</script>');
			    
/**
 * dateResult.js 파일	 사용법
 * dateTotal.year => 현재 년도 출력
 * dateTotal.month => 현재 월 출력
 * dateTotal.day => 현재 일 출력
 * dateTotal.getdayweek => 현재 요일 출력
 * 
 * 2023년01시22분15시30분20초 
 */

$(() => {
	
	targetColor($("#sRes"));
	
	var today;
	if($("#dateCheck").val() != ''){
		resData = $("#dateCheck").val();
		today = $("input[name=RES_DATE]").val($("#dateCheck").val().replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3'));
		$("#dateCheck").val(null);
	} else {
		today = $("input[name=RES_DATE]").val(new Date().getFullYear() + "-" +new Date().getMonth() + 1 + "-" + new Date().getDate());
		resData = selectDate($(today).val());
		$("#dateCheck").val(null);															
	}
	
	$.ajax({
		type: "get",
		url: "sResPro.st",
		data: {
			RES_DATE : resData,
			REQ_STATE : '0'
		},
		async: false
	})
	.done(function(data){
		
		var i = 0;
		$("input[name=REQ_STATE]").remove();
		
		for(let res of data){
			i++;
			$("#tbody_1").append(trTaghtml(res, i));
		}
		
		$("form").append("<input name='REQ_STATE' type='hidden' value='" + resState + "'>");
		paging("#tbody_1 tr", 5, 0);
	})
	.fail()
	
	resData = selectDate($(today).val());
	
	$("#changePageBtn").find("button").on("click", function(){

		var isTrue = changePageBtnFunc(this);
		
		if(!isTrue) return;
		
		$.ajax({
			type: "get",
			data: {
				RES_DATE : resData,
				REQ_STATE : resState
			},
			url: "sResPro.st"
		})
		.done(function(data){
			
			var i = 0;
			$("input[name=REQ_STATE]").remove();
			$("form").append("<input name='REQ_STATE' type='hidden' value='" + resState + "'>");
			$("#tbody_1").empty();
			
			for(let res of data){
				i++;
				$("#tbody_1").append(trTaghtml(res, i));
			}
			paging("#tbody_1 tr", 5, 0);
		})
	})
	
	$("input[name=RES_DATE]").on("change", function(){
		
		resData = selectDate($(this).val());
		resState = $("input[name=REQ_STATE]").val();
		
		$.ajax({
			type: "get",
			data: {
				RES_DATE : resData,
				REQ_STATE : resState
			},
			url: "sResPro.st"
		})
		.done(function(data){
			var i = 0;
			$("input[name=REQ_STATE]").remove();
			$("form").append("<input name='REQ_STATE' type='hidden' value='" + resState + "'>");
			$("#tbody_1").empty();
			
			for(let res of data){
				i++;
				$("#tbody_1").append(trTaghtml(res, i));
			}
			paging("#tbody_1 tr", 5, 0);
		})
	})
	
	$(document).on("click", ".0", function(){

		var targetResNo = $(this).closest("tr").find(".res1").val();
		var resCheck = dataChangeBtn(resState, this);
		var _TR_NO = $(this).closest("tr").attr("class");
		var isTrue = false;
		
		if(resCheck != '' && resCheck != undefined){
			if(!confirm("고객의 요청에 의한 삭제가 정말 맞습니까?\r\n정말 취소하시겠습니까?")){
				resState = $("input[name=REQ_STATE]").val();
				return;
			}
			
			$.ajax({
				type: "post",
				data: { 
					MERCHANT_UID: resCheck,
					storeRes: "resTrue"
				},
				url: "payment_cancel.pa",
				async: false
			})
			.done()
			.fail()
			isTrue = true;
		} 
		
		if(!isTrue){
			if(!confirm(alertText)){
				return;
			}
		}
		$.ajax({
			type: "post",
			data: {
				REQ_STATE: resState,
				RES_NO: targetResNo,
				TR_NO: _TR_NO
			},
			url: "sResUpdate.st"
		})
		.done(function(data){
			resState = $("input[name=REQ_STATE]").val();
			$("." + data.TR_NO).remove();
			paging("#tbody_1 tr", 5, 0);
		})
	})
	
	$(document).on("click", ".aTag", function(){
		var showDetailMenuList = $(this).closest("div").find("input").val();
		var showDetailMenu = showDetailMenuList.split(",");
		var msg = '';
		var price = 0;
		
		for(var i = 0; i < showDetailMenu.length; i++){
			msg += "<div style='display: flex; justify-content: center;' class='mt-2 p-2'>" +
			"<div style='width:350px; text-align: left;'>메뉴 이름 : " + 
			showDetailMenu[i].split("/")[0] + "</div> <div style='width:125px;'>수량 " 
			+ showDetailMenu[i].split("/")[1] + "개</div>" + "<div style='width:300px;'>가격(합) : " 
			+ showDetailMenu[i].split("/")[2] + "</div></div>";
			
			price += parseInt(showDetailMenu[i].split("/")[2]);
		}
		msg = "<div style='background-color:white;'>" + msg + "</div>";
		msg += "<div class='mt-3' style='display:flex; justify-content: center;'>" +
		"<div class='p-3' style='background-color:white; font-size:22px; width:350px;'>총 금액 : " + price + "원</div></div>";
		
		Swal.fire({
			html: msg
		})
	})	
})	

function dataChangeBtn(e1, e2){
	
	var targetRescode = $($(e2).closest("tr").find("td")[0]).text();
	var targetName = $(e2).text();
	alertText = '';
	alertText = '추후에 고객의 변경 요청이 있을 수 있습니다.\r\n변경 하시겠습니까?';
		
	if(e1 > 0){
		resState = '0';
		return;
	}
	 
	switch(targetName){
		case '취소': 
			resState = '1'; 
			break;
		case '완료': 
			resState = '2'; 
			targetRescode = '';
			break;
		case '노쇼': 
			resState = '3';
			targetRescode = ''; 
			break;
	}
	
	return targetRescode;
}


function changePageBtn(btnName){

	resState = '0';
	
	switch(btnName){
		case '예약 취소 명단': resState = '1'; break;
		case '예약 완료 명단': resState = '2'; break;
		case '예약 노쇼 명단': resState = '3'; break;
	}
}

/** 전역변수 모음 시작 */
let resState = '0';
let resData = '';
let REQ_STATE;
let RES_DATE;
let selectDate = date => date.replaceAll("-", "");
let alertText = '';
/** 전역변수 모음 끝 */

let changePageBtnFunc = (event) => {
	var check = true;
	var targetPageName = $(event).text();
		
	$("#pageName").text(targetPageName);
	
	if(resData === '' || resData === null || resData === undefined){
		alert("관리자에게 문의하세요:)");
		return;
	}
	changePageBtn(targetPageName);
	RES_DATE = resData;
	REQ_STATE = resState;
		
	return check;
}

function trTaghtml(data, i){
	
	var menuPlus = "<div>" +
				   	   "<a class='aTag' href='#'>(상세보기)</a> <input type='hidden' value='" + data.MENU_NAME + "'>" + 
				   "</div>"
	var btnTag = "<button id='save' type='button' class='btn btn-outline-success 0'" +
				 "style='text-align: center;width:80px;height:50px;margin: 0 auto;'>완료</button>" +
				 "<button type='button' class='btn btn-outline-danger 0' id='cancel'" +
				 "style='text-align: center;width:80px;height:50px;margin: 0 auto;'>취소</button>" +
				 "<button type='button' class='btn btn-outline-warning 0' id='noshow'" +
				 "style='text-align: center;width:80px;height:50px;margin: 0 auto;'>노쇼</button>" 
	
	switch(data.REQ_STATE){
		
		case '1': btnTag = "<button type='button' class='btn btn-outline-danger 0' id='cancel'" +
				 		   "style='text-align: center;width:80px;height:50px;margin: 0 auto;' disabled>취소됨</button>"; 
			break;
		case '2': 
		case '3': btnTag = "<button type='button' class='btn btn-outline-danger 0' id='cancel'" +
				 		   "style='text-align: center;width:80px;height:50px;margin: 0 auto;'>취소</button>";
			break;
	}
	
	if(data.MENU_NAME.length < 1){
		data.MENU_NAME = '메뉴 없음';
		menuPlus = '';
	} else {
		data.MENU_NAME = (data.MENU_NAME.split(",")[0]).split("/")[0] + 
			"(" + (data.MENU_NAME.split(",")[0]).split("/")[1] + ") 외 " + 
			data.MENU_NAME.split(",").length + "개";
	}	
	
	return "<tr class='" + i + "'>" +
		"<td>" + data.MERCHANT_UID + "</td>" +
		"<td>" + data.CUS_NAME + 
		"<input type='hidden' value='" + data.CUS_NO + "'>" +
		"<input type='hidden' class='res1' value='" + data.RES_NO + "'></td>" +
		"<td>" + data.CUS_TEL + "</td>" +
		"<td>" + data.SEAT_NAME +  
		"<input type='hidden' value='" + data.SEAT_NO + "'></td>" +
		"<td>" + data.RES_PEOPLE + "</td>" +
		"<td>" + data.RES_TIME + "</td>" +
		"<td><textarea cols='20' rows='2' style='resize: none;'>" + data.RES_REQ + "</textarea></td>" +
		"<td>" +
			"<div>" +
				"<div>" + data.MENU_NAME + "</div>" + menuPlus +
			"</div>" +
		"</td>" +
		"<td>" + btnTag + "</td>" +
	"</tr>"
}
