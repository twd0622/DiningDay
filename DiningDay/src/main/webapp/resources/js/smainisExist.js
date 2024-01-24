/**
 * 
 */

document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/variableCode.js">' +
			   '</script>');

/** timepicker js파일 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/timepicki.js">' +
			   '</script>');		   
			   
$(() => {
	
	targetColor($("#smainIsExist"));
	showHide(true);
	저장취소버튼.hide();
	
	/** input 태그에 타임피키 적용 */
	$("#STORE_ST").timepicki();
	$("#STORE_ET").timepicki();	
	$("#STORE_BTS").timepicki();	
	$("#STORE_BTE").timepicki();	
	$("#STORE_RST").timepicki();	
	$("#STORE_RET").timepicki();	
	
	/** select 태그에 select2 적용 */
	customSelect2($("#STORE_CLOSE"));
	customSelect2($("#STORE_RT"));
	customSelect2($("#STORE_LO"));
	customSelect2($("#STORE_CATEGORY"));
	
	/** select 태그 초기값 집어넣기 */
	$("#STORE_CLOSE").val($("#oldData").find($("input[name=STORE_CLOSE]")).val()).trigger('change');
	$("#STORE_RT").val($("#oldData").find($("input[name=STORE_RT]")).val()).trigger('change');
	$("#STORE_LO").val($("#oldData").find($("input[name=STORE_LO]")).val()).trigger('change');
	$("#STORE_CATEGORY").val($("#oldData").find($("input[name=STORE_CATEGORY]")).val()).trigger('change');
		
	for(var i = 0; i < $("#newData input[type=text]").length; i++){
		console.log($($("#newData input[type=text]")[i]).val()); 
	}
	
	$(document).on("click", "#storeBtn button", function(){
		var formData = totalDataBtnName($(this));
		if(formData === undefined) return;
		if(alertText != ''){
			alert(alertText);
			return;
		}
		
		$.ajax({
			data: formData,
			type: "post",
			url: "smainisExistPro.st",
			async: false,
			contentType: false,
	        processData: false
		})
		.done(function(data){
			updateStoreData(data);
			fileData = [];
		})
		.fail()
	});
	
	$(document).on("click", ".STORE_BR_BTN", function(){
		$(".STORE_BR_1 input").val("0");
		$(".STORE_BR_2 input").val("0");
	});
	
	$(document).on("click", ".PH button", function(){
		var fileId = $(this).attr("id");
		if(fileId === undefined){
			return;
		}
		$("input[name='" + fileId + "_PHOTO_NAME']").click(); 
	})
	
	$("input[type=file]").change(e => {
		fileOnChangeEvent(e, ($(e.target).attr("name")).split("_")[0], ($(e.target).attr("id")).split("_")[1]);
	})
})		

function fileOnChangeEvent(e, imgTagId, index){
	
	var file = e.target.files;
	fileData[index] = file[0];
	var image = new Image();
	image.src = window.URL.createObjectURL(file[0]);
	image.style = "width: 380px; height: 380px;";
	image.class = "rounded-4 shadow";

	$("." + imgTagId).empty();
	$("." + imgTagId).append(image);
}

