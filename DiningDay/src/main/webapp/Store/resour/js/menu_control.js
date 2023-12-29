/**
 * 
 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/Store/resour/js/photo_control.js">' +
			    '</script>');

$(() => {	
	
//	debugger;
	$.ajax({
		data: {STORE_NO: $("input[name=STORE_NO]").val()},	
		type: "get",
		dataType: "json",
		url: "smenuList.st"												
	})										
	.done(												
		function(data){
			for(let menu of data){
				$("#tbody_2").append(htmlTag(menu))
			}
					
			$("button[name=save]").hide();
			$($("#tbody_2").find($("input[type=file]"))).hide();
			format("#tbody_2", true);	// 해당 <tr> readonly 설정
			
			for(var i = 0; i < $("select").length; i++){
				var select = $("select").eq(i);
				select.find("option").eq(select.attr("name")).attr("selected", "selected");
			}
			
			// + 아이콘(추가) 클릭시 이벤트
			$("#add").on("click", e => {
				$("#tbody_1").append( '<tr id="tr_1"><td><input type="text" class="form-control" name="MENU_NAME"> \r\n'
								   +  '<input type="hidden" name="MENU_NO" value="M"></td> \r\n' 
								   +  '<td><input type="file" class="form-control" id="inputFile_1" name="PHOTO_NAME" \r\n' 
								   +  'aria-describedby="fileButton_1"></td> <td><textarea style="resize: none;" cols="40" rows="3"\r\n'
								   +  'name="MENU_INFO" placeholder="메뉴 정보 입력해주세요 :)"></textarea></td> <input type="hidden" name="PHOTO_TYPE">\r\n'
								   +  '<td><input type="text" class="form-control" name="MENU_PRICE" placeholder="ex) 17,000"></td> \r\n'
								   +  '<td colspan="2"><select class="form-select"><option selected value="판매중">판매중</option><option value="품절">품절</option></select></td>\r\n' 
								   +  '<td><button type="button" id="save" class="btn btn-success">저장</button></td>\r\n'
								   +  '<td><button type="button" class="btn btn-danger" id="delete"\r\n'
								   +  'style="text-align: center;width:40px;height:40px;margin: 0 auto;">\r\n'
						           +  '<ion-icon name="trash-outline"></ion-icon></button></td></tr>'
								    )	
			  	$("#add").attr("disabled", true);
			  	
				  	//		메뉴 데이터 한 행 insert 실행
			  	$("#save").on("click", () => {
					  
					var dataAdd = createData($("#tr_1"));			//	aJax() function(매개변수)
					for (let key of dataAdd[0].keys()) {
					  console.log(key);
					}
					
					for (let value of dataAdd[0].values()) {
					  console.log(value);
					}					
					debugger;
				  	$.ajax(											//	매개변수 0: url
						aJax("smenuInsert.st", dataAdd[0])			//	매개변수 1: data  
					)												//	매개변수 2: dataAccept 여부
					.done(											//	매개변수 3: json 데이터 삭제 및 수정
						function(data){
							alert(data);
							$("#tr_1").remove();
							$("#add").attr("disabled", false)
							$("#tbody_2").append(htmlTag(data));
							$("button[name=save]").hide();
							$($("#tbody_2").find($("input[type=file]"))).hide();
							format("#tbody_2", true);	// 해당 <tr> readonly 설정	
						}
					)
					.fail(
						function(fail){
						}
					)
				}) // 메뉴 데이터 한 행 insert 종료
			  	
				$("#delete").click(e => {
					$("#tr_1").remove();
					$("#img_1").empty();
					$("#add").attr("disabled", false)
				})	
				
			  	file_image(); // 사진 미리보기 함수 호출 (js파일 : photo_control)
			})
			
			//	수정 버튼 클릭시 이벤트
			$("button[name=update]").on("click", e => {	
				var tr = $(e.target.closest("tr"));
		
				$(tr).find("span").hide();		//	<span> 숨기기
				$(e.target).hide();				//	수정 버튼 숨기기 
				$($(e.target).next()).show();	//	저장 버튼 보이기
				
				var fileInput = $(tr).find($("input[type=file]"))
				$(fileInput).show();
				
				format(tr, false);	//	해당 <tr> readonly 해제
			})
				
			//	저장 버튼 클릭시 이벤트
			$("button[name=save]").on("click", e => {
				
				$("#img_2").empty();
				
				var tr = $(e.target.closest("tr"));
				
				$(e.target).hide();				//	저장 버튼 숨기기
				$($(e.target).prev()).show();	//	수정 버튼 보이기
				$(tr).find("span").show();		//	<span> 보이기
				
				var fileInput = $(tr).find($("input[type=file]"))
				$(fileInput).hide();
				
				format(tr, true);	//	해당 <tr> readonly 설정
				
				var dataUpdate = createData(tr);					//	aJax() function(매개변수)
				$.ajax(												//	매개변수 0: url
					aJax("smenuUpdate.st", dataUpdate[0])		//	매개변수 1: data
				)													//	매개변수 2: dataAccept 여부
				.done(												//	매개변수 3: json 데이터 삭제 및 수정			
					function(data){
						alert(data);
					}
				)
				.fail(
					function(fail){
						alert("실패");
					}
				)
			})	
					
		}
	)
	.fail(
		function(fail){
			alert("실패");
		}
	)
	
})		

function format(tagName, boolean){
	$(tagName).find("input").prop("readonly", boolean);
	$(tagName).find("textarea").prop("readonly", boolean);
	$(tagName).find("select").prop("disabled", boolean); 
}

// multiple data function()
function createData(row){
	
	var formdata = new FormData();
	var filedata = "사진 없음";
	var deleteCheck = true;
	
	if(file != null){
		filedata = file[0];
		deleteCheck = false;
	}
	
	formdata.append('MENU_NO', row.find("input[name=MENU_NO]").val());
	formdata.append('PHOTO_NAME', filedata);
	formdata.append('MENU_INFO', row.find("textarea[name=MENU_INFO]").val());
	formdata.append('MENU_PRICE', row.find("input[name=MENU_PRICE]").val());
	formdata.append('MENU_NAME', row.find("input[name=MENU_NAME]").val());
	formdata.append('MENU_HIDE', row.find("select option").index($("option:selected")));
	
	return new Array(formdata, deleteCheck);
}

// multiple ajax function()
function aJax(url, data){
	
	var ajaxStart =	{
		type: "post",
		url: url,
		cache: false,
		data: data,
		contentType: false,
        processData: false 
	}
	
	return ajaxStart;
}

function htmlTag(menu){
	return   '<tr>'
			+	'<td><input type="text" class="form-control" name="MENU_NAME" value=' + menu.MENU_NAME+ '></td>'
			+	'<td>'
			+		'<input type="hidden" name="MENU_NO" value="' + menu.MENU_NO + '">'
			+		'<span>' + menu.PHOTO_NAME + '</span>'
			+		'<input type="file" class="form-control" id="inputFile_2" name="PHOTO_NAME" aria-describedby="fileButton_1">'
			+	'</td>'
			+	'<td><textarea style="resize: none;" cols="50" rows="3" name="MENU_INFO">' + menu.MENU_INFO + '</textarea></td>'
			+	'<td><input type="text" class="form-control" name="MENU_PRICE" value="' + menu.MENU_PRICE + '"></td>'
			+	'<td>'
			+		'<select class="form-select" name="' + menu.MENU_HIDE + '">' 
			+			'<option value="품절">품절</option>'
			+			'<option value="판매중" style="font-size: 12px;">판매중</option>'
			+		'</select>'
			+	'</td>'
			+	'<td>'
			+		'<button type="button" class="btn btn-outline-warning" name="update"'
			+    	'style="text-align: center;width:60px;height:50px;margin: 0 auto;">수정'
			+    	'</button>'
			+    	'<button type="button" name="save" class="btn btn-outline-success">저장</button>'
			+   '</td>'
			+	'<td>'
			+       '<button type="button" class="btn btn-outline-danger" name="delete_2"'
			+    		'style="text-align: center;width:50px;height:50px;margin: 0 auto;">'
			+           '<ion-icon name="trash-outline"></ion-icon>'
			+		'</button>'
			+	'</td>'
			+'</tr>';
}  
		