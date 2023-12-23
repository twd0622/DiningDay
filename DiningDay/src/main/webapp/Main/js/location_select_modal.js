
$(function(){
	
	$.ajax({
		type: "get",
		url:"getLocation2.lo",
		data: {
			LOC_SCOPE: 2,
			HIGHRANK_LOC:"서울"
		},
		dataType:"json",
		success:function(data){
			for(let loc_name of data){
				$(".District__List").eq(1).append('<li class="District__Item"><button class="District__Item__Button false">'+loc_name.LOC_NAME+'</button></li>')
			
				$(".District__Item__Button").on(
					"click",
					function(){
						var now = $(this).parent().siblings().children(".now");
						now.removeClass("now");
						now.addClass("false");
						now.children("img").remove();
						
						// 화살표 이미지
						var arrowImg = '<img class="District__Item__Button__Img" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAoCAYAAAD6xArmAAAABHNCSVQICAgIfAhkiAAAAXpJREFUSEu917FKA0EQBuDbF7CKIUWKFBb2BiSCkjS+R3oLH8F3yBNJQAvLRBBikSKQiErwCc5/ZBIml7vbnZ09D5ZdyOVjmZ292XV5no+zLHtAW6DdO+fm6M2PA/wD5YSlb/Qj4DOrTPALkL6AthhfA3+14AR3AUzRegL6xPgG+Fss7uiPTeB/cBP4Hk6NH8ACf8aYYr971DE/ghmnhaQFjcZLYQ9+hWx592VLJVyDbzjPa/Fa2IJ7YYHTgnZECGpnHgQzfsYLGoQHw1pcBWtwNezBB0jFJb0TBQv8CeNTsaArTsVlNMz4OfpHtHYBvzTBAqft3xL4JBVcnLUNRoEoC8UHZn4RPWOgtGGKi7ffjVEwoxTXyl2ohkNQdR6HoipYgwbDQHt4Oe1nk9Fi/fNWkZjSRBXbW/diimnQ0ev/yn9FTG0HFj4cmk9BB+mW+sTZ3DE29Ux3H/uyq8IXfhymuCrIyw3dPyhPzTcnmvEdsAnaGu02BUrh+AU3Het2tPvd3gAAAABJRU5ErkJggg==" alt="">';
						$(this).children("img").remove();
						$(this).removeClass("false")
						$(this).addClass("now")
						$(this).append(arrowImg)
					}			
				)							
			}
			
			
		},
		error:function(){}
	});
	
	
		
	
	
	
	
	var modal = $("#modal_layer");
	
	$(window).on(
		"click",
		function(e){
			if (e.target == modal[0]) {
				modal.css("display" , "none")
  			}
		}
	)
	
	
	
})