function totalDataBtnName(dataBtn){
	
	var btnText = dataBtn.text();
	var boolean = true;
	var index = 3;
	alertText = '';
		
	switch(btnText){
		case "수정하기":
			fileData[1] = $("input[name=SU1]").val();	
			fileData[2] = $("input[name=BA1]").val();
			fileData[3] = $("input[name=BA2]").val();
			
			showHide(false);
			수정버튼.hide(); 
			저장취소버튼.show();
			break;
		
		case "저장하기":
			boolean = false;
			showHide(true);
			수정버튼.show();
			저장취소버튼.hide();
			break;
		
		case "취소하기":
			fileData[1] = $("input[name=SU1]").val();	
			fileData[2] = $("input[name=BA1]").val();
			fileData[3] = $("input[name=BA2]").val();
			
			showHide(true);
			수정버튼.show();
			저장취소버튼.hide();
			resetData();
			break;
	}
	
	if(boolean) return;
	
	for(var i = 1; i < $("#newData input").length; i++){
		if(i > 1 && i < 4){
			if($($("#newData input")[i]).val() == "") {
				console.log($($("#newData input")[i]).val());
				alertText = "빈 값은 저장 할 수 없습니다 :(";
				return;
			}
		}
		if(i % 4 === 0){
			if($($("#newData input")[i]).val() == "") {
				console.log($($("#newData input")[i]).val());
				alertText = "빈 값은 저장 할 수 없습니다 :(";
				return;
			}	
		}
	}
	
	for(var i = 0; i < $("#newData select").length; i++){
		if($($("#newData select")[i]).val() == "") {
			alertText = "빈 값은 저장 할 수 없습니다 :(";
			return;
		}	
	}
	
	for(var i = 0; i < $("#newData textarea").length; i++){
		if(i > 2) continue;
		if($($("#newData textarea")[i]).val() == "") {
			alertText = "빈 값은 저장 할 수 없습니다 :(";
			return;
		}	
	}
	
	for(var i = 1; i <= index; i++){
		if(fileData[i] === undefined) {
			alertText = "빈 값은 저장 할 수 없습니다 :(";
			return;
		}	
	}
	
	var _data = new FormData();
	return formdata(_data);
}

let 수정버튼 = $($("#storeBtn div")[0]).find("button");
let 저장취소버튼 =	$($("#storeBtn div")[1]).find("button");
let fileData = [];
let alertText = '';

function formdata(_data){
	_data.append("STORE_NAME", $("#STORE_NAME").val());
	_data.append("STORE_LOCATION", $("#STORE_LOCATION").val());
	_data.append("STORE_DETAIL", $("#STORE_DETAIL").val());
	_data.append("STORE_INFO", ($("#STORE_INFO").val()).trim());
	_data.append("STORE_TEL", $("#STORE_TEL").val());
	_data.append("STORE_PLUS", ($("#STORE_PLUS").val()).trim());
	_data.append("STORE_CATEGORY", $("#STORE_CATEGORY").val());
	_data.append("STORE_LO", $("#STORE_LO").val());
	_data.append("STORE_RT", $("#STORE_RT").val());
	_data.append("STORE_CLOSE", $("#STORE_CLOSE").val());
	_data.append("STORE_ST", $("#STORE_ST").val());
	_data.append("STORE_ET", $("#STORE_ET").val());
	_data.append("STORE_BTS", $("#STORE_BTS").val());
	_data.append("STORE_BTE", $("#STORE_BTE").val());
	_data.append("STORE_RST", $("#STORE_RST").val());
	_data.append("STORE_RET", $("#STORE_RET").val());
	_data.append("SU1", fileData[1]);
	_data.append("BA1", fileData[2]);
	_data.append("BA2", fileData[3]);
	
	return _data;
}

function showHide(boolean){
	$("#newData input").prop("disabled", boolean);
	$("#newData textarea").prop("disabled", boolean);
	$("#newData select").prop("disabled", boolean);
	$("#newData button").prop("disabled", boolean);
	$("#storeBtn button").prop("disabled", false);
}

