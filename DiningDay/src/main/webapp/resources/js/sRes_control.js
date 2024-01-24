/**
 * 
 */
			    
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/variableCode.js">' +
			   '</script>');

			   
$(() => {
	
	targetColor($("#sRes_control"));
	
	$.ajax({
		type: "get",
		data: _data,
		url: "sRes_controlPro.st",
		async: false
	})
	.done(function(data){
		
		myChart.data.datasets[0].data = [data.RES_DATE_1, data.RES_DATE_2, data.RES_DATE_3,
									  	 data.RES_DATE_4, data.RES_DATE_5, data.RES_DATE_6,
									  	 data.RES_DATE_7, data.RES_DATE_8, data.RES_DATE_9,
									  	 data.RES_DATE_10, data.RES_DATE_11, data.RES_DATE_12];
		myChart.data.datasets[1].data = [data.RES_DATE_1, data.RES_DATE_2, data.RES_DATE_3,
									  	 data.RES_DATE_4, data.RES_DATE_5, data.RES_DATE_6,
									  	 data.RES_DATE_7, data.RES_DATE_8, data.RES_DATE_9,
									  	 data.RES_DATE_10, data.RES_DATE_11, data.RES_DATE_12];
		debugger;
		myChart.update();
		var oldYear = (data.OWN_DATE).substring(0, 4);
		var yearLength = parseInt(data.MAX_YEAR) - parseInt(oldYear) + 1;
		
		for(var i = 0; i < yearLength; i++){
			$("#checkYear").append(selectYearData(parseInt(data.MAX_YEAR) - i)); 
		}
		$("#nowYear").text('현재년도 : ' + dateTotal.year + "년");
		customSelect2($("#checkYear"));

		$.ajax({
			data: { RES_DATE: $("#checkYear").select2().val() + "01%"},
			type: "get",
			url: "sResMonthData.st",
			async: false
		})	
		.done(function(data){
			var daysDataTotal = 0;
			for(let days of data){
				$("#tbody_1").append('<tr>' +
									   	  '<td><a href="#">' + days.RES_DATE + '일</a></td>' +
										  '<td>' + days.RES_DAY + '</td>' +
										  '<td>' + days.RES_COUNT + '</td>' +
								     '</tr>');
				daysDataTotal += parseInt(days.RES_COUNT);
				
				switch(days.RES_DAY){
					case "월요일": weekDataList.one = days.RES_COUNT; break;
					case "화요일": weekDataList.two = days.RES_COUNT; break;
					case "수요일": weekDataList.three = days.RES_COUNT; break;
					case "목요일": weekDataList.four = days.RES_COUNT; break;
					case "금요일": weekDataList.five = days.RES_COUNT; break;
					case "토요일": weekDataList.six = days.RES_COUNT; break;
					case "일요일": weekDataList.seven = days.RES_COUNT; break;
				}
			}
			pieChart.data.datasets[0].data = [weekDataList.one, weekDataList.two, weekDataList.three,
										 	  weekDataList.four, weekDataList.five, weekDataList.six,
										 	  weekDataList.seven];
			pieChart.update();
			 
			weekDataList.one = 0;
			weekDataList.two = 0;
			weekDataList.three = 0;
			weekDataList.four = 0;
			weekDataList.five = 0;
			weekDataList.six = 0;
			weekDataList.seven = 0;

			$("#month_1").text("1월 일별 예약 정보");
			$("#dayTotal").text("총 예약 회수 : " + daysDataTotal + " 회");
			paging("#tbody_1", 6, 0);
			
			$.ajax({
				data: {RES_DATE: $("#checkYear").select2().val() + "01%"},
				url: "sResWeekData.st",
				type: "get",
				async: false
			})
			.done(function(data){
				for(let resWeek of data){
					$("#" + resWeek.RES_DAY).text(resWeek.RES_COUNT + " 회");	
				}
			})
			.fail()
		})
		.fail()					  		
	})
	.fail()
	
	$("select").on("change", function(){
		selectYear = $("#checkYear").val();

		_data.RES_DATE_1 = selectYear + "01%";
		_data.RES_DATE_2 = selectYear + "02%";
		_data.RES_DATE_3 = selectYear + "03%";
		_data.RES_DATE_4 = selectYear + "04%";
		_data.RES_DATE_5 = selectYear + "05%";
		_data.RES_DATE_6 = selectYear + "06%";
		_data.RES_DATE_7 = selectYear + "07%";
		_data.RES_DATE_8 = selectYear + "08%";
		_data.RES_DATE_9 = selectYear + "09%";
		_data.RES_DATE_10 = selectYear + "10%";
		_data.RES_DATE_11 = selectYear + "11%";
		_data.RES_DATE_12 = selectYear + "12%";
		
		$.ajax({
			data: _data,
			url: "sRes_controlPro.st",
			type: "get",
			async: false
		})
		.done(function(data){
			myChart.data.datasets[0].data = [];
			myChart.data.datasets[0].data = [data.RES_DATE_1, data.RES_DATE_2, data.RES_DATE_3,
										  	 data.RES_DATE_4, data.RES_DATE_5, data.RES_DATE_6,
										  	 data.RES_DATE_7, data.RES_DATE_8, data.RES_DATE_9,
										  	 data.RES_DATE_10, data.RES_DATE_11, data.RES_DATE_12];
			myChart.data.datasets[1].data = [];							  
			myChart.data.datasets[1].data = [data.RES_DATE_1, data.RES_DATE_2, data.RES_DATE_3,
										  	 data.RES_DATE_4, data.RES_DATE_5, data.RES_DATE_6,
										  	 data.RES_DATE_7, data.RES_DATE_8, data.RES_DATE_9,
										  	 data.RES_DATE_10, data.RES_DATE_11, data.RES_DATE_12];
			
			myChart.update();
			$("#nowYear").text('현재년도 : ' + dateTotal.year + "년");
			
			$.ajax({
				data: { RES_DATE: $("#checkYear").select2().val() + "01%"},
				type: "get",
				url: "sResMonthData.st",
				async: false
			})	
			.done(function(data){
				var daysDataTotal = 0;
				$("#tbody_1").empty();
				
				for(let days of data){
					$("#tbody_1").append('<tr>' +
										   	  '<td><a href="#">' + days.RES_DATE + '일</a></td>' +
											  '<td>' + days.RES_DAY + '</td>' +
											  '<td>' + days.RES_COUNT + '</td>' +
									     '</tr>');
					daysDataTotal += parseInt(days.RES_COUNT);
					
					switch(days.RES_DAY){
						case "월요일": weekDataList.one = days.RES_COUNT; break;
						case "화요일": weekDataList.two = days.RES_COUNT; break;
						case "수요일": weekDataList.three = days.RES_COUNT; break;
						case "목요일": weekDataList.four = days.RES_COUNT; break;
						case "금요일": weekDataList.five = days.RES_COUNT; break;
						case "토요일": weekDataList.six = days.RES_COUNT; break;
						case "일요일": weekDataList.seven = days.RES_COUNT; break;
					}
				}
				pieChart.data.datasets[0].data = [];
				pieChart.data.datasets[0].data = [weekDataList.one, weekDataList.two, weekDataList.three,
											 	  weekDataList.four, weekDataList.five, weekDataList.six,
											 	  weekDataList.seven];
											 	  
				pieChart.update();
				weekDataList.one = 0;
				weekDataList.two = 0;
				weekDataList.three = 0;
				weekDataList.four = 0;
				weekDataList.five = 0;
				weekDataList.six = 0;
				weekDataList.seven = 0;
				$("#month_1").text("1월 일별 예약 정보");
				$("#dayTotal").text("총 예약 회수 : " + daysDataTotal + " 회");
				paging("#tbody_1", 7, 0);
				
				$.ajax({
					data: {RES_DATE: $("#checkYear").select2().val() + "01%"},
					url: "sResWeekData.st",
					type: "get",
					async: false
				})
				.done(function(data){
					for(var i = 1; i <= 7; i++){
						$("#" + i).text("0 회");
					}
					
					for(let resWeek of data){
						$("#" + resWeek.RES_DAY).text(resWeek.RES_COUNT + " 회");	
					}
				})
				.fail()
			})
			.fail()	
			
		})
		.fail()
	})
	
	$("#myChart").on("click", () => {
		debugger;
		if(myChart._active.length <= 0){
			return;
		}
		var month = myChart.data.labels[myChart._active[0].index];
		var resDate = month.replace(month, $("#checkYear").select2().val() + "0" + month.split("월")[0] + "%");
		
		if(parseInt(month.split("월")[0]) > 9){
			resDate = month.replace(month, $("#checkYear").select2().val() + month.split("월")[0] + "%");
		}
		
		$.ajax({
			data: { RES_DATE: resDate},
			type: "get",
			url: "sResMonthData.st",
			async: false
		})	
		.done(function(data){
			var daysDataTotal = 0;
			$("#tbody_1").empty();
			
			for(let days of data){
				$("#tbody_1").append('<tr>' +
									   	  '<td><a href="#">' + days.RES_DATE + '일</a></td>' +
										  '<td>' + days.RES_DAY + '</td>' +
										  '<td>' + days.RES_COUNT + '</td>' +
								     '</tr>');
				daysDataTotal += parseInt(days.RES_COUNT);
				
				switch(days.RES_DAY){
					case "월요일": weekDataList.one = days.RES_COUNT; break;
					case "화요일": weekDataList.two = days.RES_COUNT; break;
					case "수요일": weekDataList.three = days.RES_COUNT; break;
					case "목요일": weekDataList.four = days.RES_COUNT; break;
					case "금요일": weekDataList.five = days.RES_COUNT; break;
					case "토요일": weekDataList.six = days.RES_COUNT; break;
					case "일요일": weekDataList.seven = days.RES_COUNT; break;
				}
			}
			pieChart.data.datasets[0].data = [];
			pieChart.data.datasets[0].data = [weekDataList.one, weekDataList.two, weekDataList.three,
										 	  weekDataList.four, weekDataList.five, weekDataList.six,
										 	  weekDataList.seven];
										 	  
			pieChart.update();
			weekDataList.one = 0;
			weekDataList.two = 0;
			weekDataList.three = 0;
			weekDataList.four = 0;
			weekDataList.five = 0;
			weekDataList.six = 0;
			weekDataList.seven = 0;
			
			$("#month_1").text(month + " 일별 예약 정보");
			$("#dayTotal").text("총 예약 회수 : " + daysDataTotal + " 회");
			paging("#tbody_1", 7, 0);
			
			$.ajax({
				data: {RES_DATE: resDate},
				url: "sResWeekData.st",
				type: "get",
				async: false
			})
			.done(function(data){
				for(var i = 1; i <= 7; i++){
					$("#" + i).text("0 회");
				}
				
				for(let resWeek of data){
					$("#" + resWeek.RES_DAY).text(resWeek.RES_COUNT + " 회");	
				}
			})
			.fail()
		})
		.fail()	
	})
	
	$("#tbody_1 a").on("click", function(){
		var monthIndex = $("#month_1").text().charAt(0);	
		if(parseInt(monthIndex) < 10){
			monthIndex = "0" + monthIndex;			
		}
		
		var resDate = $("#checkYear").select2().val() + monthIndex + $(this).text().split("일")[0];
		
		$.ajax({
			data: {dateCheck: resDate},
			url: "resDateCheck.st",
			type: "get"
		})
		.done(function(data){
			location.href ='sRes.st?resCheck=' + data;
			return;
		})
		.fail()
	})
	
})


