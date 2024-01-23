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
	
	targetColor($("#smain"));
	$("#restTime").hide();
	$("#weekdiv").hide();
	customSelect2($('#storeCategory'));
	customSelect2($("#storeLastOrder"));
	customSelect2($("#storeResTerm"));
		
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));			
	$('[data-toggle="tooltip"]').tooltip();
	
	ValidationCheckBox();	//	submit 실행 전 유효성 체크
	isRestWeek;				//	휴무일 선택 여부
	saveRestWeek;			//	휴무일 저장 여부
	timePicker();			//	타임피커 적용 
	saveStore;				//	식당 정보 저장 (text)
	saveStoreOpen;			//	영업시간, 휴무시간 컨트롤
	thumbnail_banner();		//	썸네일, 배너 사진 컨트롤
	search_address;			//	주소 검색
	
//	$("#totalInsert").hide();
	$("input[type=button]").on("click", function(){
		var index = ($(this).attr("id")).split("_")[1];
		$("#inputfile_" + index).click();
	})

	for(var i = 0; i < $("input[type=checkbox]").length; i++){
		$($("div[name=storeBold]")[i]).css(variable.borderlist);
	}
	
//	$(document).on("change", "#checkboxList input", function(){
//		debugger;
//		for(var i = 0; i < $("input[type=checkbox]").length; i++){
//			if(!$("." + i).is(":checked")){
//				$("#totalInsert").hide();
//				return;				
//			}
//		}
//		$("#totalInsert").show();
//	})
	
	paging("main .storePaging", 1, 0);
	$(".demo").hide();
	
	$("#validCheckBtn").find(".btn-success").prop("disabled", $("#pagination").find($(".next")).attr("class") == ("page-item next disabled"))
	$("#validCheckBtn").find(".btn-danger").prop("disabled", $("#pagination").find($(".prev")).attr("class") == ("page-item prev disabled"))
	
	$("#validCheckBtn").find(".btn").click(function(){
		var btnText = $(this).text();
		if(btnText === '다음'){
			$("#pagination").find($(".next")).click();
			$(this).prop("disabled", $("#pagination").find($(".next")).attr("class") == ("page-item next disabled"));
			$(this).prev().prop("disabled", $("#pagination").find($(".prev")).attr("class") == ("page-item prev disabled"));	
		} else {
			$("#pagination").find($(".prev")).click();
			$(this).prop("disabled", $("#pagination").find($(".prev")).attr("class") == ("page-item prev disabled"));
			$(this).next().prop("disabled", $("#pagination").find($(".next")).attr("class") == ("page-item next disabled"));
		}
	})
	
	$("#totalInsert").on("click", function(){
		for(var i = 0; i < $("input[type=checkbox]").length; i++){
			
			var isChecked = $($("input[type=checkbox]")[i]).prop("checked");
			
			if(!isChecked){
				alert("식당 등록에 실패 하였습니다. 다시 한 번 확인해주세요.");
				return;
			}
		}
		
		var formdata = new FormData($("#STORE_DATA")[0]);

		for (let key of formdata.keys()) {
		  console.log(key);
		}
		
		for (let value of formdata.values()) {
		  console.log(value);
		}
		
		$.ajax({
			url:"storeInsert.st",
			data: formdata,
			type: "post",
			processData: false,
   			contentType: false,
			async: false
		})
		.done(function(data){
			if(new Boolean(data)){
				alert("식당 등록 성공");
				location.href = "smainIsExist.st";
				return;
			}
			alert("실패");
		})
	})
})
	
function ValidationCheckBox(){
	for(var i = 0; i < $("input[type=checkbox]").length; i++){
		indexArr.push(parseInt($($("input[type=checkbox]")[i]).attr("class").split(" ")[0]));
	}
	
	CheckboxIndex.zero = indexArr[0];
	CheckboxIndex.one = indexArr[1];
	CheckboxIndex.two = indexArr[2];
	CheckboxIndex.three = indexArr[3];
	CheckboxIndex.four = indexArr[4];
	CheckboxIndex.five = indexArr[5];
	CheckboxIndex.six = indexArr[6];
}

