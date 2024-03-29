<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/timepicki.css">
    <style>
    	.rating-wrap{
            padding: 10px;
            display: flex;
            pointer-events: none !important;
        }
        .rating-wrap div{
			pointer-events: none !important;
		}
        .rating {
            display: flex;
            align-items: center;
            position: relative;
        }
        .star {
            width: 30px;
            height: 30px;
            margin-right: 2px;
        }
        .starcolor{
            fill: #ff8844;
        }
        .star:last-of-type {
            margin-right: 0;
        }
        .overlay {
            background-color: #000;
            opacity: 0.5;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            z-index: 1;
            transition: all 0.3s ease-in-out;
        }
        @supports (mix-blend-mode: color) {
            .overlay{
                mix-blend-mode: color;
                opacity: unset;
            }
        }
        .rating-wrap{
        	align-items: center !important;
        }
    </style>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
	
		<main style="display: flex;  align-items: center; text-align: center; padding:20px;">
			<div class="mainContainer" style="width: 100%; background:#f0f0f3; ">
			<c:set var="STORE" value="${ requestScope.STORE_LIST}" />
			
				<form id="oldData" method="post" enctype="multipart/form-data" >
					<input type="hidden" name="STORE_NAME" value="${STORE.STORE_NAME}">
					<input type="hidden" name="STORE_TEL" value="${STORE.STORE_TEL}">
					<input type="hidden" name="STORE_LOCATION" value="${STORE.STORE_LOCATION}">
					<input type="hidden" name="STORE_DETAIL" value="${STORE.STORE_DETAIL}">
					<input type="hidden" name="STORE_INFO" value="${STORE.STORE_INFO}">
					<input type="hidden" name="STORE_PLUS" value="${STORE.STORE_PLUS}">
					<input type="hidden" name="STORE_CATEGORY" value="${STORE.STORE_CATEGORY}">
					<input type="hidden" name="STORE_LO" value="${STORE.STORE_LO}">
					<input type="hidden" name="STORE_RT" value="${STORE.STORE_RT}">
					<input type="hidden" name="STORE_CLOSE" value="${STORE.STORE_CLOSE}">
					<input type="hidden" name="STORE_ST" value="${STORE.STORE_ST}">
					<input type="hidden" name="STORE_ET" value="${STORE.STORE_ET}">
					<input type="hidden" name="STORE_BTS" value="${STORE.STORE_BTS}">
					<input type="hidden" name="STORE_BTE" value="${STORE.STORE_BTE}">
					<input type="hidden" name="STORE_RST" value="${STORE.STORE_RST}">
					<input type="hidden" name="STORE_RET" value="${STORE.STORE_RET}">
					<input type="hidden" name="SU1" value="${STORE.SU1}">
					<input type="hidden" name="BA1" value="${STORE.BA1}">
					<input type="hidden" name="BA2" value="${STORE.BA2}">
					<input type="file" id="inputfile_1" name="SU1_PHOTO_NAME" style="display: none;">
					<input type="file" id="inputfile_2" name="BA1_PHOTO_NAME" style="display: none;">
					<input type="file" id="inputfile_3" name="BA2_PHOTO_NAME" style="display: none;">
				</form>
				<form id="newData" style="display: flex; justify-content: center;">
					<div style="width: 1000px; display: flex; flex-direction: column; background-color: white;" class="rounded-4 shadow mt-5 mb-5">
						<div>
							<div class="container p-4 mb-3" style="display: flex; justify-content: flex-start; align-items: center;">
					        	<label>
					        		<input type="hidden" name="ratevalue" value="${STORE.REV_SCORE}" step="0.1" min="0" max="5" />
					        	</label>
					        <div class="rating-wrap">
					        	<div style="position: relative;"><span>식당 정보</span></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div style="position: relative; margin-right: 2px;"><span>평점&nbsp;&nbsp;:&nbsp;&nbsp;</span></div>&nbsp;
					        	<div class="rating">
					        		<div class="overlay"></div>
					        		</div>
					        	</div>
					        	<div><span>(${STORE.REV_SCORE})점</span></div>	
					        </div> 
						</div>
						<div class="mt-3" style="display: flex; justify-content: space-around;">
							<div style="width: 350px;">
								<div class="input-group">
									<span class="input-group-text" id="tagName_1">식당 이름</span>
									<input type="text" name="STORE_NAME" id=STORE_NAME class="form-control is-valid" aria-describedby="tagName_1" value="${STORE.STORE_NAME}">
								</div>
							</div>
							<div style="width: 350px;">
								<div class="input-group">
									<span class="input-group-text" id="tagName_1">식당 카테고리</span>
									<select id="STORE_CATEGORY" name="STORE_CATEGORY" style="width: 200px;" class="form-control is-valid" aria-describedby="tagName_1">
										<option value="아시안">아시안</option>
										<option value="한식">한식</option>
										<option value="양식">양식</option>
										<option value="중식">중식</option>
										<option value="일식">일식</option>
										<option value="분식">분식</option>
										<option value="카페/디저트">카페/디저트</option>
									</select>
								</div>
							</div>
						</div>
						<div class="mt-3" style="display: flex; justify-content: space-around;">
							<div style="width: 350px;">
								<div class="input-group">
									<span class="input-group-text" id="tagName_1">식당 전화번호</span>
									<input type="text" name="STORE_TEL" id=STORE_TEL class="form-control is-valid" aria-describedby="tagName_1"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${STORE.STORE_TEL}">
								</div>
							</div>
							<div style="width: 350px;">
								<div class="input-group">
									<span class="input-group-text" id="tagName_1">마감 준비시간</span>
									<select id="STORE_LO" name="STORE_LO" class="form-control is-valid" aria-describedby="tagName_1">
										<option value="0">없음</option>
										<option value="1">1시간</option>
										<option value="2">2시간</option>
										<option value="3">3시간</option>
									</select>
								</div>
							</div>
						</div>
						<div class="mt-3" style="display: flex; justify-content: space-around;">
							<div style="width: 350px;">
								<div class="input-group">
									<span class="input-group-text" id="tagName_1">식당 세부정보</span>
									<input type="text" name="STORE_DETAIL" id="STORE_DETAIL" class="form-control is-valid" aria-describedby="tagName_1"
									value="${STORE.STORE_DETAIL}">
								</div>
							</div>
							<div style="width: 350px;">
								<div class="input-group">
									<span class="input-group-text" id="tagName_1">예약 이용시간</span>
									<select id="STORE_RT" name="STORE_RT" class="form-control is-valid" aria-describedby="tagName_1">
										<option value="1">1시간</option>
										<option value="2">2시간</option>
										<option value="3">3시간</option>
										<option value="4">4시간</option>
										<option value="5">5시간</option>
									</select>
								</div>
							</div>
						</div>
						<div class="mt-3" style="display: flex; justify-content: space-around;">
							<div style="width: 350px;">
								<div class="input-group">
									<span class="input-group-text" id="tagName_1">식당 소개</span>
									<textarea id="STORE_INFO" name="STORE_INFO" style="resize: none;" cols="30" rows="10" class="form-control is-valid" aria-describedby="tagName_1">
									${STORE.STORE_INFO}</textarea>
								</div>
							</div>
							<div style="width: 350px;">
								<div class="input-group">
									<span class="input-group-text" id="tagName_1">식당 시설정보</span>
									<textarea id="STORE_PLUS" name="STORE_PLUS" style="resize: none;" cols="30" rows="10" class="form-control is-valid" aria-describedby="tagName_1">
									${STORE.STORE_PLUS}</textarea>
								</div>
							</div>
						</div>
						<div class="mt-3" style="display: flex; justify-content: space-around;">
							<div style="width: 350px;">
								<div class="input-group">
								  	<textarea id="STORE_LOCATION" class="form-control is-valid" placeholder="지번 주소" aria-label="지번 주소" 
								  	aria-describedby="button-addon2" name="STORE_LOCATION" style="resize: none;" cols="20" rows="3">${STORE.STORE_LOCATION}</textarea>
								  	<button class="btn btn-outline-secondary" type="button" id="member_addr">주소 검색</button>
								</div>
							</div>
							<div style="width: 350px;">
								<div class="input-group STORE_IS_OPEN">
									<span class="input-group-text" id="tagName_1">휴무일</span>
									<select multiple class="select form-control is-valid" id="STORE_CLOSE" name="STORE_CLOSE" multiple="multiple" aria-describedby="tagName_1">
										<option value="0">없음</option>
										<option value="월">월요일</option>
										<option value="화">화요일</option>
										<option value="수">수요일</option>
										<option value="목">목요일</option>
										<option value="금">금요일</option>
										<option value="토">토요일</option>
										<option value="일">일요일</option>
									</select>
								</div>
							</div>
						</div>
						<div class="mt-5" style="display: flex; justify-content: space-around;">
							<div style="width: 350px;">
								<div class="input-group">
									<span class="input-group-text" id="tagName_1">영업 시작 시간</span>
									<input type="text" name="STORE_ST" id="STORE_ST" class="form-control is-valid" aria-describedby="tagName_1"
									value="${STORE.STORE_ST}">
								</div>
							</div>
							<div style="width: 350px;">
								<div class="input-group">
									<span class="input-group-text" id="tagName_1">영업 종료 시간</span>
									<input type="text" name="STORE_ET" id="STORE_ET" class="form-control is-valid" aria-describedby="tagName_1"
									value="${STORE.STORE_ET}">
								</div>
							</div>
						</div>
						<div class="mt-5 mb-3 rounded-5" style="border: 1px solid green; width: 900px; margin-left: 5%;">
							<div class="mt-3" style="display: flex; justify-content: space-around;">
								<div style="width: 350px;">
									<div class="input-group STORE_BR_1">
										<span class="input-group-text" id="tagName_1">브레이크 시작 시간</span>
										<input type="text" name="STORE_BTS" id="STORE_BTS" class="form-control is-valid" aria-describedby="tagName_1"
										value="${STORE.STORE_BTS}">
									</div>
								</div>
								<div style="width: 350px;">
									<div class="input-group STORE_BR_2">
										<span class="input-group-text" id="tagName_1">브레이크 종료 시간</span>
										<input type="text" name="STORE_BTE" id="STORE_BTE" class="form-control is-valid" aria-describedby="tagName_1"
										value="${STORE.STORE_BTE}">
									</div>
								</div>
							</div>
							<div class="mt-3 mb-3" style="display: flex; justify-content: flex-end;">
								<button type="button" style="font-size: 10px; margin-right: 13px;" class="btn btn-danger rounded-4 shadow STORE_BR_BTN">휴게시간 없애기</button>
							</div>
						</div>
						<div class="mt-5 mb-5" style="display: flex; justify-content: space-around;">
							<div style="width: 350px;">
								<div class="input-group">
									<span class="input-group-text" id="tagName_1">예약 시작 시간</span>
									<input type="text" name="STORE_RST" id="STORE_RST" class="form-control is-valid" aria-describedby="tagName_1"
									value="${STORE.STORE_RST}">
								</div>
							</div>
							<div style="width: 350px;">
								<div class="input-group">
									<span class="input-group-text" id="tagName_1">예약 종료 시간</span>
									<input type="text" name="STORE_RET" id="STORE_RET" class="form-control is-valid" aria-describedby="tagName_1"
									value="${STORE.STORE_RET}">
								</div>
							</div>
						</div>
						<div class="mt-5 PH" style="display: flex; justify-content: space-around;">
							<div>
								<div><button id="BA1" type="button" class="btn btn-success mb-3">좌측 배너 사진</button></div>
								<div><h5 style="color:salmon">※필수※</h5></div>
								<div class="mt-3 rounded-4 shadow BA1" style="width: 400px; height: 400px; border: 2px solid green; display: flex; justify-content: center; align-items: center;">
									<img src="upload/${STORE.BA1}" style="width: 380px; height: 380px;" alt="" class="rounded-4 shadow"/>
								</div>
							</div>
							<div>
								<div><button type="button" id="BA2" class="btn btn-success mb-3">우측 배너 사진</button></div>
								<div><h5 style="color:salmon">※필수※</h5></div>
								<div class="mt-3 rounded-4 shadow BA2" style="width: 400px; height: 400px; border: 2px solid green; display: flex; justify-content: center; align-items: center;">
									<img src="upload/${STORE.BA2}" style="width: 380px; height: 380px;" alt="" class="rounded-4 shadow"/>
								</div>	
							</div>
						</div>
						<div class="mt-5 mb-5 PH" style="display: flex; justify-content: space-around;">
							<div>
								<div><button type="button" id="SU1" class="btn btn-success mb-3">썸네일 사진</button></div>
								<div><h5 style="color:salmon">※필수※</h5></div>
								<div class="mt-3 rounded-4 shadow SU1" style="width: 400px; height: 400px; border: 2px solid green; display: flex; justify-content: center; align-items: center;">
									<img src="upload/${STORE.SU1}" style="width: 380px; height: 380px;" alt="" class="rounded-4 shadow"/>
								</div>
							</div>
							<div style="display: flex; width: 400px; height: 400px; align-items: center; justify-content: center;">
								<div id="storeBtn">
									<div><button type="button" style="width: 150px; height:60px; font-size: 18px;" class="btn btn-warning rounded-4 shadow">수정하기</button></div>
									<div>
										<div><button type="button" style="width: 150px; height:60px; font-size: 18px;" class="btn btn-success rounded-4 shadow">저장하기</button></div>
										<div><button type="button" style="width: 150px; height:60px; font-size: 18px;" class="btn btn-danger rounded-4 shadow mt-3">취소하기</button></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>	
			</div>
    	</main>	
    	<script>
    	$(() => {
			$("#member_addr").on("click", function (){
		
				new daum.Postcode({
			        oncomplete: function(data) {
			        	
			        	console.log(data);
			        	var roadAddr = data.roadAddress; // 도로명 주소 변수
		 	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
			            
		 	            if(roadAddr != ''){
							roadAddr = data.jibunAddress;
							$("#STORE_LOCATION").val(roadAddr);
						}
			            
			            if(jibunAddr !== ''){
			                addressValue = jibunAddr;
			                $("#STORE_LOCATION").val(addressValue);
			            } 
			        }
			    }).open();
			})
    	})
		
    	const starSize = 30, maxStar = 5, gutter = 2;//별 크기, 별 개수
		let maskMax = 0; //오버레이 마스크 최대 너비
		window.addEventListener('DOMContentLoaded',()=>{
		    //별 이미지 SVG 개수만큼 생성
		    for(let i = 0;i < maxStar;i++){
		        let el = document.createElement('div');
		        //el.classList.add('star');
		        el.style.width = starSize + 'px';
		        el.style.height = starSize + 'px';
		        el.style.marginRight = gutter + 'px';
		        //인라인 SVG 이미지 부착
		        el.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="none" class="starcolor" d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"/></svg>';
		        document.querySelector('.rating').appendChild(el);
		    }
		    
		    maskMax = parseInt(starSize * maxStar + gutter * (maxStar-1));//최대 마스크 너비 계산
		    document.querySelector('input[name=ratevalue]').max = maxStar;//입력 필드 최대값 재설정
		    setRating(document.querySelector('input[name=ratevalue]').value);//초기 별점 마킹
		
		    //별점 마킹 함수
		    function setRating(val = 0){
		        document.querySelector('.overlay').style.width = parseInt(maskMax - val * starSize - Math.floor(val) * gutter) + 'px';//마스크 크기 변경해서 별점 마킹
		    }
		})
		</script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
		<script src="${ pageContext.request.contextPath }/resources/js/smainisExist.js"></script>
		
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 