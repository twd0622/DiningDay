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
	
	var today = $("input[name=RES_DATE]").val(new Date().toISOString()
														.substring(0, 10));
	resData = selectDate($(today).val());
	
	$.ajax({
		url: "sResPro.st",
		data: {
			RES_DATE : resData,
			REQ_STATE : resState
		},
		async: false
	})
	.done(function(data){
		for(let res of data){
			$("#tbody_1").append(trTaghtml(res));
		}
		
		$("form").append("<input name='REQ_STATE' type='hidden' value='" + data[0].REQ_STATE + "'>");
	})
	.fail()
	
	resData = selectDate($(today).val());
	
	$("#changePageBtn").find("button").on("click", function(){

		var isTrue = changePageBtnFunc(this);
		
		if(!isTrue) return;
		
		$.ajax({
			data: {
				RES_DATE : resData,
				REQ_STATE : resState
			},
			url: "sResPro.st",
			async: false		
		})
		.done(function(data){
			$("#tbody_1").empty();
			
			for(let res of data){
				$("#tbody_1").append(trTaghtml(res));
			}
		})
	})
	
	$("input[name=RES_DATE]").on("change", function(){
		
		resData = selectDate($(this).val());
		resState = $("input[name=REQ_STATE]").val();
		
		$.ajax({
			data: {
				RES_DATE : resData,
				REQ_STATE : resState
			},
			url: "sResPro.st",
			async: false		
		})
		.done(function(data){
			debugger;
			$("#tbody_1").empty();
			
			for(let res of data){
				$("#tbody_1").append(trTaghtml(res));
			}
		})
	})
	
})

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
var selectDate = date => date.replaceAll("-", "");
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

function trTaghtml(data){

	var btnTag = "<button id='save' type='button' class='btn btn-outline-success'" +
				 "style='text-align: center;width:80px;height:50px;margin: 0 auto;'>완료</button>" +
				 "<button type='button' class='btn btn-outline-danger' id='cancel'" +
				 "style='text-align: center;width:80px;height:50px;margin: 0 auto;'>취소</button>" +
				 "<button type='button' class='btn btn-outline-warning' id='noshow'" +
				 "style='text-align: center;width:80px;height:50px;margin: 0 auto;'>노쇼</button>" 
	
	switch(data.REQ_STATE){
		
		case '1': btnTag = ''; 
			break;
		case '2': 
		case '3': btnTag = "<button type='button' class='btn btn-outline-danger' id='cancel'" +
				 		   "style='text-align: center;width:80px;height:50px;margin: 0 auto;'>취소</button>";
			break;
	}
	
	return "<tr>" +
		"<td>" + data.MERCHANT_UID + "</td>" +
		"<td>" + data.CUS_NAME + 
		"<input type='hidden' value='" + data.CUS_NO + "'>" +
		"<input type='hidden' value='" + data.RES_NO + "'></td>" +
		"<td>" + data.CUS_TEL + "</td>" +
		"<td>" + data.SEAT_NAME +  
		"<input type='hidden' value='" + data.SEAT_NO + "'></td>" +
		"<td>" + data.RES_PEOPLE + "</td>" +
		"<td>" + data.RES_TIME + "</td>" +
		"<td><textarea cols='20' rows='2' style='resize: none;'>" + data.RES_REQ + "</textarea></td>" +
		"<td>" +
			"<div>" +
				"<div>" + data.MENU_NAME + "외 7개</div>" +	
				"<div>" +
					"<a href='#' style='f1ont-size: 18px;'>(상세보기)</a>" +
				"</div>" +
			"</div>" +
		"</td>" +
		"<td>" + btnTag + "</td>" +
	"</tr>"
}


























