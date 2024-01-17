var storeTag = function(data){
	for(storeInfo of data){
		var searchResultStore = 
			'<div name="'+storeInfo.STORE_NO+'" class="mb-4 store_result_btn" style="margin: 20px 20px; padding:20px 40px; border-bottom: 2px solid #e6e6eb;">'
	        +   '<div class="portfolio-item  store_result">'
	        +          '<img src="upload/'+storeInfo.PHOTO_NAME+'" alt="'+storeInfo.PHOTO_NAME+'" style="width: 385px; height: 250px; overflow-clip-margin:border-box;"/>'
	        +       '<div class="portfolio-caption" style="">'
	        +           '<div class="portfolio-caption-heading">'+storeInfo.STORE_NAME+'</div>'
	        +           '<div class="portfolio-caption-subheading text-muted" style="margin-bottom: 35px;">'+storeInfo.STORE_CATEGORY+' | '+storeInfo.STORE_DETAIL
			+		'</div>'
			+		   '<div class="portfolio-caption-subheading text-muted" style="font-weight: 500;">'+storeInfo.STORE_LOCATION+'</div>' 
	        +           '<div class="portfolio-caption-subheading text-muted" style="display: flex;"><span class="material-icons" style="color: #F7CE3E;">grade</span>'+storeInfo.STORE_SCORE+' ('+storeInfo.STORE_REVIEW_COUNT+'명)</div>'
	        +           '<div class="portfolio-caption-subheading text-muted" style="display: flex;"><span class="material-icons" style="color: #E21818;">favorite</span> '+storeInfo.LIKE_COUNT+' </div>'
	        +       '</div>'
	        +   '</div>'
	        +'</div>'
		
		$("#resultBox").append(searchResultStore);
	}
	
}


