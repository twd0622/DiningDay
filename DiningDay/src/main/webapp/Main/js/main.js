var getRecommandStoreInfo = function(data){
	var div = '<div class="recomannedStore owl-carousel"></div>';
	$(".recomannedStoreBox").append(div);
	
	for(storeInfo of data){
		var recomannedStore = 
		 '<div class="item">'
        +    '<div class="portfolio-item">'
        +        '<a class="portfolio-link" href="store.ma?STORE_NO='+storeInfo.STORE_NO+'">'
        +            '<div class="portfolio-hover">'
        +                '<div class="portfolio-hover-content">'
        +                	'<div class="storeInfo">'
        +                		'<div class="storeInfo storeInfo_top">'
        +                    		'<span style="font-size: 20px; font-weight: bold">'+storeInfo.STORE_NAME+'</span>'
        +                    		'<span style="font-size: 13px;">'+storeInfo.STORE_CATEGORY+' | '+storeInfo.STORE_DETAIL+'</span>'
        +                    		'<span style="font-size: 14px; font-weight: bold">'+storeInfo.STORE_LOCATION+'</span>'
        +                		'</div>'
        +                		'<div class="storeInfo storeInfo_bottom">'	
        +                    		'<span><span class="material-icons icon" style="color: #F7CE3E;">grade</span> '+storeInfo.STORE_SCORE+' ('+storeInfo.STORE_REVIEW_COUNT+'명)</span>'
        +                    		'<span><span class="material-icons icon" style="color: #E21818;">favorite</span> '+storeInfo.LIKE_COUNT+'</span>'
        +                		'</div>'
        +                	'</div>'
        +                '</div>'
        +            '</div>'
        +            '<img class="img-fluid" src="upload/'+storeInfo.PHOTO_NAME+'" alt="'+storeInfo.PHOTO_NAME+'" />'
        +        '</a>'
        +        '<div class="portfolio-caption">'
        +            '<div class="portfolio-caption-heading">'+storeInfo.STORE_NAME+'</div>'
        +        '</div>'
        +    '</div>'
        +'</div>'
		
		$(".recomannedStore").append(recomannedStore);
	}
	
	$(".recomannedStore").owlCarousel({
	    loop:true,
	    margin:230,
	    nav:true,
	    responsive:{
	        0:{
	            items:1
	        },
	        600:{
	            items:3
	        },
	        1000:{
	            items:5
	        }
	    }
	});	
	
	var preBtn = '<button class="recomannedStore_leftBtn scrollBtn" ><span class="material-symbols-outlined">arrow_back_ios</span></button>';
	var nextBtn = '<button class="recomannedStore_rightBtn scrollBtn"><span class="material-symbols-outlined">arrow_forward_ios</span></button>';
	$(".box1").prepend(preBtn);
	$(".box1").append(nextBtn);
	
	$('.recomannedStore_rightBtn').click(function() {
		$(".recomannedStore").trigger('next.owl.carousel');
	})
	// Go to the previous item
	$('.recomannedStore_leftBtn').click(function() {
	    // With optional speed parameter
	    // Parameters has to be in square bracket '[]'
	    $(".recomannedStore").trigger('prev.owl.carousel', [300]);
	})
};

