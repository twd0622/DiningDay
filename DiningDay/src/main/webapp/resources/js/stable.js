/**
 * 
 */

/** 페이징 처리 js파일 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/variableCode.js">' +
			   '</script>');


$(() => {
	
	$.ajax({
		type: "get",
		url: "stablePro.st",
		async: false,
	})
	.done(function(data){
		
		totalDatalength = data.length;
		
		for(var i = 0; i < totalDatalength; i++){
			$("#htmlTag").append(seatDataHtml(data[i], i));
		}
	})
	.fail(function(fail){
		alert(fail);
	})
	
	targetColor($("#stable"));
	
	for(var i = 1; i <= totalDatalength; i++){
		$($("#" + i).closest("div[name=" + i + "]")
					.find("select option")[$("#" + i).closest("div[name=" + i + "]")
													 .find("input[name=SEAT_OC]")
													 .val()]).prop("selected", true);		
		customSelect2($('#' + i));
	}
	
	$(document).on("click", ".btn", function(){
		
		var formData = btnNameStructure($(this));
		
		if(typeof formData != 'object'){
			return;
		}
		
		if(confirmText === "*주의* 해당 좌석을 삭제 하시겠습니까?"){
			if(!confirm(confirmText)){
				return;
			}
		} else {
			if(!confirm(confirmText)){
				updateAjax($($(this).parents("div")[1]).attr("name"));		
				return;
			}	
		}
		
		for (let key of formData.keys()) {
		  console.log(key);
		}
		
		for (let value of formData.values()) {
		  console.log(value);
		}
		
		
		$.ajax({
			type: "post",
			data: formData,
			url: _url,
			async: false,
			contentType: false,
	        processData: false
		})
		.done(function(data){
			ajaxDone(data);
		})
		
	})
	
	$(".material-symbols-outlined").on("click", function(){
		$($(this).parents("div")[2]).find("input[type=file]").click();
	})
	
	$("input[type=file]").on("change", e => {
		file_image(e, $(e.currentTarget).attr("name"));
	})
	
	$(document).on("click", ".closeP", e => {
		fileData[$($(e.currentTarget).parents("div")[2]).attr("name")] = '0';
		$(".img" + $($(e.currentTarget).parents("div")[0]).attr("class")).remove();
		$("div[name=" + $($(e.currentTarget).parents("div")[0]).attr("class") + "]").find($(".material-symbols-outlined")).show();
		$("div[name=" + $($(e.currentTarget).parents("div")[0]).attr("class") + "]").find($(".material-symbols-outlined")).css("pointer-events", "auto");
		$("div[name=" + $($(e.currentTarget).parents("div")[0]).attr("class") + "]").find(".closeP").remove();
	})
	
	$("input[type=text]").on("change", function(){
		if($(this).val() === ''){
			$(this).attr("class", "form-control is-invalid");
			$($($(this).parents("div")[1]).find("button")[0]).prop("disabled", true);
			return;
		}
		$($($(this).parents("div")[1]).find("button")[0]).prop("disabled", false);
	})
})

var updateAjax = (returnIndex) => {
	
//	$("input[name=" + returnIndex + "]").val("");
//	$(".img" + returnIndex).remove();
//	$("div[name=" + returnIndex + "]").find(".closeP").remove();
	$($("div[name=" + returnIndex + "]").find("button")[0]).attr("class", "btn btn-success");
	$($("div[name=" + returnIndex + "]").find("button")[0]).text("저장하기");
	$($("div[name=" + returnIndex + "]").find("button")[1]).text("취소하기");
	$("div[name=" + returnIndex + "]").find("input[type=text]").prop("readonly", false);
	$("div[name=" + returnIndex + "]").find("select").prop("disabled", false);
//	$("div[name=" + returnIndex + "]").find($(".material-symbols-outlined")).show();
} 
			

function btnNameStructure(btn){
	
	var isReturnFunc = false;
	var btnName = btn.text();
	var thisResReq = $(btn.parents("div")[1]).find($("input[name=SEAT_NO]")).val()
	var resCheckAjaxExcute = false;
	var isDelete = 'false';
	var btnChangeText_1 = '수정하기';
	var btnChangeText_2 = '삭제하기';
	var index = $(btn.parents("div")[1]).attr("name");
	var btnChangeClass = "btn btn-warning"; 
	var btnClass = "btn btn-danger"; 
	var _data = '';
	
	showAndHide(btn, true);
	
	switch(btnName){
		
		case "수정하기": 
			
			resCheckAjaxExcute = true;
			btnChangeText_1 = "저장하기"; 
			btnChangeText_2 = "취소하기";
			btnChangeClass = "btn btn-success";
			btnClass = "btn btn-danger";
			dangerousAlert = 0;
			var photoName = $("div[name=" + index + "]").find($("input[name=PHOTO_NAME]")).val();
			fileData[index] = photoName;
			
			$("div[name=" + index + "]").find($("img")).hide();
			
			if(fileData[index] != '0'){
				$("." + index).append("<img class='img" + index + "' src='upload/" + fileData[index] + "' style='width:300px; height:225px;' >");
				$("." + index).closest("div").append("<div class='mt-3 closeP'><label>초기화</labe><div>");				
			} else {
				$("div[name=" + index + "]").find(".material-symbols-outlined").show();
				$("div[name=" + index + "]").find(".material-symbols-outlined").css("pointer-events", "auto");	
			}
			
			showAndHide(btn, false);
			break;
			
		case "삭제하기": 
			resCheckAjaxExcute = true;
			isDelete = 'true';
			
			ajaxDone = (data) => {
				$("div[name=" + data + "]").remove(); 
			}
			
			confirmText = "*주의* 해당 좌석을 삭제 하시겠습니까?";
			_url = "seatDeletePro.st";
			_data = new FormData();
			_data.append("SEAT_NO", thisResReq);
			_data.append("COLOUMN", index + "");
			_data.append("SEAT_NAME", $($("div[name=" + index + "]").find("input[type=text]")[0]).val());
			break;
			
		case "저장하기":
			
			if(dangerousAlert === 1){
				confirmText = "*경고* 현재 좌석은 예약자가 존재합니다?\r\n정말 좌석정보를 변경하시겠습니까?";
			} else {
				confirmText = "해당 좌석정보를 저장 하시겠습니까?";
			}
			
			ajaxDone = (data) => {

				console.log(data);
				$($("div[name=" + data.COLOUMN + "]").find("input[type=text]")[0]).val(data.SEAT_NAME);
				$($("div[name=" + data.COLOUMN + "]").find("input[type=text]")[1]).val(data.SEAT_MIN);
				$($("div[name=" + data.COLOUMN + "]").find("input[type=text]")[2]).val(data.SEAT_MAX);
				$($("div[name=" + data.COLOUMN + "]").find("input[type=text]")[3]).val(data.SEAT_CONTENT);
				$("#" + data.COLOUMN).val(data.SEAT_OC).trigger('change');
				$(".img" + data.COLOUMN).remove();	
			
				if(data.PHOTO_NAME === '0'){
					$($("div[name=" + data.COLOUMN + "]").find("img")).css("display", "none");
				} else {
					$($("div[name=" + data.COLOUMN + "]").find("img")).attr("src", "upload/" + data.PHOTO_NAME);
					$($("div[name=" + data.COLOUMN + "]").find("img")).css("display", "block");
					$("div[name=" + data.COLOUMN + "]").find($(".material-symbols-outlined")).hide();											
				}
				
				$("div[name=" + data.COLOUMN + "]").find($(".material-symbols-outlined")).css("pointer-events", "none");
				$("div[name=" + data.COLOUMN + "]").find(".closeP").remove();
				$("div[name=" + data.COLOUMN + "]").find("input[name=PHOTO_NAME]").val(data.PHOTO_NAME);
				
				fileData[data.COLOUMN] = data.PHOTO_NAME;
			}
			
			_url = "seatUpdatePro.st";
			_data = new FormData();
			_data.append("COLOUMN", index + "");
			_data.append("PHOTO_NAME", fileData[index]);
			_data.append("SEAT_NO", thisResReq);
			_data.append("SEAT_NAME", $($("div[name=" + index + "]").find("input[type=text]")[0]).val());
			_data.append("SEAT_MIN", $($("div[name=" + index + "]").find("input[type=text]")[1]).val());
			_data.append("SEAT_MAX", $($("div[name=" + index + "]").find("input[type=text]")[2]).val());
			_data.append("SEAT_CONTENT", $($("div[name=" + index + "]").find("input[type=text]")[3]).val());
			_data.append("SEAT_OC", $('#' + index).val());
			break;
			
		case "취소하기":
			$("." + index).find($(".img" + index))
						  .remove();
			$("div[name=" + index + "]").find(".closeP")
									    .remove();
			$("div[name=" + index + "]").find(".material-symbols-outlined")
									    .css("pointer-events", "none");

			fileData[index] = $("div[name=" + index + "]").find($("input[name=PHOTO_NAME]")).val();
			btn.prev().prop("disabled", false);
			
			if($("div[name=" + index + "]").find($("input[name=PHOTO_NAME]")).val() == '0'){
				$("div[name=" + index + "]").find(".material-symbols-outlined")
											.show();
			} else {
				$("div[name=" + index + "]").find(".material-symbols-outlined")
											.hide();
				$("div[name=" + index + "]").find($("img"))
											.show();
			}
			
			$("div[name=" + index + "]").find($(".img" + index))
										.remove();
			resetValue(index);
			break;
	}

	if(resCheckAjaxExcute){
		$.ajax({
		data: { 
			SEAT_NO: thisResReq,
			isTrue: isDelete
		},
		url: "stableResCheck.st",
		async: false,
		type: "post"
		})
		.done(function(data){
			if(JSON.parse(data.REQ_STATE)){
				if(!JSON.parse(data.isTrue)){
					if(!confirm("현재 예약된 내역이 존재하는 좌석입니다.\r\n 정말 변경하시겠습니까?")){
						$("div[name=" + index + "]").find(".material-symbols-outlined")
												.css("pointer-events", "none");
						isReturnFunc = true;								
					} else {
						dangerousAlert = 1;
					}
				} else {
					alert("현재 예약된 내역이 존재하므로 삭제가 불가능합니다.");
					isReturnFunc = true;
				}
			} 
		})
		.fail()
	}
	
	if(isReturnFunc) return;	
	
	if(btn.prev().length > 0){
		btn.prev().text(btnChangeText_1);
		btn.text(btnChangeText_2);
		btn.prev().attr("class", btnChangeClass);
		btn.attr("class", btnClass);
	} else {
		btn.next().text(btnChangeText_2);
		btn.text(btnChangeText_1);
		btn.attr("class", btnChangeClass);
	}
	
	if(typeof _data != 'object'){
		return;	
	}

	return _data;
}
/** 전역 변수 시작 */
let totalDatalength = 0;
let fileData = [];
let _url = "";
let ajaxDone;
let confirmText = '';
let dangerousAlert = 0;
/** 전역 변수 끝 */

