/**
 * 
 */

/** 사진 미리보기 적용 js파일 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/store_Photo.js">' +
			   '</script>');

/** 페이징 처리 js파일 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/variableCode.js">' +
			   '</script>');

/** timepicker js파일 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/timepicki.js">' +
			   '</script>');			   
			   
$(() => {
	
//	$.ajax({
//		url:"storeSelect.st",
//		data:"",
//	})
//	.done(
//		function(data){
//			if(data){
//				
//			}
//		}
//	)
//	.fail(
//		function(){
//			
//		}
//	)

	targetColor($("#smain"));
	$("#restTime").hide();
	$("#weekdiv").hide();
	customSelect2($('#storeCategory'));
	customSelect2($("#weekdays"));
	
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));			
	$('[data-toggle="tooltip"]').tooltip();
	
	ValidationCheckBox();	//	submit 실행 전 유효성 체크
	isRestWeek;				//	휴무일 선택 여부
	saveRestWeek;			//	휴무일 저장 여부
	timePicker();			//	타임피커 적용 
	saveStore;
	
	$("input[name=hiddenfile]").on("click", function(){
		var index = ($(this).attr("id")).split("_")[1];
		$("#inputfile_" + index).click();
	})
	
	for(var i = 0; i < $(".validCheckBox").length; i++){
		$($("div[name=storeBold]")[i]).css(variable.borderlist);
	}
})

const variable = {
	borderlist:{
		"border-width":"2px",
		"border-color":"red",
		"border-style":"solid"
	},
	valid: false,
	value: ""	
}; 

function ValidationCheckBox(){
	$("form").append(
		'<input class="validCheckBox 0" type="checkbox" disabled>' +
 		'<input class="validCheckBox 1" type="checkbox" disabled>' +
		'<input class="validCheckBox 2" type="checkbox" disabled>' +
		'<input class="validCheckBox 3" type="checkbox" disabled>' +
		'<input class="validCheckBox 3" type="checkbox" disabled>' +
		'<input class="validCheckBox 3" type="checkbox" disabled>' +
		'<input class="validCheckBox 3" type="checkbox" disabled>' +
		'<input class="validCheckBox 5" type="checkbox" disabled>'
	);
}

var timePicker = function(){
	$("input[name=timepicker]").timepicki();
}

/** 식당 정보 저장 함수 시작 */
var saveStore = $("#saveStore").on("click", function(){
	
	var btnclass = "btn btn-success btn-lg";
	var btntext = "저장하기";
	var btncheck = false;
	variable.valid = false;
	
	if($(this).text() == "저장하기"){
		btnclass = "btn btn-danger btn-lg";
		btntext = "취소하기";
		btncheck = true;	
	}
	
	$(this).text(btntext);
	$(this).attr("class", btnclass);
	$(this).closest("div[name=storeBold]").find("textarea").prop("readonly", btncheck);
	$(this).closest("div[name=storeBold]").find("select").prop("disabled", btncheck);	
	
	if($('#storeCategory').val() != "" && $(this).find("textarea").val() != ""){
		variable.valid = true;	
	}
	
})
/** 식당 정보 저장 함수 끝 */

/** 식당 휴무일 저장 함수 시작 */	
var saveRestWeek = $("#save").on("click", function(){
	
	variable.borderlist["border-color"] = "red";
	variable.valid = false;
	var check = false;
	var text = "저장" 
	var class_name = "btn btn-success";
	var isValue = "";

	if($("#save").text() === "저장"){
		isValue = $('#weekdays').val();
		check = true;
		text = "취소";
		class_name = "btn btn-danger";
		$("input[name=STORE_CLOSE]").val("");
		
		if(isValue.length === 0){
			alert("휴무일을 선택 해주세요")
			return;
		}
		
		variable.borderlist["border-color"] = "green";
		variable.valid = true;
	} 
	
	$("#save").attr("class", class_name);
	$("#save").text(text);
	$("#weekdays").prop("disabled", check);
	$("input[name=STORE_CLOSE]").val(isValue);
	
	$($(".validCheckBox")[1]).prop("checked", variable.valid);
	$($("div[name=storeBold]")[1]).css(variable.borderlist);
})
/** 식당 휴무일 저장 함수 끝 */
	