var getReviewHighStoreList = function(data){
	var div = '<div class="reviewHighStore owl-carousel"></div>';
	$(".reviewHighStoreBox").append(div);
	
	for(storeInfo of data){
		var reviewHighStore = 
		 '<div class="item">'
        +    '<div class="portfolio-item">'
        +        '<a class="portfolio-link" href="store.ma?STORE_NO='+storeInfo.STORE_NO+'">'
        +            '<div class="portfolio-hover">'
        +                '<div class="portfolio-hover-content">'
        +                	'<div class="storeInfo">'
        +                		'<div class="storeInfo storeInfo_top">'
        +                    		'<span style="font-size: 20px; font-weight: bold">'+storeInfo.STORE_NAME+'</span>'
        +                    		'<span style="font-size: 13px;">'+storeInfo.STORE_CATEGORY+' | '+storeInfo.STORE_DETAIL+'</span>'
        +                    		'<span style="font-size: 14px; font-weight: bold">'+storeInfo.STORE_LOCATION+'</span>'
        +                		'</div>'
        +                		'<div class="storeInfo storeInfo_bottom">'	
        +                    		'<span><span class="material-icons icon" style="color: #F7CE3E;">grade</span> '+storeInfo.STORE_SCORE+' ('+storeInfo.STORE_REVIEW_COUNT+'명)</span>'
        +                    		'<span><span class="material-icons icon" style="color: #E21818;">favorite</span> '+storeInfo.LIKE_COUNT+'</span>'
        +                		'</div>'
        +                	'</div>'
        +                '</div>'
        +            '</div>'
        +            '<img class="img-fluid" src="upload/'+storeInfo.PHOTO_NAME+'" alt="'+storeInfo.PHOTO_NAME+'" />'
        +        '</a>'
        +        '<div class="portfolio-caption">'
        +            '<div class="portfolio-caption-heading">'+storeInfo.STORE_NAME+'</div>'
        +        '</div>'
        +    '</div>'
        +'</div>'
		
		$(".reviewHighStore").append(reviewHighStore);
	}
	
	$(".reviewHighStore").owlCarousel({
	    loop:true,
	    margin:230,
	    nav:true,
	    responsive:{
	        0:{
	            items:1
	        },
	        600:{
	            items:3
	        },
	        1000:{
	            items:5
	        }
	    }
	});	
	
	var preBtn = '<button class="reviewHighStore_leftBtn scrollBtn" ><span class="material-symbols-outlined">arrow_back_ios</span></button>';
	var nextBtn = '<button class="reviewHighStore_rightBtn scrollBtn"><span class="material-symbols-outlined">arrow_forward_ios</span></button>';
	$(".box2").prepend(preBtn);
	$(".box2").append(nextBtn);
	
	$('.reviewHighStore_rightBtn').click(function() {
		$(".reviewHighStore").trigger('next.owl.carousel');
	})
	// Go to the previous item
	$('.reviewHighStore_leftBtn').click(function() {
	    // With optional speed parameter
	    // Parameters has to be in square bracket '[]'
	    $(".reviewHighStore").trigger('prev.owl.carousel', [300]);
	})
};

var getLikeHighStoreList = function(data){
	var div = '<div class="likeHighStore owl-carousel"></div>';
	$(".likeHighStoreBox").append(div);
	
	for(storeInfo of data){
		var likeHighStore = 
		 '<div class="item">'
        +    '<div class="portfolio-item">'
        +        '<a class="portfolio-link" href="store.ma?STORE_NO='+storeInfo.STORE_NO+'">'
        +            '<div class="portfolio-hover">'
        +                '<div class="portfolio-hover-content">'
        +                	'<div class="storeInfo">'
        +                		'<div class="storeInfo storeInfo_top">'
        +                    		'<span style="font-size: 20px; font-weight: bold">'+storeInfo.STORE_NAME+'</span>'
        +                    		'<span style="font-size: 13px;">'+storeInfo.STORE_CATEGORY+' | '+storeInfo.STORE_DETAIL+'</span>'
        +                    		'<span style="font-size: 14px; font-weight: bold">'+storeInfo.STORE_LOCATION+'</span>'
        +                		'</div>'
        +                		'<div class="storeInfo storeInfo_bottom">'	
        +                    		'<span><span class="material-icons icon" style="color: #F7CE3E;">grade</span> '+storeInfo.STORE_SCORE+' ('+storeInfo.STORE_REVIEW_COUNT+'명)</span>'
        +                    		'<span><span class="material-icons icon" style="color: #E21818;">favorite</span> '+storeInfo.LIKE_COUNT+'</span>'
        +                		'</div>'
        +                	'</div>'
        +                '</div>'
        +            '</div>'
        +            '<img class="img-fluid" src="upload/'+storeInfo.PHOTO_NAME+'" alt="'+storeInfo.PHOTO_NAME+'" />'
        +        '</a>'
        +        '<div class="portfolio-caption">'
        +            '<div class="portfolio-caption-heading">'+storeInfo.STORE_NAME+'</div>'
        +        '</div>'
        +    '</div>'
        +'</div>'
		
		$(".likeHighStore").append(likeHighStore);
	}
	
	$(".likeHighStore").owlCarousel({
	    loop:true,
	    margin:230,
	    nav:true,
	    responsive:{
	        0:{
	            items:1
	        },
	        600:{
	            items:3
	        },
	        1000:{
	            items:5
	        }
	    }
	});	
	
	var preBtn = '<button class="likeHighStore_leftBtn scrollBtn" ><span class="material-symbols-outlined">arrow_back_ios</span></button>';
	var nextBtn = '<button class="likeHighStore_rightBtn scrollBtn"><span class="material-symbols-outlined">arrow_forward_ios</span></button>';
	$(".box3").prepend(preBtn);
	$(".box3").append(nextBtn);
	
	$('.likeHighStore_rightBtn').click(function() {
		$(".likeHighStore").trigger('next.owl.carousel');
	})
	// Go to the previous item
	$('.likeHighStore_leftBtn').click(function() {
	    // With optional speed parameter
	    // Parameters has to be in square bracket '[]'
	    $(".likeHighStore").trigger('prev.owl.carousel', [300]);
	})
};
var bestReview = function(data){
	for(Review of data){
		var bestReviewTag = 
		  '<div class="col-lg-4 col-sm-6 mb-4 reviewBox">'
		+     '<div class="rankBox"><span class="rank">'+ Review.RANK +'</span></div>'
		+     '<div>'
	    +     	'<svg class="bd-placeholder-img rounded-circle" width="120" height="120"  role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false" style="border: 1px solid black; background-image: url(\'upload/'+Review.CUS_IMAGE+'\'); background-size: cover;"></svg>'
	    +     	'<h6 class="fw-normal cus_nickname">' + Review.CUS_NICK + '</h6>'
	    +     	'<p class="showDetailBtnBox"><a class="showDetailBtn" href="store_review.re?STORE_NO='+ Review.STORE_NO +'#'+ Review.REV_NO +'">상세보기 »</a></p>'
	    +     	'<p class="review_content">' + Review.REV_CONTENT + '</p>'
	    +     '</div>'
      	+ '</div>'
      	
      	$("#bestReviewBox").append(bestReviewTag);
	}
}

