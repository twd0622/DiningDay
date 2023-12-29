/**
 * 
 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/Store/resour/js/photo_control.js">' +
			    '</script>');

function format(tagName, boolean){
	$(tagName).find("input").prop("readonly", boolean);
	$(tagName).find("textarea").prop("readonly", boolean);
	$(tagName).find("select").prop("disabled", boolean); 
}

$(() => {	
	
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
						   +  '<td><input type="file" class="form-control" id="inputFile_1" name="MENU_PHOTO" \r\n' 
						   +  'aria-describedby="fileButton_1"></td> <td><textarea style="resize: none;" cols="40" rows="3"\r\n'
						   +  'name="MENU_INFO"></textarea></td> <input type="hidden" name="PHOTO_TYPE">\r\n'
						   +  '<td><input type="text" class="form-control" name="MENU_PRICE" placeholder="ex) 17,000"></td> \r\n'
						   +  '<td colspan="2"><select class="form-select"><option selected value="판매중">판매중</option><option value="품절">품절</option></select></td>\r\n' 
						   +  '<td><button type="button" id="save" class="btn btn-success">저장</button></td>\r\n'
						   +  '<td><button type="button" class="btn btn-danger" id="delete"\r\n'
						   +  'style="text-align: center;width:40px;height:40px;margin: 0 auto;">\r\n'
				           +  '<ion-icon name="trash-outline"></ion-icon></button></td></tr>'
						  )
	  	$("#add").attr("disabled", true);
	  	
	  	var dataAdd = createData(tr_1);
	  	$.ajax({
			type: "post",
			url: "smenuUpdate.st",
			cache: false,
			data: dataAdd,
			contentType : false,
			processData : false
		})
		.done(
			function(data){
				$('#tbody_2').load(location.href+' #tbody_2');
			}
			
		)
		.fail()
	  	
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
		
		var dataUpdate = createData(tr);

		$.ajax({
			type: "post",
			url: "smenuUpdate.st",
			cache: false,
			data: dataUpdate,
			contentType : false,
			processData : false
		})
		.done(
			function(data){
			}
		)
		.fail(
			function(fail){
			}
		)
		
	})	
})		
	


function createData(row){
	
	var formdata = new FormData();
	
	formdata.append('MENU_NO', row.find("input[name=MENU_NO]").val());
	formdata.append('PHOTO_NAME', file[0]);
	formdata.append('MENU_INFO', row.find("textarea[name=MENU_INFO]").val());
	formdata.append('MENU_PRICE', row.find("input[name=MENU_PRICE]").val());
	formdata.append('MENU_NAME', row.find("input[name=MENU_NAME]").val());
	formdata.append('MENU_HIDE', row.find("select option").index($("option:selected")));
	
	return formdata;
}




