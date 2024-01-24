var reviewTag = function(data){
	for(reviewList of data){
		var review = 
			'<div id="'+ reviewList.REV_NO +'" class="review">'
		+		'<div class="flexBox">'
		+			'<div class="reviewWriter_box">'
		+				'<span class="cus_nick">'+ reviewList.CUS_NICK +'</span>'
		+				'<span class="review_date">'+ reviewList.REV_DATE +'</span>'
		+			'</div>'
		+			'<div>'
		+				'<span class="reviewReportBtn">신고</span>'
		+			'</div>'
		+		'</div>'
		+ 		'<div class="review_score_box">'
		+ 			'<span class="review_grade">'+ reviewList.REV_SCORE +'</span>'
		+ 		'</div>'
		+ 		'<div class="review_image_box">'
		+ 		'</div>'
		+ 		'<div class="flexBox">'
		+ 			'<div class="reservation_info_box">'
		+ 				'<span>좌석: '+ reviewList.SEAT_NAME +'</span>'
		+ 				'<span>메뉴: '+ reviewList.MENU_NAME +'</span>'
		+ 			'</div>'
		+ 		'</div>'
		+ 		'<div class="review_content">'
		+ 			'<span>'+ reviewList.REV_CONTENT +'</span>'
		+ 		'</div>'
		+       '<div class="review_answer_box">'
		+ 		'</div>'
		+ 	'</div>';
		
		var image = '<div class="review_image"><img src="upload/'+ reviewList.REV_IMAGE +'" alt="'+ reviewList.REV_IMAGE +'" style="width:100%; height:100%"/></div>'
		
		var NoAnswer = 
		 			'<div class="review_answer_info">'
		+ 				'<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span>'
		+ 				'<span class="owner">사장님</span>'
		+ 			'</div>'
		+ 			'<div class="answer_write_box">'
		+ 				'<textarea class="form-control answer_write"></textarea>'
		+ 				'<button class="btn answerBtn">등록</button>'
		+ 			'</div>';
		
		var YesAnswer = 
		 			'<div class="flexBox">'
		+				'<div class="review_answer_info">'
		+					'<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span>'
		+					'<span class="owner">사장님</span>'
		+					'<span class="review_answer_date">'+ reviewList.ANSWER_DATE +'</span>'
		+				'</div>'
		+				'<div>'
		+					'<span class="updateBtn">수정</span>'
		+				'</div>'					
		+			'</div>'
		+			'<div class="review_answer_content">'
		+				'<span style="text-align: left;">'+ reviewList.ANSWER_CONTENT +'</span>'
		+			'</div>';
		
		var star = '<span class="material-icons review_grade_icon" style="color: #F7CE3E;">grade</span>'
		var blankStar = '<span class="material-symbols-outlined review_grade_icon" style="color: #F7CE3E;">grade</span>' 
		
		
		$(".review_box").append(review)
		
		for(var i=0; i<5-reviewList.REV_SCORE; i++){
			$("#"+ reviewList.REV_NO).find(".review_score_box").prepend(blankStar);		
		}
		for(var i=0; i<reviewList.REV_SCORE; i++){
			$("#"+ reviewList.REV_NO).find(".review_score_box").prepend(star);		
		}
		
		if(reviewList.SELECT == '2') $("#"+ reviewList.REV_NO).find(".review_answer_box").append(NoAnswer)
		else $("#"+ reviewList.REV_NO).find(".review_answer_box").append(YesAnswer)
		
		if(reviewList.REV_IMAGE != '0') $("#"+ reviewList.REV_NO).find(".reivew_image_box") .append(image)
	
	} // for문 종료
	
	$(".answerBtn").on("click", function(){
		answerBtnClick($(this))
	})
	
	$(".updateBtn").on("click", function(){
		updateBtnClick($(this));
	})
	
	$(".reviewReportBtn").on("click", function(){
		reviewReportModalOpen($(this))
	})
}

// 등록 버튼 클릭
var answerBtnClick = function(e){
	var answerContent = e.siblings(".answer_write").val().trim();
	if(answerContent == ''){
		alert("내용을 입력하세요!")
		return;
	}
	
	$.ajax({
		type: "post",
		url:"answerInsert.st",
		data: {
			REV_NO: e.parents(".review").attr("id"),
			ANSWER_CONTENT: answerContent,
		}
	})
	.done(function(data){
		$("#"+data.REV_NO).find(".review_answer_box").empty();
			
		var YesAnswer = 
		 			'<div class="flexBox">'
		+				'<div class="review_answer_info">'
		+					'<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span>'
		+					'<span class="owner">사장님</span>'
		+					'<span class="review_answer_date">'+ data.ANSWER_DATE +'</span>'
		+				'</div>'
		+				'<div>'
		+					'<span class="updateBtn">수정</span>'
		+				'</div>'					
		+			'</div>'
		+			'<div class="review_answer_content">'
		+				'<span style="text-align: left;">'+ data.ANSWER_CONTENT +'</span>'
		+			'</div>';
		
		$("#"+data.REV_NO).find(".review_answer_box").append(YesAnswer);
		
		$("#"+data.REV_NO).find(".updateBtn").on("click", function(){
		updateBtnClick($(this));
	})	
	})
	
	
};