function resetValue(index){
	$("#" + index).val($("div[name=" + index + "]").find("input[name=SEAT_OC]").val()).trigger('change');
	$($("div[name=" + index + "]").find("input[type=text]")[0]).val($("div[name=" + index + "]").find("input[name=SEAT_NAME]").val());
	$($("div[name=" + index + "]").find("input[type=text]")[1]).val($("div[name=" + index + "]").find("input[name=SEAT_MIN]").val());
	$($("div[name=" + index + "]").find("input[type=text]")[2]).val($("div[name=" + index + "]").find("input[name=SEAT_MAX]").val());
	$($("div[name=" + index + "]").find("input[type=text]")[3]).val($("div[name=" + index + "]").find("input[name=SEAT_CONTENT]").val());
	
	$($("div[name=" + index + "]").find("input[type=text]")[0]).attr("class", "form-control is-valid");
	$($("div[name=" + index + "]").find("input[type=text]")[1]).attr("class", "form-control is-valid");
	$($("div[name=" + index + "]").find("input[type=text]")[2]).attr("class", "form-control is-valid");
	$($("div[name=" + index + "]").find("input[type=text]")[3]).attr("class", "form-control is-valid");
}

function showAndHide(targetTag, boolean){
	$(targetTag.parents("div")[1]).find("input[type=text]").prop("readonly", boolean);
	$(targetTag.parents("div")[1]).find("select").prop("disabled", boolean);
}

