/**
 * 
 */
//		for (let key of ajaxTotalData.data.keys()) {
//			console.log(key);
//		}
//		
//		for (let value of ajaxTotalData.data.values()) {
//		  	console.log(value);
//		}

/** 페이징 처리 js파일 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/variableCode.js">' +
			   '</script>');
			   
$(() => {
	
	$.ajax({
		data: {STORE_NO: $("input[name=STORE_NO]").val()},	
		type: "get",
		dataType: "json",
		url: "smenuList.st",
		async: false	
	})
	.done(function(data){
		var i = 0;
		for(let menu of data){
			i++;
			$("#tbody_2").prepend(htmlTag(menu, i));
			$("#MENU_DATA").append("<input type='file' class='" + i + "' style='display:none;'>");
		}
			
		for(var i = 0; i < $("#tbody_2").find("select").length; i++){
			var select = $("#tbody_2").find("select").eq(i);
			$(select).find("option").eq(select.attr("name")).attr("selected", "selected");
		}
	})
	
	targetColor($("#smenu"));		//	현재 페이지에 해당하는 사이드바 하이퍼링크 색상 변경 함수
	paging("#tbody_2 tr", 5, 0);	//	페이징 처리 함수 호출
	tooltipFunction();				//	부트스트랩 tooltip
	hideTag("#tbody_2", true);		//	수정, 파일, 취소 버튼 숨김 처리
	
	$("#tbody_2 img").hide();
	for(var i = 1; i <= $("#tbody_2 tr").length; i++){
		if($("#" + i).find("input[name=PHOTO_NAME]").val() != '0'){
			$("#" + i).find("span").hide();
			$("#" + i).find("img").show();
		}	
	}
	
	
	
	$(".form-switch").on("click", () => {
		$(".form-check-input").prop("checked", $("#allCheck").prop("checked"))					
	})
	
	
	$("#modalForm").find("input[type=text]").on("change", function(){
		insertValidCheck(this);
	})
	
	$(document).on("click", ".btn", e => {	//	모든 버튼 클릭 이벤트 실행

		var ajaxTotalData = btnClickEventListener(e);			
		
		if(typeof ajaxTotalData != 'object'){
			return;
		}
		
		if(!confirm(confirmText)){
			if($(e.target).closest("tr") != undefined){
				$(e.target).closest("tr").find(".checkPhoto input[type=checkbox]").prop("checked", false);
				fileList[$(e.target).closest("tr").attr("id")] = oldFile;		
			} 
			confirmText = '';
			return;
		} 
		
		if($(e.target).closest("tr") != undefined){
			$(e.target).closest("tr").find(".checkPhoto input[type=checkbox]").prop("checked", false);
		} 
			
		$.ajax(
			ajaxTotalData	
		)
		.done(function(data){
			ajaxDone.excute(data);
			
			//	전역 변수, 객체 초기화 
			confirmText = '';
			ajaxDone = {};
		})
		.fail()
	})
})


$(() => {
	$(document).on("change", "input[type=file]", e => {
		file_image(e, $(e.target).attr("class"));
		e.target.value = '';
	})
})

var insertValidCheck = (e) => {
	validCheck[$(e).attr("id")] = false;
	$(e).attr("class", "form-control is-invalid");
	$("button[name=insert]").prop("disabled", true);
	
	if($(e).val() != ''){
		$(e).attr("class", "form-control is-valid");
		validCheck[$(e).attr("id")] = true;
	}
	
	for(var i = 0; i < validCheck.length; i++){
		if(!validCheck[i]){
			$("button[name=insert]").prop("disabled", true);
			return;
		}
		$("button[name=insert]").prop("disabled", false);
	}
}

var btnClickEventListener = (e) => {
	if($(e.target).attr("class") === undefined
		|| $(e.target).attr("class").split(" ")[0] != "btn"){
		return;
	}
	var isClickedbtnName = $(e.target).attr("name");
	var currentTargetParentTag = $(e.target).closest("tr"); 
	
	return dividebtnAction(isClickedbtnName, currentTargetParentTag);
	
}


function hideTag(parentTag, boolean){	//	수정불가 하게 태그들 숨김 및 readonly / DB에 저장된 MENU_HIDE 값으로 select 데이터 지정하는 function()
	$($(parentTag).find("button[name=save]"))
	              .hide();
	$($(parentTag).find($("button[name=PHOTO_SEARCH]")))
	              .hide();
	$($(parentTag).find($(".checkPhoto")))
	              .hide();			              
	$($(parentTag).find("button[name=cancel]"))
	              .hide();
	$(parentTag).find("img")
				.show();
//	$(parentTag).find("span")
//				.show();
	$(parentTag).find("button[name=delete]")
				.show();
	$(parentTag).find("button[name=update]")
				.show();              
	              
	format(parentTag, boolean);	// 해당 <tr> readonly 설정
}

function showTag(parentTag, boolean){
	$($(parentTag).find("button[name=save]"))
	              .show();
	$($(parentTag).find($("button[name=PHOTO_SEARCH]")))
	              .show();
	$($(parentTag).find($(".checkPhoto")))
	              .show();              
	$($(parentTag).find("button[name=cancel]"))
	              .show();
	$(parentTag).find("img")
				.hide();
//	$(parentTag).find("span")
//				.hide();
	$(parentTag).find("button[name=delete]")
				.hide();
	$(parentTag).find("button[name=update]")
				.hide();
	              
	format(parentTag, boolean);	// 해당 <tr> readonly 설정
}

function format(tagName, boolean){
	$(tagName).find("input")
	          .prop("readonly", boolean);
	$(tagName).find("textarea")
	          .prop("readonly", boolean);
	$(tagName).find("select")
	          .prop("disabled", boolean); 
}

var ifCancelbtnClick = (currentTargetParentTag, boolean) => {

	var dataList = [];
	var thisIndex = $(currentTargetParentTag).attr("id");
	
	if(boolean){
		$(currentTargetParentTag).find("input[name=MENU_NAME]").val((thisDataList[thisIndex])[0]);
		$(currentTargetParentTag).find("input[name=MENU_PRICE]").val((thisDataList[thisIndex])[1]);
		$(currentTargetParentTag).find("textarea[name=MENU_INFO]").val((thisDataList[thisIndex])[2]);
		$($(currentTargetParentTag).find("select option")[(thisDataList[thisIndex])[3]]).prop("selected", true)
		return;
	}
	
	dataList[0] = $(currentTargetParentTag).find("input[name=MENU_NAME]").val();
	dataList[1] = $(currentTargetParentTag).find("input[name=MENU_PRICE]").val();
	dataList[2] = $(currentTargetParentTag).find("textarea[name=MENU_INFO]").val();
	dataList[3] = $(currentTargetParentTag).find("select :selected").index();
	
	return dataList;
};

// 전역 변수 모음 시작
var selectIndex = $("#tbody_2").find("tr")
var validCheck = [false, true, false];
var fileList = [];
var oldFile = '0';
var newFile = '0';
var inputList = [];
var thisDataList = [];
var _beforeSend;
var confirmText = "";
var ajaxDone = {};
var deleteIndex = 0;
var deleteTrTag = '';
// 전역 변수 모음 끝

function dividebtnAction(btn, currentTargetParentTag){
	
	var index = 0;
	var btnParentTag = currentTargetParentTag;
	var _url = '';
	var _data;
	var ajaxExcuteCheck = false;
	
	switch(btn){
		
		case "PHOTO_SEARCH":
			index = $(btnParentTag).attr("id");
			$("." + index).click();
			ajaxExcuteCheck = false;
			break;
		
		case "update":
			index = $(btnParentTag).attr("id");
			fileList[index] = $(btnParentTag).find("input[name=PHOTO_NAME]").val();

			$(btnParentTag).find(".form-check-input").prop("checked", true);
			showTag(btnParentTag, false);
			
			thisDataList[index] = ifCancelbtnClick(btnParentTag, false);
			
			$(btnParentTag).find("span").hide();
			if(fileList[index] === '0'){
				$(btnParentTag).find(".checkPhoto").hide();
			}
			
			ajaxExcuteCheck = false;
			break;
			
		case "cancel":
			
			index = $(btnParentTag).attr("id");
			fileList[index] = $(btnParentTag).find("input[name=PHOTO_NAME]").val();
			ifCancelbtnClick(btnParentTag, true);
			$(btnParentTag).find(".form-check-input").prop("checked", false);
			$(btnParentTag).find(".checkPhoto input[type=checkbox]").prop("checked", false); 
			hideTag(btnParentTag, true);
			$(btnParentTag).find(".img").remove();

			if(fileList[index] === '0'){
				$(btnParentTag).find("span").show()
				$(btnParentTag).find("img").hide()
			}
			
			ajaxExcuteCheck = false;
			break;
			
		case "save": 

			if(!$(btnParentTag).find(".form-check-input").prop("checked")){
				return;
			}
			
			index = $(btnParentTag).attr("id");
			oldFile	= fileList[index];
			
			if(fileList[index] === undefined || fileList[index] === '0' || $(btnParentTag).find(".checkPhoto input[type=checkbox]").prop("checked")){
				fileList[index] = '0';
				confirmText = "*주의*\r\n사진을 등록 하지 않았습니다.\r\n이대로 진행 하시겠습니까?";
			} else {
				confirmText = "이대로 등록 하시겠습니까?";
			}
			
			_url = "smenuUpdate.st";
			_data = ajaxDataList(index, currentTargetParentTag);
			
			ajaxDone.excute = (data) => {
				$("#" + index).find("input[name=PHOTO_NAME]").val(data.PHOTO_NAME);
				$("#" + index).find("input[name=MENU_NAME]").val(data.MENU_NAME);
				$("#" + index).find("input[name=MENU_INFO]").val(data.MENU_INFO);
				$("#" + index).find("select").attr("name", data.MENU_HIDE);
				$("#" + index).find("input[name=MENU_PRICE]").val(data.MENU_PRICE);
				$("#" + index).find("input[name=MENU_NO]").val(data.MENU_NO);
				$("#PHOTO" + index).attr("src", "upload/" + data.PHOTO_NAME);
				$("#PHOTO" + index).css("display", "block");
				$("#" + index).find(".img").remove();
				$("#" + index).find("span").hide();
				$("#" + index).find("select option")
									 .eq($("#" + index).find("select")
									 						  .attr("name"))
									 .attr("selected", "selected");
				$("#" + index).find(".form-check-input").prop("checked", false);
				hideTag("#" + index, true);

				if(data.PHOTO_NAME === '0'){
					$("#PHOTO" + index).hide();
					$("#" + index).find("span").show();		
				}
				
				delete fileList[index];
			}
			
			ajaxExcuteCheck = true;
			break;	
		
		case "add":
			fileList[0] = '0';
			
			$.ajax({
				url: "smenuAddEvent.st",
				type: "get",
				async: false
			})
			.done(function(data){
				$(".sResmodal-footer").find("h3").remove();
				$("#modalData").append('<input type="hidden" name="MENU_NO" value="' + data.MENU_NO +'">');
				$(".sResmodal-footer").append("<h3>" + data.STORE_NAME + "</h3>");
			})
			
			$("#sResModal").css("display", "block");
			window.onclick = e => {	
				if (e.target == document.getElementById("sResModal")) {
					modalReset()
				}
			}
				
			$(".close").on("click", () => {	
				modalReset()
			})
			
			ajaxExcuteCheck = false;
			break;
			
		case "insert":
			
			newFile = fileList[0];

			if(typeof fileList[0] === "object"){
				confirmText = "이대로 등록 하시겠습니까?";	
			} else {
				confirmText = "*주의*\r\n사진을 등록 하지 않았습니다.\r\n이대로 진행 하시겠습니까?";
			}
			
			_url = "smenuInsert.st";
			_data = new FormData($("#modalForm")[0]) 
			_data.append("MENU_HIDE", $("#modalForm").find("select option")
                               						 .index($("#modalForm").find("select option:selected"))
                               						 .toString());
			_data.append("PHOTO_NAME", newFile);   
			                            						 
			ajaxDone.excute = (data) => {
				var firstIndex;
				if($("#tbody_2 tr").length < 1){
					firstIndex = 1;
				} else {
					firstIndex = parseInt($($("#tbody_2").find("tr")[0]).attr("id")) + 1
				}
				
				$("#sResModal").css("display", "none");
				$("#modalForm")[0].reset();
				$("#modalData").find("input[name=MENU_NO]").remove();
				$("#tbody_2").prepend(htmlTag(data, firstIndex));
				
				$("#img_1").empty();
				 
				$("#" + firstIndex).find("select option")
								   .eq($("#" + firstIndex).find("select")
									 					  .attr("name"))
								   .attr("selected", "selected");
				
				$("#modalData").find("input[type=text]").attr("class", "form-control is-invalid");
				$("#modalData").find("textarea").attr("class", "form-control is-invalid");
				$("#MENU_DATA").append("<input type='file' class='" + firstIndex + "' style='display:none;'>");
				$("button[name=insert]").prop("disabled", true);
				
				hideTag($("#" + firstIndex), true);
				$("#" + firstIndex).find("span").hide();
				if(data.PHOTO_NAME === '0'){
					$("#" + firstIndex).find("span").show();
					$("#" + firstIndex).find("img").hide();	
				}
				paging("#tbody_2 tr", 5, 0);
			};
			
			ajaxExcuteCheck = true; 
			break;
			
			
		case "delete":

			if(!$(currentTargetParentTag).find(".form-check-input").prop("checked")){
				return;
			}
			
			deleteTrTag = currentTargetParentTag;
			
			confirmText = "*주의*\r\n정말 삭제하시겠습니까?";
			
			deleteIndex = $(this).closest("tr").attr("id");
			
			_data = new FormData();
			_data.append("STORE_NO", $("input[name=STORE_NO]").val());
		 	$(".form-check-input:checked").each(function() {
	            _data.append("MENU_NO", $(this).closest("tr").find("input[name=MENU_NO]").val());
	        });
	        
	        _url = "smenuDelete.st";
	        
			ajaxDone.excute = (data) => {
				if(new Boolean(data.isTrue)){
					delete fileList[$("input[name='" + data.MENU_NO + "']").closest("tr").attr("id")];
					$("#MENU_DATA").remove("." + $("input[name='" + data.MENU_NO + "']").closest("tr").attr("id")); 
					$("input[name='" + data.MENU_NO + "']").closest("tr").remove();
					paging("#tbody_2 tr", 5, 0);
				}
			};
			
			ajaxExcuteCheck = true;
			break;
		
		case "totalDelete":
			
			var deleteAll = new Array();
			var _data = new FormData();
			$(".form-check-input:checked").each(function() {
	             deleteAll.push($(this).closest("tr").find("input[name=MENU_NO]").val());
	        });
			
			confirmText = "*경고*\r\n체크된 항목 전부 삭제됩니다.\r\n정말 삭제하시겠습니까?";
			
			_data.append("MENU_NO", deleteAll);	       
	       	_data.append("STORE_NO", $("input[name=STORE_NO]").val());
	        
	        _url = "smenuDelete.st";
	        ajaxDone.excute = (data) => {
				if(new Boolean(data)){
					$(".form-check-input:checked").each(function() {
						$("." + $(this).closest("tr").attr("id")).remove();
						delete fileList[$(this).closest("tr").attr("id")]; 
			        	$(this).closest("tr").remove();
			        });
			        
					paging("#tbody_2 tr", 5, 0);	
				}
			}; 
			
			ajaxExcuteCheck = true;
			break;
	}
	
	if(!ajaxExcuteCheck){
		return;
	}
	
	return aJaxObjectFunc(_url, _data)	//	첫번쨰 매개변수 = url, 두번쨰 매개변수 = ajax함수 내의 data
	
}

function aJaxObjectFunc(_url, _data){
	
	
	var ajaxObject = {
		type: "post",
		url: _url,
		data: _data,
		async: false,
		contentType: false,
        processData: false,
	}

	return ajaxObject;	
}

function ajaxDataList(index, row){
	
	var _data = new FormData();
	_data.append("PHOTO_NAME", fileList[index]);			
	_data.append("MENU_NO", $(row).find("input[name=MENU_NO]").val());
	_data.append("MENU_NAME", $(row).find("input[name=MENU_NAME]").val());
	_data.append("MENU_INFO", $(row).find("textarea[name=MENU_INFO]").val());
	_data.append("MENU_PRICE", $(row).find("input[name=MENU_PRICE]").val());
	_data.append("MENU_NAME", $(row).find("input[name=MENU_NAME]").val());
	_data.append("MENU_HIDE", $(row).find("select option")
                               	 	.index($(row).find("select option:selected"))
                               		.toString());
                               		
	return _data;                               		
}

function file_image(e, index){
	var file = e.target.files;
	var image = new Image();
	var imageFile = file[0];
	var ImageTempUrl = window.URL.createObjectURL(imageFile);
	image.src = ImageTempUrl;
	
	if($(e.target).attr("id") === 'inputFile_1'){
		image.style = "width:375px; height:375px;";
		fileList[0] = imageFile;
		$("#img_1").empty();
		$("#img_1").append(image);
	} else {
		$("#" + index).find(".img").remove();
		image.style = "width:175px; height:95px;";
		image.className = "img";
		fileList[index] = imageFile;	
		$("#" + index).find("span").hide();		
		$("#" + index).find("button[name=PHOTO_SEARCH]")
					  .closest("div")
					  .prepend(image);
	}
}

function htmlTag(menu, i){

	var imgIsEmpty = '<img id="PHOTO' + i + '" src="upload/' + menu.PHOTO_NAME + '" style="width:175px; height:95px;" alt=""/><span>사진 없음</span>';
	var photoIsExist = '<div class="checkPhoto mt-2">기존사진 삭제 여부&nbsp;<input type="checkbox" name="photoDelete" value="사진 제거"></div></div>';
	
	return  '<tr id="' + i + '">' +
				'<td><div class="form-check" style="display: flex; justify-content: center;">' +
					'<input type="hidden" name="PHOTO_NAME" value="' + menu.PHOTO_NAME + '">' +
					'<input class="form-check-input border border-dark" type="checkbox" value="" style="width:28px; height:28px;">' +
				'</td>' +
				'<td><input type="text" class="border border-dark form-control" name="MENU_NAME" value="' + menu.MENU_NAME + '"></td>' +
				'<td><div style="width:240px; display:flex; flex-direction: column; justify-content: center; align-items: center;">' +
					'<input type="hidden" name="MENU_NO" value="' + menu.MENU_NO + '">' + imgIsEmpty +
					'<div><button class="btn btn-success mt-3" name="PHOTO_SEARCH">사진 선택</button></div>' + photoIsExist +
				'</td>' +
				'<td><textarea style="resize: none;" cols="50" rows="3" name="MENU_INFO">' + menu.MENU_INFO + '</textarea></td>' +
				'<td><input type="text" class="form-control border border-dark" name="MENU_PRICE" value="' + menu.MENU_PRICE + '"></td>' +
				'<td>' +
					'<select class="form-select border border-dark" name="' + menu.MENU_HIDE + '">' + 
						'<option value="품절">품절</option>' +
						'<option value="판매중" style="font-size: 12px;">판매중</option>' +
					'</select>' +
				'</td>' +
				'<td>' +
					'<button type="button" class="btn btn-outline-warning" name="update"' +
					'style="text-align: center;width:60px;height:50px;margin: 0 auto;">수정' +
					'</button>' +
					'<button type="button" name="save" class="btn btn-outline-success"' +
					'style="text-align: center;width:60px;height:50px;margin: 0 auto;">저장</button>' +
				'</td>' +
				'<td>' +
					'<button type="button" class="btn btn-outline-danger" name="delete"' +
					'style="text-align: center;width:60px;height:50px;margin: 0 auto;">' +
					'삭제</button>' +
					'<button type="button" class="btn btn-outline-danger" name="cancel"' +
					'style="text-align: center;width:60px;height:50px;margin: 0 auto;">' +
					'취소</button>' +
				'</td>' +
			'</tr>' 
}		

function modalReset(){
	$("#sResModal").css("display", "none");
	$("#modalData").find("input[name=MENU_NO]").remove();
	$(".sResmodal-footer").find("h3").remove();
	$("#modalForm")[0].reset();
	$('#img_1').empty();
	$("button[name=insert]").prop("disabled", true);
	$("#modalData").find("input[type=text]").attr("class", "form-control is-invalid");
	fileList[0] = '0';	
}

var tooltipFunction = () => {
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))			
	$('[data-toggle="tooltip"]').tooltip()
}	 