function resetData(){
	$("#STORE_NAME").val($("#oldData").find("input[name=STORE_NAME]").val());
	$("#STORE_LOCATION").val($("#oldData").find("input[name=STORE_LOCATION]").val());
	$("#STORE_DETAIL").val($("#oldData").find("input[name=STORE_DETAIL]").val());
	$("#STORE_INFO").val($("#oldData").find("input[name=STORE_INFO]").val());
	$("#STORE_TEL").val($("#oldData").find("input[name=STORE_TEL]").val());
	$("#STORE_PLUS").val($("#oldData").find("input[name=STORE_PLUS]").val());
	$("#STORE_CATEGORY").val($("#oldData").find("input[name=STORE_CATEGORY]").val()).trigger('change');
	$("#STORE_LO").val($("#oldData").find("input[name=STORE_LO]").val()).trigger('change');
	$("#STORE_RT").val($("#oldData").find("input[name=STORE_RT]").val()).trigger('change');
	$("#STORE_CLOSE").val($("#oldData").find("input[name=STORE_CLOSE]").val()).trigger('change');
	$("#STORE_ST").val($("#oldData").find("input[name=STORE_ST]").val());
	$("#STORE_ET").val($("#oldData").find("input[name=STORE_ET]").val());
	$("#STORE_BTS").val($("#oldData").find("input[name=STORE_BTS]").val());
	$("#STORE_BTE").val($("#oldData").find("input[name=STORE_BTE]").val());
	$("#STORE_RST").val($("#oldData").find("input[name=STORE_RST]").val());
	$("#STORE_RET").val($("#oldData").find("input[name=STORE_RET]").val());
	$("#SU1").attr("src", "upload/" + $("#oldData").find("input[name=SU1]").val());
	$("#BA1").attr("src", "upload/" + $("#oldData").find("input[name=BA1]").val());
	$("#BA2").attr("src", "upload/" + $("#oldData").find("input[name=BA2]").val());
}

function updateStoreData(data){
	$("#STORE_NAME").val(data.STORE_NAME);
	$("#STORE_LOCATION").val(data.STORE_LOCATION);
	$("#STORE_DETAIL").val(data.STORE_DETAIL);
	$("#STORE_INFO").val(data.STORE_INFO);
	$("#STORE_TEL").val(data.STORE_TEL);
	$("#STORE_PLUS").val(data.STORE_PLUS);
	$("#STORE_CATEGORY").val(data.STORE_CATEGORY).trigger('change');
	$("#STORE_LO").val(data.STORE_LO).trigger('change');
	$("#STORE_RT").val(data.STORE_RT).trigger('change');
	$("#STORE_CLOSE").val(data.STORE_CLOSE).trigger('change');
	$("#STORE_ST").val(data.STORE_ST);
	$("#STORE_ET").val(data.STORE_ET);
	$("#STORE_BTS").val(data.STORE_BTS);
	$("#STORE_BTE").val(data.STORE_BTE);
	$("#STORE_RST").val(data.STORE_RST);
	$("#STORE_RET").val(data.STORE_RET);
	$("#SU1").attr("src", "upload/" + data.SU1);
	$("#BA1").attr("src", "upload/" + data.BA1);
	$("#BA2").attr("src", "upload/" + data.BA2);
	
	$("#oldData").find("input[name=STORE_NAME]").val(data.STORE_NAME);
	$("#oldData").find("input[name=STORE_LOCATION]").val(data.STORE_LOCATION);
	$("#oldData").find("input[name=STORE_DETAIL]").val(data.STORE_DETAIL);
	$("#oldData").find("input[name=STORE_INFO]").val(data.STORE_INFO);
	$("#oldData").find("input[name=STORE_TEL]").val(data.STORE_TEL);
	$("#oldData").find("input[name=STORE_PLUS]").val(data.STORE_PLUS);
	$("#oldData").find("input[name=STORE_CATEGORY]").val(data.STORE_CATEGORY);
	$("#oldData").find("input[name=STORE_LO]").val(data.STORE_LO);
	$("#oldData").find("input[name=STORE_RT]").val(data.STORE_RT);
	$("#oldData").find("input[name=STORE_CLOSE]").val(data.STORE_CLOSE);
	$("#oldData").find("input[name=STORE_ST]").val(data.STORE_ST);
	$("#oldData").find("input[name=STORE_ET]").val(data.STORE_ET);
	$("#oldData").find("input[name=STORE_BTS]").val(data.STORE_BTS);
	$("#oldData").find("input[name=STORE_BTE]").val(data.STORE_BTE);
	$("#oldData").find("input[name=STORE_RST]").val(data.STORE_RST);
	$("#oldData").find("input[name=STORE_RET]").val(data.STORE_RET);
	$("#oldData").find("input[name=SU1]").val(data.SU1);
	$("#oldData").find("input[name=BA1]").val(data.BA1);
	$("#oldData").find("input[name=BA2]").val(data.BA2);
	$("input[name=ratevalue]").val(data.REV_SCORE); 
}

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