$(()=>{
	
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
			
			$(".District__List").slice(0,2).find(".District__Item__Button").on("click",function(){
				switchLoc(this)
				getLoc(this)	
			})
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
				
				$(".District__List").eq(loc_scope,3).find(".District__Item__Button").on("click",function(){
					switchLoc(this)
					getLoc(this)	
				})
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
		location.href = "main.ma";
	})
	
	
	$(window).on("click",function(e){
		if (e.target == modal[0]) {
			modal.css("display" , "none")
		}
	})
	
	// 모달창 띄우기
	$("#locationBtn").on("click",function(){
		$("#modal_layer").css("display", "")
	})
	
	$("#searchBtn").on("click",function(){
		var form = $("#searchForm");
		
		form.submit();
	})
	
	$("#searchForm").submit(()=>{
		
		if($("#searchInput").val() == ""){
			alert("검색어를 입력해주세요!")
			return false;
		}
		
		return true;
	})
	
	// 추천 식당
	$.ajax({
		type: "get",
		url:"getMainInfo.ma",
		dataType:"json"
	})
	.done(function(data){
		getRecommandStoreInfo(data.json1);
		getReviewHighStoreList(data.json2);
		getLikeHighStoreList(data.json3);
		bestReview(data.json4);
	})
	
	
	$(".Location__Popup__Submit").on("click", function(){
		
		var loc_name_list = [];
		
		$(".now").text(function(i, text){
			if(i != 0 && text != '전체') loc_name_list.push(text);
		});
		
		var loc_name = loc_name_list.join(" ") == "" ? $(".now").eq(0).text() :  loc_name_list.join(" ")
		$.ajax({
			type: "get",
			url: "getMainInfo.ma",
			data:{
				LOC_NAME: loc_name
			},
			dataType:"json",
		})
		.done(function(data){
			$(".recomannedStoreBox").empty();
			$(".recomannedStore_leftBtn").remove();
			$(".recomannedStore_rightBtn").remove();
			getRecommandStoreInfo(data.json1);
			
			$(".reviewHighStoreBox").empty();
			$(".reviewHighStore_leftBtn").remove();
			$(".reviewHighStore_rightBtn").remove();
			getReviewHighStoreList(data.json2);
			
			$(".likeHighStoreBox").empty();
			$(".likeHighStore_leftBtn").remove();
			$(".likeHighStore_rightBtn").remove();
			getLikeHighStoreList(data.json3);
			
			
			$("#bestReviewBox").empty();
			bestReview(data.json4);
			
			
			$("#locationName").text(loc_name)
			modal.css("display" , "none");
		})
		
	})
})