var indexArr = [] 
var CheckboxIndex = {
	zero: 0,
	one: 0,
	two: 0,
	three: 0,
	four: 0,
	five: 0,
	six: 0
}

const variable = {
	borderlist:{
		"border-width":"1px",
		"border-color":"red",
		"border-style":"solid"
	},
	valid: false,
	value: ""	
};

/** 식당 정보 입력란(text) 저장 함수 시작 */
var saveStore = $("#saveStore").on("click", function(){
	
	var btnclass = "btn btn-success btn-lg";
	var btntext = "저장하기";
	variable.valid = false;
	var istrue = true;
	variable.borderlist["border-color"] = "red"
	var textareaValue;
	var selectValue;
	var currentTargetTag = $(this).closest("div[name=storeBold]");
	
	textareaValue = $(this).closest("div[name=storeBold]").find("textarea").val(function(i, value){
		
		if(value === ''){               
			istrue = false;	
			return; 
		}
		
		return value;  
	})
	
//	inputValue = addressValue;
	
	selectValue = $(this).closest("div[name=storeBold]").find("select option:selected").val(function(i, value){

		if(value === '') return;
		return value;
	})
	
	if(!istrue){
		
		alert("모든 항목은 필수 항목입니다. 입력란을 다시 확인해주세요 :)");		
		return;
	}


	if($(this).text() == "저장하기"){
		btnclass = "btn btn-danger btn-lg";
		btntext = "취소하기";
		variable.valid = true;
		variable.borderlist["border-color"] = "green";
	} 
	
	$($("input[type=checkbox]")[CheckboxIndex.zero]).prop("checked", variable.valid);
	$(currentTargetTag).css(variable.borderlist);
	$(this).text(btntext);
	$(this).attr("class", btnclass);
	$(currentTargetTag).find("textarea")
	                   .prop("readonly", variable.valid);
	$(currentTargetTag).find("select")
					   .prop("disabled", variable.valid);
	$("#member_post").prop("disabled", variable.valid);
	
	if(variable.valid){
		
//		$("#STORE_DATA").find("input[name=STORE_LOCATION]").val(inputValue);
		
		for(var i = 0; i < textareaValue.length; i++){
			$($("#STORE_DATA").find("input[type=text]")[i]).val($($(textareaValue)[i]).val());	
		}

		for(var i = 0; i < selectValue.length; i++){
			$($("#STORE_DATA").find("input[type=text]")[i + 6]).val($($(selectValue)[i]).val());	
		}
	}
	
})
/** 식당 정보 입력란(text) 저장 함수 끝 */

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
	
	$($("input[type=checkbox]")[CheckboxIndex.one]).prop("checked", variable.valid);
	$($("div[name=storeBold]")[CheckboxIndex.one]).css(variable.borderlist);
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
	
	$($("div[name=storeBold]")[CheckboxIndex.one]).css(variable.borderlist);
	$($("input[type=checkbox]")[CheckboxIndex.one]).prop("checked", variable.valid);
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
	$($("div[name=storeBold]")[CheckboxIndex.three]).css(variable.borderlist);
	$($("input[type=checkbox]")[CheckboxIndex.three]).prop("checked", variable.valid);
})
/** 식당 브레이크타임 여부 확인 함수 끝 */