function file_image(e, index){
	
	var file = e.target.files;
	var image = new Image();
	var ImageTempUrl = window.URL.createObjectURL(file[0]);
	
	image.src = ImageTempUrl;
	image.style = "width:300px; height:225px;";
	image.className = "img" + index;
	fileData[index] = file[0];	
	
	$("." + index).find(".img" + index).remove();
	$("." + index).find(".closeP").remove();
	$("." + index).find($("img")).hide();
	$("." + index).find($(".material-symbols-outlined")).hide();
	$("." + index).append(image);
	$("." + index).closest("div").append("<div class='mt-3 closeP'><label>초기화</labe><div>");
	
	e.target.value = '';
}

function seatDataHtml(data, i){
	
	var isAtagDisplayNone = '';
	var isImgExist = 'display: none;';
	if(data.PHOTO_NAME != '0'){
		isAtagDisplayNone = 'display: none;'; 
		isImgExist = '';
	}

	i++;

	return "<div name='" + i + "' class='p-3 mb-5 marginBox rounded-4 shadow' style='display: flex; flex-direction: column; background-color: white; width: 400px;'>" +
				"<input type='file' name='" + i + "' style='display:none;' value=''>" +
				"<input type='hidden' name='PHOTO_NAME' value='" + data.PHOTO_NAME + "'>" +
				"<input type='hidden' name='SEAT_NO' value='" + data.SEAT_NO + "'>" +
				"<input type='hidden' name='SEAT_OC' value='" + data.SEAT_OC + "'>" +
				"<input type='hidden' name='SEAT_NAME' value='" + data.SEAT_NAME + "'>" +
				"<input type='hidden' name='SEAT_MIN' value='" + data.SEAT_MIN + "'>" +
				"<input type='hidden' name='SEAT_MAX' value='" + data.SEAT_MAX + "'>" +
				"<input type='hidden' name='SEAT_CONTENT' value='" + data.SEAT_CONTENT + "'>" +
				"<div style='display: flex; justify-content: center; margin-bottom: 12px;'>" +
					"<div class='" + i + "' style='width: 375px; height: 300px; border: 1px solid black; display: flex; flex-direction: column; justify-content: center; align-items: center;'>" +
						 '<img src="upload/' + data.PHOTO_NAME + '" style="width: 350px; height: 275px;' + isImgExist + '" alt=""/>' +
						 "<span class='material-symbols-outlined' style='pointer-events: none; color:#6c757d !important;font-size: 150px;" + isAtagDisplayNone + "'>add</span>" +
					"</div>" +
				"</div>" +
				"<div class='input-group mb-2'>" +
					"<span class='input-group-text' id='input'>좌석 명</span>" +
					"<input type='text' class='form-control is-valid' readonly aria-describedby='input' value='" + data.SEAT_NAME + "'>" +
				"</div>" +
				"<div class='input-group mb-2'>" +
					"<span class='input-group-text' id='input'>최소 인원</span>" +
					"<input type='text' class='form-control is-valid' readonly aria-describedby='input' value='" + data.SEAT_MIN + "'" + 
					"oninput='this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');'>" +
				"</div>" +
				"<div class='input-group mb-2'>" +
					"<span class='input-group-text' id='input'>최대 인원</span>" +
					"<input type='text' class='form-control is-valid' readonly aria-describedby='input' value='" + data.SEAT_MAX + "'" +
					"oninput='this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');'>" +
				"</div>" +
				"<div class='input-group mb-2'>" +
					"<span class='input-group-text' id='input'>좌석 설명</span>" +
					"<input type='text' class='form-control is-valid' readonly aria-describedby='input' value='" + data.SEAT_CONTENT + "'>" +
				"</div>" +
				"<div style='display: flex; justify-content: space-between;'>" +
					"<div><label>좌석 이용 여부</label></div>" +
					"<div>" +
						"<select id='" + i + "' style='width: 250px;' disabled>" +
							"<option value='0'>이용 불가</option>" +
							"<option value='1'>이용 가능</option>" +
						"</select>" +
					"</div>" +
				"</div>" +
				"<div class='mt-2' style='display: flex; justify-content: space-between; justify-content: space-around;'>" +
					"<button type='button' class='btn btn-warning'>수정하기</button>" +
					"<button type='button' class='btn btn-danger'>삭제하기</button>" +
				"</div>" +
			"</div>"	
}

/** select2() cutomize */
var customSelect2 = function(tag){
	tag.select2({
		placeholder: '좌석 이용 가능여부 :)',
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