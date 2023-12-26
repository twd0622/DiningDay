/**
 * 
 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/Store/resour/js/dateResult.js">' +
			    '</script>');

const monthData = {
	labels: [
		'1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',
	], datasets: [{
		type: 'bar',
    	label: '월별 예약회수 bar',
    	data: [10, 20, 30, 40, 10, 20, 30, 40, 10, 20, 30, 40],
    	borderColor: 'rgb(255, 99, 132)',
    	backgroundColor: 'rgba(255, 99, 132, 0.2)'
	}, {
    	type: 'line',
    	label: '월별 예약회수 line',
    	data: [10, 20, 30, 40, 10, 20, 30, 40, 10, 20, 30, 40],
    	fill: false,
    	borderColor: 'rgb(54, 162, 235)'
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
    data: [20, 50, 10, 70, 150, 80, 0],
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

function datePrint(dateData){
	$("#month_1").html(dateData + " 일별 예약 횟수");
	$("#month_2").html(dateData + " 요일별 예약 횟수");
	$("#month_3").html(dateData + " 요일별 예약 횟수");
	$("#month_4").html(dateData);
}

$(() => {
	
	$("#nowYear").html((index, oldHTML) => {
		return oldHTML + " : " + dateTotal.year + " 년";	
	})
	
	$("select").on("change", () => {
		var selectYear = $("select option:selected").val()
		if(selectYear === "현재 년도"){
	    	selectYear = dateTotal.year
		}
		
		$("#nowYear").empty();
		$("#nowYear").html("현재 년도 : " + selectYear + " 년")
	})
	
	datePrint(dateTotal.month);	//	n월 요일별 예약 횟수 출력
	
	for(var i = 0; i < weekData.labels.length; i++){
		$("#week").append(	"<tr>\r\n" +
						  		"<td><button class='btn btn-outline-success' id='sResBtn_" + i + "'>" + 
						  			weekData.labels[i] + "</button></td>\r\n" + 
								"<td>" + weekData.datasets[0].data[i] + "</td>\r\n" + 
						  	"</tr>")		
	}
	
	$("#dayTotal").text("총 예약 수 : " + myChart.data.datasets[0].data[11]);

	$("#myChart").on("click", () => {
		if(myChart._active.length <= 0){
			return;
		}
		
        var label = myChart.data.labels[myChart._active[0].index];
        datePrint(label);	//	n월 요일별 예약 횟수 출력
		
        var value = myChart.data.datasets[0].data[myChart._active[0].index];
        
        $("#dayTotal").empty();
        $("#dayTotal").text("총 예약 수 : " + value);
	})	
	
	//	모달창 이외의 공간 클릭시 모달창 close
	window.onclick = e => {	
		if (e.target == document.getElementById("sResModal")) {
    		$("#sResModal").css("display", "none");
  		}
	}
	
	//	요일 버튼 클릭시 모달창 open
	$(".btn").on("click", e => {
		var btnNum = $(e.target).attr("id").split("_")[1];

		$("#totalCheckin").html("총 예약횟수 : " + $($(e.target).parent()).next().html());
		$("#selectDay").html(weekData.labels[btnNum]);	
		$("#sResModal").css("display", "block");	
	})
	
	//	X 아이콘 클릭시 모달창 close
	$(".close").on("click", () => {	
		$("#sResModal").css("display", "none");
	})
	
})


