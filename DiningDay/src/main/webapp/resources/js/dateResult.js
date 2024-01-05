/**
 * 
 */
var now = new Date();

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