$(function(){
	
	$.ajax({
		type: "get",
		url:"getLocation2.lo",
		data: {
			LOC_SCOPE: 1,
			HIGHRANK_LOC:"서울"
		},
		dataType:"json"
	})
	.done(
		function(data){
			for(let loc_name of data){
				$(".District__List").eq(1).append('<li class="District__Item"><button class="District__Item__Button false">'+loc_name.LOC_NAME+'</button></li>')
			}
			
			$(".District__List").slice(0,2).find(".District__Item__Button").on(
				"click",
				function(){
					switchLoc(this)
					getLoc(this)	
				}
				
			)
			
			$(".portfolio-item").on(
				"click",
				function(){
					var STORE_NO = $(this).parent().attr("name");
					location.href = 'store.ma?STORE_NO='+STORE_NO;
				}
			)
		}
	)
	
	// 지역 변경
	var switchLoc = function(btn){
		var now = $(btn).parent().siblings().children(".now");
		now.removeClass("now");
		now.addClass("false");
		now.children("img").remove();
		
		// 화살표 이미지
		var arrowImg = '<img class="District__Item__Button__Img" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAoCAYAAAD6xArmAAAABHNCSVQICAgIfAhkiAAAAXpJREFUSEu917FKA0EQBuDbF7CKIUWKFBb2BiSCkjS+R3oLH8F3yBNJQAvLRBBikSKQiErwCc5/ZBIml7vbnZ09D5ZdyOVjmZ292XV5no+zLHtAW6DdO+fm6M2PA/wD5YSlb/Qj4DOrTPALkL6AthhfA3+14AR3AUzRegL6xPgG+Fss7uiPTeB/cBP4Hk6NH8ACf8aYYr971DE/ghmnhaQFjcZLYQ9+hWx592VLJVyDbzjPa/Fa2IJ7YYHTgnZECGpnHgQzfsYLGoQHw1pcBWtwNezBB0jFJb0TBQv8CeNTsaArTsVlNMz4OfpHtHYBvzTBAqft3xL4JBVcnLUNRoEoC8UHZn4RPWOgtGGKi7ffjVEwoxTXyl2ohkNQdR6HoipYgwbDQHt4Oe1nk9Fi/fNWkZjSRBXbW/diimnQ0ev/yn9FTG0HFj4cmk9BB+mW+sTZ3DE29Ux3H/uyq8IXfhymuCrIyw3dPyhPzTcnmvEdsAnaGu02BUrh+AU3Het2tPvd3gAAAABJRU5ErkJggg==" alt="">';
		$(btn).children("img").remove();
		$(btn).removeClass("false")
		$(btn).addClass("now")
		$(btn).append(arrowImg)
		
	}
		
	var getLoc = function(btn){
		
		var loc_scope;
										
		// 지역 범위 설정
		switch($(btn).parents()[1]) {
		  case $(".District__List")[0]:
			loc_scope = 1;
		    break;
		  case $(".District__List")[1]:
		    loc_scope = 2;
		    break;
	      case $(".District__List")[2]:
		    return;
		}
		
		$.ajax({
			type: "get",
			url: "getLocation2.lo",
			data:{
				LOC_SCOPE: loc_scope,
				HIGHRANK_LOC: $(btn).text()
			},
			dataType:"json",
		})
		.done(
			function(data){
				$(".District__List").slice(loc_scope,3).empty();
				$(".District__List").eq(loc_scope).append('<li class="District__Item"><button class="District__Item__Button now">전체<img class="District__Item__Button__Img" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAoCAYAAAD6xArmAAAABHNCSVQICAgIfAhkiAAAAXpJREFUSEu917FKA0EQBuDbF7CKIUWKFBb2BiSCkjS+R3oLH8F3yBNJQAvLRBBikSKQiErwCc5/ZBIml7vbnZ09D5ZdyOVjmZ292XV5no+zLHtAW6DdO+fm6M2PA/wD5YSlb/Qj4DOrTPALkL6AthhfA3+14AR3AUzRegL6xPgG+Fss7uiPTeB/cBP4Hk6NH8ACf8aYYr971DE/ghmnhaQFjcZLYQ9+hWx592VLJVyDbzjPa/Fa2IJ7YYHTgnZECGpnHgQzfsYLGoQHw1pcBWtwNezBB0jFJb0TBQv8CeNTsaArTsVlNMz4OfpHtHYBvzTBAqft3xL4JBVcnLUNRoEoC8UHZn4RPWOgtGGKi7ffjVEwoxTXyl2ohkNQdR6HoipYgwbDQHt4Oe1nk9Fi/fNWkZjSRBXbW/diimnQ0ev/yn9FTG0HFj4cmk9BB+mW+sTZ3DE29Ux3H/uyq8IXfhymuCrIyw3dPyhPzTcnmvEdsAnaGu02BUrh+AU3Het2tPvd3gAAAABJRU5ErkJggg==" alt=""></button></li>')
				for(let loc_name of data){
					$(".District__List").eq(loc_scope).append('<li class="District__Item"><button class="District__Item__Button false">'+loc_name.LOC_NAME+'</button></li>')
				}
				
				$(".District__List").eq(loc_scope,3).find(".District__Item__Button").on(
					"click",
					function(){
						switchLoc(this)
						getLoc(this)	
					}
					
				)
			}
		)
	}
	
	var modal = $("#modal_layer");
	
	$(".Location__Popup__Close").on(
		"click",
		function(){
			modal.css("display" , "none")
		}
	)
	
	$(".Location__Popup__Cancle").on("click", function(){
		$.ajax({
			type: "get",
			url:"locationSessionDel.ma",
		})
		location.href = "searchResult.ma?searchInput="+$("#searchInput").val();
	})
	
	
	$(window).on(
		"click",
		function(e){
			if (e.target == modal[0]) {
				modal.css("display" , "none")
  			}
		}
	)
	
	// 모달창 띄우기
	$("#locationBtn").on(
		"click",
		function(){
			$("#modal_layer").css(
				"display", ""
			)
		}
	)
	
	$("#searchBtn").on(
		"click",
		function(){
			var form = $("#searchForm");
			
			form.submit();
		}
	)
	
	$("#searchForm").submit(()=>{
		
		if($("#searchInput").val() == ""){
			alert("검색어를 입력해주세요!")
			return false;
		}
		
		return true;
	})
	
	$(".Location__Popup__Submit").on("click", function(){
		
		var loc_name_list = [];
		
		$(".now").text(function(i, text){
			if(i != 0 && text != '전체') loc_name_list.push(text);
		});
		
		var loc_name = loc_name_list.join(" ") == "" ? $(".now").eq(0).text() :  loc_name_list.join(" ");
		$.ajax({
			type: "get",
			url: "getMainInfo.ma",
			data:{
				LOC_NAME: loc_name,
				searchInput: $("#searchInput").val()
			},
			dataType:"json",
		})
		.done(function(data){
			$("#resultBox").empty();
			storeTag(data);
			modal.css("display" , "none");
		})
		
	})
	
	
})
// ${storeInfo.STORE_TEL}
//STORE_NO
//, STORE_NAME
//, STORE_TEL
//, STORE_LOCATION
//, STORE_CATEGORY
//, STORE_INFO
//, STORE_PLUS
//, STORE_TIME
//, STORE_BT
//, STORE_LO
//, SOTRE_CLOSE
//, STORE_SCORE
//, LIKE_COUNT

// 요일 별 시간 설정? 몇시부터 몇시까지? 휴무 일은?

//${menu.MENU_PRICE}
// MENU_NO
//, STORE_NO
//, MENU_NAME
//, MENU_PRICE
//, MENU_HIDE
//, MENU_INFO

//${table.SEAT_OC}
//SEAT_NO
//, STORE_NO
//, SEAT_NAME
//, SEAT_USETIME
//, SEAT_MIN
//, SEAT_MAX
//, SEAT_CONTENT
//, SEAT_OC