/** 식당 영업 및 휴게 시간 함수 시작 */
var saveStoreOpen = $("button[name=saveTimepicker]").on("click", function(){
	
	var storeOpenCloseTime = $(this).closest("div[name=storeBold]");
	var store_start = $($(storeOpenCloseTime).find("input[name=timepicker]")[0]).val();
	var store_exit = $($(storeOpenCloseTime).find("input[name=timepicker]")[1]).val();
	var btntext = "취소";
	var btnclass = "btn btn-danger";
	variable.valid = true;
	variable.borderlist["border-color"] = "green";
	var input1 = "input[name=STORE_ST]";
	var input2 = "input[name=STORE_ET]";
	var index = [];
	index.push(CheckboxIndex.two); 

	if(storeOpenCloseTime.attr("id") === "restTime"){
		input1 = "input[name=STORE_BTS]";
		input2 = "input[name=STORE_BTE]";
		index.shift();
		index.push(CheckboxIndex.three, CheckboxIndex.four);
	}
	
	if(storeOpenCloseTime.attr("id") === "resIstrueTimeCheck"){
		input1 = "input[name=STORE_RST]";
		input2 = "input[name=STORE_RET]";
		index.shift();
		index.push(CheckboxIndex.five);
	}
	
	if(store_start == "" || store_exit == ""){
		return;
	}

	if($(this).text() === "취소"){
		store_start = "";
		store_exit = "";
		btntext = "저장";
		btnclass = "btn btn-success";
		variable.borderlist["border-color"] = "red";
		variable.valid = false;
	}
	
	$(this).attr("class", btnclass);
	$(this).text(btntext);
	$(input1).val(store_start);
	$(input2).val(store_exit);
	$(storeOpenCloseTime).find("input[name=timepicker]").prop("disabled", variable.valid);
	
	for(var i = 0; i < index.length; i++){
		$($("div[name=storeBold]")[index[i]]).css(variable.borderlist);
		if(i > 0) continue;
		$($("input[type=checkbox]")[index[i]]).prop("checked", variable.valid);
	}
});
/** 식당 영업시간 함수 종료 */

/** 썸네일 및 배너 사진 등록 함수 시작 */
var photoisExistCheck = $("button[name=photoCheck]").on("click", function(){
	debugger;
	variable.borderlist["border-color"] = "red";
	variable.valid = false;
	var index = $(this).closest("div").prev("div[name=photoParent]").find("img").length
	var indexCheck = $(this).closest("div").prev("div[name=photoParent]").find("div").length;	
	var addcount = 1;
	var btnclaseName = "btn btn-success mb-4";
	var btnText = "저장";
	var checkBoxCount = CheckboxIndex.six; 
	
	if(index != indexCheck || index === 0){
		return;
	} 
	
	index--;

	if(index === 1){
		addcount++;
		checkBoxCount++;
	}
	
	for(var i = index; i < index + addcount; i++){
		if(files[i]) return;
		btnclaseName = "btn btn-danger mb-4";
		btnText = "취소";
		variable.borderlist["border-color"] = "green";
		variable.valid = true;
	}
	
	if($(this).text() === "취소"){
		btnclaseName = "btn btn-success mb-4";
		btnText = "저장";
		variable.valid = false;
		variable.borderlist["border-color"] = "red";
	}
	
	$($("div[name=storeBold]")[checkBoxCount]).css(variable.borderlist);
	$($("input[type=checkbox]")[checkBoxCount]).prop("checked", variable.valid);
	$(this).attr("class", btnclaseName);
	$(this).text(btnText);
	$(this).closest("div[name=storeBold]").find("input[type=button]").prop("disabled", variable.valid);
})
/** 썸네일 및 배너 사진 등록 함수 종료 */

/** select2() cutomize */
var customSelect2 = function(tag){
	tag.select2({
		placeholder: "휴무일을 선택하세요 :)",
  		"language": {
    		"noResults": function (params) {
      			return "<b style='color:rgb(220, 20, 60, 0.5);'>찾을 수 없어요 :(</b>";
    		}
  		},
  		escapeMarkup: function (markup) {
        	return markup;
    	}
	});
}

var timePicker = function(){
	$("input[name=timepicker]").timepicki();
}

var validCheckArray = [false, false, false, false, true, false, false, false];

var addressValue = $("#member_addr").val();

var search_address = $("#member_post").on("click", function (){

		new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
	        	
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
 	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다. 
	            if(roadAddr != ''){
					roadAddr = data.jibunAddress;
					$("#member_addr").val(roadAddr);
				}
	            
	            if(jibunAddr !== ''){
	                addressValue = jibunAddr;
	                $("#member_addr").val(addressValue);
	            } 
// 	            else if(jibunAddr !== ''){
// 	                document.getElementById("member_addr").value = jibunAddr;
// 	            }
	        }
	    }).open();
	})