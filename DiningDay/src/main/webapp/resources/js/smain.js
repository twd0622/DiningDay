/**
 * 
 */

/** 사진 미리보기 적용 js파일 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/photo_control.js">' +
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
	
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));			
	$('[data-toggle="tooltip"]').tooltip();
	
	$('#timepicker_1_1').timepicki();
//	$('#timepicker_1_2').timepicki();
//	$('#timepicker_2_1').timepicki();
//	$('#timepicker_2_2').timepicki();
//	$('#timepicker_3_1').timepicki();
//	$('#timepicker_3_2').timepicki();
})