/** 식당 휴무일 여부 확인 함수 시작 */
var isRestWeek = $("button[name=is-rest]").on("click", function(){
	
	variable.borderlist["border-color"] = "red";
	variable.valid = false;
	
	if($(this).index() === 0){
		$("input[name=STORE_CLOSE]").val("");
		$("#weekdays").append( 	'<option value="1">월요일</option>' +
								'<option value="2">화요일</option>' +
								'<option value="3">수요일</option>' +
								'<option value="4">목요일</option>' +
								'<option value="5">금요일</option>' +
								'<option value="6">토요일</option>' +
								'<option value="7">일요일</option>"');
									
		customSelect2($("#weekdays"));						
		$("#weekdiv").show();
	} else {
		$("input[name=STORE_CLOSE]").val("0");
		$("#save").attr("class", "btn btn-success");
		$("#save").text("저장");
		$("#weekdays").prop("disabled", false);
		$("#weekdiv").hide();
		$("#weekdays").empty();
		variable.valid = true;
		variable.borderlist["border-color"] = "green";
	}
	
	$($("div[name=storeBold]")[1]).css(variable.borderlist);
	$($(".validCheckBox")[1]).prop("checked", variable.valid);
})
/** 식당 휴무일 여부 확인 함수 끝 */

/** 식당 브레이크타임 여부 확인 함수 시작 */
var isRestTime = $("button[name=isRestTime]").on("click", function(){
	
	variable.valid = false;
	variable.borderlist["border-color"] = "red";
	variable.value = "";
	
	if($(this).index() === 0){
		$("#restTime").show();
	} else {
		var timePicker = $(this).closest("div[name=storeBold]").next()
		timePicker.find("input[name=timepicker]").val("");
		timePicker.find("input[name=timepicker]").attr("class", "form-control is-invalid");
		
		variable.borderlist["border-color"] = "green";
		variable.valid = true;
		variable.value = "0";
		$("#restTime").hide();
	}
	
	$("input[name=STORE_BTS]").val(variable.value);
	$("input[name=STORE_BTE]").val(variable.value);
	$($("div[name=storeBold]")[3]).css(variable.borderlist);
	$($(".validCheckBox")[3]).prop("checked", variable.valid);
})
/** 식당 브레이크타임 여부 확인 함수 끝 */

/** 식당 영업시간 함수 시작 */
var saveStoreOpen = $("#saveStoreOpen").on("click", function(){
	var storeOpenCloseTime = $(this).closest("div[name=storeBold]");
	var store_start = $($(storeOpenCloseTime).find("input[name=timepicker]")[0]).val();
	var store_exit = $($(storeOpenCloseTime).find("input[name=timepicker]")[1]).val();
	var btntext = "취소";
	var btnclass = "btn btn-danger";
	
	if(store_start == "" || store_exit == ""){
		return;
	}
	
	if($("#saveStoreOpen").text() === "취소"){
		store_start = "";
		store_exit = "";
		btntext = "저장";
		btnclass = "btn btn-success";
	}
	
	$("#saveStoreOpen").attr("class", btnclass);
	$("#saveStoreOpen").text(btntext);				
	$("input[name=STORE_ST]").val(store_start);
	$("input[name=STORE_ET]").val(store_exit);
});
/** 식당 영업시간 함수 종료 */

/** select2() cutomize */
var customSelect2 = function(tag){
	tag.select2({
		placeholder: "휴무일을 선택하세요 :)",
  		"language": {
    		"noResults": function (params) {
      			return "<b style='color:rgb(220, 20, 60,0.5);'>찾을 수 없어요 :(</b>";
    		}
  		},
  		escapeMarkup: function (markup) {
        	return markup;
    	}
	});
}


