/**
 * 
 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/dateResult.js">' +
			    '</script>');
			    
/**
 * dateResult.js 파일	 사용법
 * dateTotal.year => 현재 년도 출력
 * dateTotal.month => 현재 월 출력
 * dateTotal.day => 현재 일 출력
 * dateTotal.getdayweek => 현재 요일 출력
 * 
 * 2023년01시22분15시30분20초 
 */

$(() => {
	$("input[name=RES_DATE]").on("change", e => {
		$("#datePrint").val($(e.target).val())
	})
	
	$("button").on("click", e => {
		$(e.target.closest("tr")).remove();
	})
})