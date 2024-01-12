/**
 * 
 */

//function thumbnail(){
//	$("#inputfile_1").change(e => {
//		var file = e.target.files;
//				
//		var image = new Image();
//		var ImageTempUrl = window.URL.createObjectURL(file[0]);
//	
//		image.src = ImageTempUrl;
//		image.style = "width:300px; height:300px; padding:6.5px; z-index: 1;";
//
//		$('#img_1').empty();
//		$("#img_1").append(image);
//	});
//}

var files = [true, true, true];

function thumbnail_banner(){
	$("input[type=file]").change(function(){

		var index = $(this).attr("id").split("_")[1];
		var currentImageEdge = $("#fileEdge_" + index);
		var btnclassName = "btn btn-success";
		file = this.files;
		
		files[index - 1] = true;
		$(currentImageEdge).empty()
		var image = new Image();
		image.src = window.URL.createObjectURL(file[0]);
		image.style = "width:300px; height:300px; padding:6.5px; z-index: 1;";

		files[index - 1] = false;
		$(currentImageEdge).append(image);
	});
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