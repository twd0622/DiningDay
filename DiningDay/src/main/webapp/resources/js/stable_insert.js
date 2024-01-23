/**
 * 
 */
/** 사진 미리보기 js파일 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/photo_control.js">' +
			   '</script>');
			   
/** 범용성 js파일 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/variableCode.js">' +
			   '</script>');				   
			   
$(() => {
	
	targetColor($("#stable_insert"));
	
	$("input[type=text]").change(function(){
		var className = "form-control is-invalid";
		var index = $(this).attr("id").split("_")[1] - 1;
		var validisChecked = false;
		
		if($(this).val() != ''){
			className = "form-control is-valid";
			validisChecked = true;
		}
		
		$(this).attr("class", className);
		validCheckArray[index] = validisChecked;

		for(var i = 0; i < $("input[type=text]").length; i++){

			var validisTrueChecked = validCheckArray[i];
			$("#insertBtn").prop("disabled", !validisTrueChecked);
			
			if(!validisTrueChecked) return;
		}
	})
	
	$("#insertBtn").on("click", function(){
		var _data = new FormData($("#SEAT_DATA")[0]);
		
		if($("#photo_1").val() === ''){
			_data.set("PHOTO_NAME", '0');
		}
		_data.append("OWN_NO", $("input[name=OWN_NO]").val());
		_data.append("STORE_NO", $("input[name=STORE_NO]").val());
		
		debugger;
		for (let key of _data.keys()) {
		  console.log(key);
		}
		
		for (let value of _data.values()) {
		  console.log(value);
		}

		$.ajax({
			url:"seatInsert.st",
			data: _data,
			type: "post",
			processData: false,
			contentType: false,
			async: false
		})
		.done(function(data){
			if(new Boolean(data)){
				alert("해당 좌석이 등록되었습니다.");
				$("#SEAT_DATA")[0].reset();
				$("#img_1").empty();
				$("input[type=text]").attr("class", "form-control is-invalid");
			}
		})	
	})
	
})		

var validCheckArray = [false, false, false, false];	   