const monthData = {
	labels: [
		'1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',
	], datasets: [{
		type: 'bar',
    	label: '월별 예약회수 bar',
    	data: [],
    	borderColor: 'rgb(255, 99, 132)',
    	backgroundColor: 'rgba(255, 99, 132, 0.2)'
	}, {
    	type: 'line',
    	label: '월별 예약회수 line',
    	data: [],
    	fill: false,
    	borderColor: 'rgb(54, 162, 235)'
	}]
};

const weekData = {
	labels: [
		'월요일',
		'화요일',
		'수요일',
		'목요일',
		'금요일',
		'토요일',
		'일요일'
], datasets: [{
	label: '예약횟수',
    data: [],
    backgroundColor: [
		'rgba(255, 99, 132)',
      	'rgba(255, 159, 64)',
      	'rgba(255, 205, 86)',
      	'rgba(75, 192, 192)',
      	'rgba(54, 162, 235)',
      	'rgba(153, 102, 255)',
      	'rgba(201, 203, 207)'
    ],
		hoverOffset: 4
	}]
};
	
const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
	type: 'scatter',
  	data: monthData,
  	options: {
	    scales: {
	    	y: {
	    		suggestedMax: 100,
	        	beginAtZero: true
	      	}
	    }
  	}
});	

	
const ctpie = document.getElementById('pieChart').getContext('2d');
const pieChart = new Chart(ctpie, {
  	type: 'doughnut',
	data: weekData,
	options: {
		responsive: false,
		legend: {
			font: {
				size: 15
			},
	    	display: false
		},
	}
});


