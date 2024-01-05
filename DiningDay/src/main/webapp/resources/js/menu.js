/**
 * 
 */

/** 사진 미리보기 적용 js파일 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/Store/resour/js/photo_control.js">' +
			   '</script>');

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
	.done(												
		function(data){
			targetColor($("#smenu"));
			/*html title 부트스트랩 코드 시작*/ 
			const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
			const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))			
			$('[data-toggle="tooltip"]').tooltip()
			/*html title 부트스트랩 코드 끝*/
			
			for(let menu of data){
				$("#tbody_2").append(htmlTag(menu))
			}
			
			for(var i = 0; i < $("#tbody_2").find("select").length; i++){
				var select = $("#tbody_2").find("select").eq(i);
				$(select).find("option").eq(select.attr("name")).attr("selected", "selected");
			}
			
			hideTag("#tbody_2");		//	수정불가 하게 태그들 숨김 및 readonly / DB에 저장된 MENU_HIDE 값으로 select 데이터 지정
			paging("#tbody_2 tr", 5);	//	페이징 처리 함수 호출
			
			
			$(".form-switch").on("click", () => {
				$(".form-check-input").prop("checked", $("#allCheck").prop("checked"))					
			})
 				
			$(document).on("click", ".btn", e => {
				
				var execute = clickFunction(e);
				var dataList = execute[0];
				var ajaxDone = execute[1];
	
				if(dataList.length === 0 && Object.keys(ajaxDone).length === 0){
					return;
				}
				
				for (let key of dataList[1].keys()) {
				  console.log(key);
				}
				
				for (let value of dataList[1].values()) {
				  console.log(value);
				}
				
//				debugger;
				
				$.ajax(
					aJaxFunction(dataList)
				)
				.done(function(data){
//					debugger;
					alert("성공");
					ajaxDone.func(data);
				})
				.fail(function(fail){
					alert("실패");
					var a = fail;
				})
			})
		}
	)
	.fail()	
})

function hideTag(parentTag){	//	수정불가 하게 태그들 숨김 및 readonly / DB에 저장된 MENU_HIDE 값으로 select 데이터 지정하는 function()
	$($(parentTag).find("button[name=save]"))
	              .hide();
	$($(parentTag).find($("input[type=file]")))
	              .hide();
	$($(parentTag).find("button[name=cancel]"))
	              .hide();
	format(parentTag, true);	// 해당 <tr> readonly 설정
}

function format(tagName, boolean){
	$(tagName).find("input")
	          .prop("readonly", boolean);
	$(tagName).find("textarea")
	          .prop("readonly", boolean);
	$(tagName).find("select")
	          .prop("disabled", boolean); 
}
	