// 수정 버튼 클릭
var updateBtnClick = function(e){
	var REV_NO = e.parents(".review").attr("id");
	var answerContent = $("#"+REV_NO).find(".review_answer_content span").text();
	var answerDate = $("#"+REV_NO).find(".review_answer_date").text();
	
	$("#"+REV_NO).find(".review_answer_box").empty();
	
	var UpdateAnswer = 
					'<div class="flexBox">'
		+ 				'<div class="review_answer_info">'
		+ 					'<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span>'
		+ 					'<span class="owner">사장님</span>'
		+ 				'</div>'
		+	           '<div>'
		+					'<span class="cancelBtn">X</span>'
		+				'</div>'
		+			'</div>'
		+ 			'<div class="answer_write_box">'
		+ 				'<textarea class="form-control answer_write">'+answerContent+'</textarea>'
		+ 				'<button class="btn updateAnswerBtn">수정 등록</button>'
		+ 			'</div>';
		
	$("#"+REV_NO).find(".review_answer_box").append(UpdateAnswer);
	
	$("#"+REV_NO).find(".updateAnswerBtn").on("click", function(){
		updateAnswerBtnClick($(this));
	})
	
	$("#"+REV_NO).find(".cancelBtn").on("click", function(){
		cancelBtnClick(REV_NO, answerContent, answerDate);
	})
}

// 수정 취소 버튼 클릭
var cancelBtnClick = function(REV_NO, answerContent, answerDate){
	var YesAnswer = 
		 			'<div class="flexBox">'
		+				'<div class="review_answer_info">'
		+					'<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span>'
		+					'<span class="owner">사장님</span>'
		+					'<span class="review_answer_date">'+ answerDate +'</span>'
		+				'</div>'
		+				'<div>'
		+					'<span class="updateBtn">수정</span>'
		+				'</div>'					
		+			'</div>'
		+			'<div class="review_answer_content">'
		+				'<span style="text-align: left;">'+ answerContent +'</span>'
		+			'</div>';
		
		$("#"+REV_NO).find(".review_answer_box").empty();
		$("#"+REV_NO).find(".review_answer_box").append(YesAnswer);
		
		$("#"+REV_NO).find(".updateBtn").on("click", function(){
			updateBtnClick($(this));
		})
}


// 수정 등록 버튼 클릭
var updateAnswerBtnClick = function(e){
	if(e.siblings(".answer_write").val().trim() == ''){
		alert("내용을 입력하세요!")
		return;
	}
	
	$.ajax({
		type: "post",
		url:"answerUpdate.st",
		data: {
			REV_NO: e.parents(".review").attr("id"),
			ANSWER_CONTENT: e.siblings(".answer_write").val()
		}
	})
	.done(function(data){
		$("#"+data.REV_NO).find(".review_answer_box").empty();
			
		var YesAnswer = 
		 			'<div class="flexBox">'
		+				'<div class="review_answer_info">'
		+					'<span class="material-symbols-outlined arrow_icon">subdirectory_arrow_right</span>'
		+					'<span class="owner">사장님</span>'
		+					'<span class="review_answer_date">'+ data.ANSWER_DATE +'</span>'
		+				'</div>'
		+				'<div>'
		+					'<span class="updateBtn">수정</span>'
		+				'</div>'					
		+			'</div>'
		+			'<div class="review_answer_content">'
		+				'<span>'+ data.ANSWER_CONTENT +'</span>'
		+			'</div>';
		
		$("#"+data.REV_NO).find(".review_answer_box").append(YesAnswer);
		
		$("#"+data.REV_NO).find(".updateBtn").on("click", function(){
			updateBtnClick($(this));
		})
		
	})
} 

// 신고 모달 오픈 클릭
var reviewReportModalOpen = function(e){
	$("#reportModalContainer").removeClass("hidden");
	
	$(window).on("click",function(e){
		if (e.target == $("#reportModalContainer")[0]) {
			$("input[type=radio]").prop("checked", false);
			$(".otherContent").val('');
			$("#reportModalContainer").addClass("hidden");
		}
	})
	
	var REV_NO = e.parents(".review").attr("id")
	
	$("#rev_no").val(REV_NO);
}


// ====================================================
$(()=>{
	$.ajax({
		type: "get",
		url:"getReviewList.st",
		data: {
			select: $(".select").val(),
		},
		dataType:"json"
	})
	.done(function(data){
		reviewTag(data);
	})
	
	// select를 변경했을 때
	$(".select").on("change", function(){
		$.ajax({
			type: "get",
			url:"getReviewList.st",
			data: {
				select: $(".select").val(),
			},
			dataType:"json"
		})
		.done(function(data){
			$(".review_box").empty();
			
			reviewTag(data);
		})
	})
	
	// 신고 모달 창에 신고 버튼 클릭
	$(".reportBtn").on("click", function(){
		
		var formData = $(".reviewReportForm").serialize();
		formData = decodeURIComponent(formData);
		
		$.ajax({
			type: "post",
			url:"insertReviewReport.st",
			data: formData,
		})
		.done(function(data){
			if(data == '1') alert("신고가 완료되었습니다.");
			
			$("input[type=radio]").prop("checked", false);
			$(".otherContent").val('');
			$("#reportModalContainer").addClass("hidden");
			
		})
	})
	
})