/** 전역 변수 모음 시작 */
let now = new Date();
const dateTotal = {
	year : now.getFullYear(),	
	month : now.getMonth() + 1 + "월",
	day : now.getDate() + "일",
	getdayweek : () => {
		var index = now.getDay();
		switch(index){
			case 1: weekend = "월요일"; break;
			case 2: weekend = "화요일"; break;
			case 3: weekend = "수요일"; break;
			case 4: weekend = "목요일"; break;
			case 5: weekend = "금요일"; break;
			case 6: weekend = "토요일"; break;
			case 0: weekend = "일요일"; break;
		}
		
		return weekend;
	}
}

let weekDataList = {
	one: 0,
	two: 0,
	three: 0,
	four: 0,
	five: 0,
	six: 0,
	seven: 0
};
let selectYear = dateTotal.year;
let _data = {
	RES_DATE_1 : selectYear + "01%",
	RES_DATE_2 : selectYear + "02%",
	RES_DATE_3 : selectYear + "03%",
	RES_DATE_4 : selectYear + "04%",
	RES_DATE_5 : selectYear + "05%",
	RES_DATE_6 : selectYear + "06%",
	RES_DATE_7 : selectYear + "07%",
	RES_DATE_8 : selectYear + "08%",
	RES_DATE_9 : selectYear + "09%",
	RES_DATE_10 : selectYear + "10%",
	RES_DATE_11 : selectYear + "11%",
	RES_DATE_12 : selectYear + "12%",
}


/** 전역 변수 모음 끝 */

function selectYearData(nowYearData){
	return "<option value" + nowYearData + ">" + nowYearData + "</option>";
}

/** select2() cutomize */
var customSelect2 = function(tag){
	tag.select2({
		placeholder: '좌석 이용 가능여부 :)',
  		"language": {
    		"noResults": function (params) {
      			return "<b style='color:rgb(220, 20, 60, 0.5);'>찾을 수 없어요 :(</b>";
    		}
  		},
  		escapeMarkup: function (markup) {
        	return markup;
    	}
	});
} 