function clickFunction(e){
	
	var btnTarget = $(e.target).attr("name");			//	현재 클릭된 버튼 name 값 
	var tr = e.target.closest("tr");					//	현재 클릭된 버튼의 부모요소 tr태그
	var formdata = new FormData();
	var ajaxDataList = [];								//	ajax에 담을 (data: ~~~) 부분
														//	ajaxDataList[0] => url
														//	ajaxDataList[1]	=> 전송할 데이터
														//	ajaxDataList[2]	=> 데이터 리턴 받을 경우 true, 데이터 리턴 받지 않을 경우 false	
	var ajaxDone = {};
	var index = $(tr).index();										//	현재 타겟의 <tr>태그의 index
	var indexControl = (index) => $("#tbody_2").find("tr")[index]	//	<tbody> 태그 내의 해당 <tr>태그 찾기
	
	switch(btnTarget){
		
		/* MENU_NO MAX 값 가져오기 */
		case "add":
//			debugger;
			formdata.append("STORE_NO",$("input[name=STORE_NO]").val());
			ajaxDataList = ["smenuAddEvent.st", formdata, true];
			ajaxDone.func = (data) => {
				$("#modalData").append('<input type="hidden" name="MENU_NO" value="' + data.MENU_NO +'">');
				$("#modalData").find("input[type=file]").show();
				if(typeof(file) == 'object'){
					file = '0';	
				}
								
				format("#modalData", false);
			}
			
			window.onclick = e => {	
				if (e.target == document.getElementById("sResModal")) {
		    		modalReset()
		  		}
			}
			
			$("#sResModal").css("display", "block");	
			$(".close").on("click", () => {	
				modalReset()
			})
			break;
			
		/* 한 행 등록 */ 
		case "insert":	
//			debugger;								
			ajaxDataList = ["smenuInsert.st", createData($("#modalData")), true];
			ajaxDone.func = (data) => {
				$("#sResModal").css("display", "none");
				$("#modalForm")[0].reset();
				$("#modalData").find("input[name=MENU_NO]").remove();
				$("#tbody_2").prepend(htmlTag(data));
				
				// append 한 행 file event 걸어주기
				file_image();
				
				var parents = $("#tbody_2").find("tr")[0];
				$($(parents).find("select option"))
				            .eq($(parents).find("select").attr("name"))
				            .attr("selected", "selected");
				
				hideTag($("#tbody_2").find("tr")[0]);
				paging("#tbody_2 tr", 5);
			};
			break;
				
		/* 한 행 수정 */	
		case "save":	
//			debugger;	
			var ischecked = $(tr).find(".form-check-input").prop("checked");
			if(!ischecked){
				break;
			}
										
			ajaxDataList = ["smenuUpdate.st", createData(tr), true];
			ajaxDone.func = (data) => {
				$(indexControl(index)).remove();
				if(index === 0){
					$("#tbody_2").prepend(htmlTag(data));		
				} else {
					$(indexControl(index - 1)).after(htmlTag(data));
				}
				
				$($(indexControl(index)).find("select option"))
									 	.eq($(indexControl(index)).find("select").attr("name"))
							         	.attr("selected", "selected");
							    
				hideTag(indexControl(index));
			};
			break;
			
		/* 한 행 삭제 */	
		case "delete":	
//			debugger;	
			var ischecked = $(tr).find(".form-check-input").prop("checked");
			if(!ischecked){
				break;
			}
			
	        $(".form-check-input:checked").each(function() {
	            formdata.append("MENU_NO", $(this).closest("tr").find("input[name=MENU_NO]").val());
	        });
	        
	        formdata.append("STORE_NO", $("input[name=STORE_NO]").val());
	        
	        ajaxDataList = ["smenuDelete.st", formdata, true];
			ajaxDone.func = (data) => {
				if(new Boolean(data)){
					$(indexControl(index)).remove();
					paging("#tbody_2 tr", 5);	
				}
			};	
			break;
			
		/* 다중 행 삭제 */	
		case "totalDelete":	
//			debugger;	
			var cnt = $(".form-check-input:checked").length;
			if(cnt === 0) {
				break;
			}
			
	        
			var deleteAll = new Array();
			
			$(".form-check-input:checked").each(function() {
	             deleteAll.push($(this).closest("tr").find("input[name=MENU_NO]").val());
	        });
			
//			debugger;
			formdata.append("MENU_NO", deleteAll);	       
	       	formdata.append("STORE_NO", $("input[name=STORE_NO]").val());
	        
	        ajaxDataList = ["smenuDelete.st", formdata, true];
	        ajaxDone.func = (data) => {
				if(new Boolean(data)){
					$(".form-check-input:checked").each(function() {
			        	$(this).closest("tr").remove();
			        });
			        
					paging("#tbody_2 tr", 5);	
				}
			};				
			break;	
			
		case "update":
			$(tr).find("span")
			     .hide();					//	<span> 숨기기
			$(e.target).hide();							//	수정 버튼 숨기기 
			$($(e.target).next()).show();				//	저장 버튼 보이기
			$(tr).find("button[name=delete]")
			     .hide();
			$(tr).find("button[name=cancel]")
				 .show();

			var thisCheckBox = $(tr).find(".form-check-input");
			$(thisCheckBox).prop("checked", true);

			var fileInput = $(tr).find($("input[type=file]"))
			$(fileInput).show();
			format(tr, false);							//	해당 <tr> readonly 해제
			break;	
			
		case "cancel":
			hideTag(tr);
			$(tr).find("button[name=delete]")
			     .show();
			$(tr).find("button[name=update]")
			     .show();
			$(tr).find("span")
			     .show();
			break;	
	}
	
	return new Array(ajaxDataList, ajaxDone);
}

function aJaxFunction(dataList){
	
	if(dataList.lenght === 0){
		return;
	}
	
	var ajaxJson = {
		type: "post",
		url: dataList[0],
		cache: false,
		data: dataList[1],
		contentType: false,
        processData: false 
	}
	
	if(dataList[2]){
		ajaxJson.dataType = "json";
	}

	return ajaxJson;	
}

			 
function createData(row){
//	debugger;
	var formdata = new FormData();
	var filedata = file;
	
	if(typeof(filedata) == 'object'){
		filedata = filedata[0];
	} else {
		filedata = '0';
	}
	
	formdata.append('STORE_NO', $("input[name=STORE_NO]").val());
	formdata.append('MENU_NO', $(row).find("input[name=MENU_NO]").val());
	formdata.append('PHOTO_NAME', filedata);
	formdata.append('MENU_INFO', $(row).find("textarea[name=MENU_INFO]").val());
	formdata.append('MENU_PRICE', $(row).find("input[name=MENU_PRICE]").val());
	formdata.append('MENU_NAME', $(row).find("input[name=MENU_NAME]").val());
	formdata.append('MENU_HIDE', $(row).find("select option")
	                                   .index($(row).find("select option:selected"))
	                                   .toString());
	//	for(let [key, value] of formData.entries()) {
	//   		console.log(key, value);
	//	}
	
	return formdata;
}

function modalReset(){
	$("#sResModal").css("display", "none");
	$("#modalData").find("input[name=MENU_NO]").remove();
	$("#modalForm")[0].reset();
	$('#img_1').empty();	
}

function htmlTag(menu){
	return  '<tr>' +
				'<td><div class="form-check" style="display: flex; justify-content: center;">' +
					'<input class="form-check-input border border-dark" type="checkbox" value="" style="width:28px; height:28px;">' +
				'</td>' +
				'<td><input type="text" class="border border-dark form-control" name="MENU_NAME" value="' + menu.MENU_NAME + '"></td>' +
				'<td><input type="hidden" name="MENU_NO" value="' + menu.MENU_NO + '">' +
					'<span>' + menu.PHOTO_NAME + '</span>' +
					'<input type="file" class="border border-dark form-control" id="inputFile_2" name="PHOTO_NAME" aria-describedby="fileButton_1">' +
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

				
							 