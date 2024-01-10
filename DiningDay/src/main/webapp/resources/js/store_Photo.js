/**
 * 
 */

function thumbnail(){
	$("input[type=file]").change(e => {
		file = e.target.files;
				
		var image = new Image();
		var ImageTempUrl = window.URL.createObjectURL(file[0]);
	
		image.src = ImageTempUrl;
		image.style = "width:300px; height:300px; padding:6.5px; z-index: 1;";

		$('#img_1').empty();
		$("#img_1").append(image);
	});
}

function banner(){
	
}

// 확장자가 이미지 파일인지 확인
function isImageFile(file) {

    var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 

    return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
}
// 파일의 최대 사이즈 확인
function isOverSize(file) {

    var maxSize = 3 * 1024 * 1024; // 3MB로 제한 

    return (file.size < maxSize) ? true : false;
} 