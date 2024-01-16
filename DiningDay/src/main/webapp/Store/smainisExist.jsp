<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀 vd</title>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
	
		<main style="display: flex;  align-items: center; text-align: center; padding:20px;">
			<div class="mainContainer" style="width: 100%; background:white; ">
			<c:set var="STORE" value="${ requestScope.STORE_LIST}" />
			
				<form id="STORE_DATA" method="post" enctype="multipart/form-data" >
					<input type="text" name="STORE_NAME">
					<input type="text" name="STORE_TEL">
					<input type="text" name="STORE_LOCATION">
					<input type="text" name="STORE_DETAIL">
					<input type="text" name="STORE_INFO">
					<input type="text" name="STORE_PLUS">
					<input type="text" name="STORE_CATEGORY">
					<input type="text" name="STORE_LO">
					<input type="text" name="STORE_RT">
					<input type="text" name="STORE_CLOSE">
					<input type="text" name="STORE_ST">
					<input type="text" name="STORE_ET">
					<input type="text" name="STORE_BTS">
					<input type="text" name="STORE_BTE">
					<input type="text" name="STORE_RST">
					<input type="text" name="STORE_RET">
					<input type="file" id="inputfile_1" name="SU1_PHOTO_NAME">
					<input type="file" id="inputfile_2" name="BA1_PHOTO_NAME">
					<input type="file" id="inputfile_3" name="BA2_PHOTO_NAME">
				</form>
				<div>
					<div>가게 정보관리</div>
					<div>
						<div>식당 이름 : ${STORE.STORE_NAME}</div>
						<div>평점 : ${STORE.REV_SCORE}</div>
					</div>
					<div>
						<div>식당 전화번호 : ${STORE.STORE_TEL}</div>
					</div>
					<div>
						<div>식당 위치 : ${STORE.STORE_LOCATION}</div>
					</div>
					<div>
						<div>식당 카테고리 : ${STORE.STORE_CATAGORY}</div>
					</div>
					<div>
						<div>식당 세부정보 : ${STORE.STORE_DETAIL}</div>
					</div>
					<div>
						<div>식당 설명 : ${STORE.STORE_INFO}</div>
					</div>
					<div>
						<div>식당 편의시설</div>
						<div>
							<textarea style="resize: none;" rows="5" cols="10">${STORE.STORE_PLUS}</textarea> 
						</div>
					</div>
					<div>
						<div>영업시간</div>
						<div>${STORE.STORE_ST}</div>
						<div>${STORE.STORE_ET}</div>
					</div>	
					<div>
						<div>휴무일</div>
						<div>${STORE.STORE_CLOSE}요일</div>
					</div>
					<div>
						<img src="upload/${STORE.BA1}" width="200px" height="200px" alt=""/>
						<img src="upload/${STORE.BA2}" width="200px" height="200px" alt=""/>
					</div>
					<div>
						<img src="upload/${STORE.SU1}" width="200px" height="200px" alt=""/>
					</div>
				</div>
				
			</div>
    	</main>	
    	<script>
			$(() => {
				$("#member_post").on("click", function (){
			
					new daum.Postcode({
				        oncomplete: function(data) {
				        	
				        	console.log(data);
				        	
				            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				            var roadAddr = data.roadAddress; // 도로명 주소 변수
			// 	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
				            // 우편번호와 주소 정보를 해당 필드에 넣는다. 
				            if(roadAddr !== ''){
				                document.getElementById("member_addr").value = roadAddr;
				            } 
			// 	            else if(jibunAddr !== ''){
			// 	                document.getElementById("member_addr").value = jibunAddr;
			// 	            }
				        }
				    }).open();
				})
				
			})
		</script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 