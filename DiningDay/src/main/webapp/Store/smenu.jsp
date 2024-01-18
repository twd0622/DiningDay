<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀</title>
    <link href="${ pageContext.request.contextPath }/resources/css/sResmodal.css" rel="stylesheet" />

    <style>
/* 로딩*/
input, textarea {
	text-align: center;
}

td, th {
	justify-content: center;
	text-align: center;
	/*         	align-items: center; */
	/*         	padding: 7px; */
	/*         	border-collapse : collapse; */
}

table {
	border-collapse: collapse;
	text-align: center;
}

#img_1, #img_2 {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 400px;
	height: 400px;
	color: white;
	font-family: 'Raleway';
	font-size: 2.5rem;
}

@
keyframes rotate { 
	100% {
	transform: rotate(1turn);
	}

}
@
keyframes blink { 
	40% {
		opacity: .5;
	}
	
	80%	{
		opacity:1;
	}
}

.rotated_box {
	position: relative;
	width: 200px;
	height: 200px;
	overflow: hidden; &:: before { content : "";
	position: absolute;
	left: -50%;
	top: -50%;
	width: 200%;
	height: 200%;
	background-repeat: no-repeat;
	background-size: 50% 50%;
	background-position: 0 0, 100% 0, 100% 100%, 0 100%;
	background-image: linear-gradient(#399953, #399953),
		linear-gradient(#fbb300, #fbb300), linear-gradient(#d53e33, #d53e33),
		linear-gradient(#377af5, #377af5);
	animation: rotate 3s linear infinite;
}

&
:after {
	content: "";
	position: absolute;
	top: 6px;
	left: 6px;
	right: 6px;
	bottom: 6px;
	background: #fff;
}
}
#pagination a {
	display: inline-block;
	margin-right: 5px;
	cursor: pointer;
}
</style>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
		<main style="display: flex;  align-items: center; text-align: center; padding:24px;">
			<div class="mainContainer" style="width: 100%; background:#f0f0f3; ">
				<div class="p-5" style="text-align: left;">
					<input type="hidden" name="STORE_NO" value="${ sessionScope.STORE_NO }">
					<h1 class="mb-3 mt-5">메뉴 관리</h1>
<!-- 					style="display: none; -->
					<div>
						<form id="ONE_MENU_DATA" enctype="multipart/form-data"></form>
						<form id="MENU_DATA" enctype="multipart/form-data"></form>
						<table class="table" border="3">
						    <thead>
						    	<tr>
						    		<th style="background-color: var(--bg-color); color: white; width: 180px;">
						    			<div class="form-check form-switch" style="display: flex;  align-items: center; text-align: center; justify-content: center">
  											<input type="checkbox" id="allCheck" style="width:55px; height:25px;">&nbsp;&nbsp;	
											<label class="form-check-label" for="allCheck" style="font-size: 14px;">전체 선택</label>
										</div>
						    		</th>
						    		<th style="background-color: var(--bg-color); color: white;">메뉴 이름</th>
						    		<th style="background-color: var(--bg-color); color: white;">사진</th>
						    		<th style="background-color: var(--bg-color); color: white;">설명</th>
						    		<th style="background-color: var(--bg-color); color: white;">가격</th>
						    		<th style="background-color: var(--bg-color); color: white;">재고상태</th>
						    		<th style="background-color: var(--bg-color); color: white;" colspan="3">
						    			<button type="button" name="add" class="btn btn-success">메뉴 등록</button>
						    		</th>
						    	</tr>
						    </thead>
							<tbody id="tbody_2" class="table-group-divider">
					    	</tbody>
						</table>
						<div style="display: flex; justify-content: center;">
							<div></div>
							<div class="demo">
							    <nav class="pagination-outer"  aria-label="Page navigation">
							        <ul class="pagination" id="pagination"></ul>
							    </nav>
							</div>  
						</div>
						<div style="display: flex; justify-content: flex-end;">
							<button type="button" class="btn btn-danger btn-lg" name="totalDelete" data-bs-html="true"
							 data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="(주의!) 체크된 항목만</br>삭제되는 버튼입니다 :)">일괄 삭제</button>
						</div>
					</div>
				</div>
			</div>
			<div id="sResModal" class="sResmodal">
		  	<div class="sResmodal-content">
		  		<div style="display: flex; height: 35px; align-items: center; justify-content: flex-end; background-color: var(--bg-color);">
		    		<span style="font-size: 50px;" class="close mt-5 p-3">&times;</span>
		    	</div>
		    	<div class="sResmodal-header" style="display: flex; justify-content: center;">
	    			<h1>메뉴 등록</h1>
		    	</div>
		    	<div class="sResmodal-body">
		    		<form style="display: flex;" id="modalForm">
		    			<div>
		    				<h3>메뉴 추가 사진 미리보기</h3>
		    				<div class="image_container" id="img_1" style="border: 1px solid black;">
		    				</div>
		    			</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    			<div>
			    			<ul id="modalData">
			    				<li>
			    					<div class="form-floating mt-2 mb-2">
				    					<input type="text" class="form-control is-invalid" name="MENU_NAME" id="0">
										<label for="menuName">메뉴이름</label>
									</div>
								</li>
			    				<li>
			    					<input type="file" class="form-control border border-dark" id="inputFile_1" name="hidden_file" aria-describedby="fileButton_1">
									<input type="hidden" name="PHOTO_TYPE">
			    				</li>
			    				<li>
			    					<div class="form-floating  mt-2 mb-2">
				    					<textarea class="form-control is-invalid" style="resize: none; height: 200px;" id="1" name="MENU_INFO"></textarea>
				    					<label for="menuInfo">메뉴 정보</label>
			    					</div>
			    				</li>
			    				<li>
			    					<div class="form-floating  mt-2 mb-2">
				    					<input type="text" class="form-control is-invalid" id="2" name="MENU_PRICE">
				    					<label for="menuPrice">메뉴 가격</label>
			    					</div>
			    				</li>
			    				<li>
			    					<select class="form-select border border-dark  mt-2 mb-2">
										<option value="품절">품절</option>
										<option selected value="판매중">판매중</option>
									</select>
			    				</li>
			    			</ul>
		    			<div style="display: flex; justify-content: center;">
		    				<button type="button" name="insert" class="btn btn-success btn-lg" disabled>등록하기</button>
		    			</div>
		    			</div>
		    		</form>
		     	</div>
		    	<div class="sResmodal-footer">
		    	</div>
		  	</div>
		</div>
		<div id="loading" style="display: none; ">
			<div id="loading_bar">
				<img src="${ pageContext.request.contextPath }/resources/img/Spin-loading.gif"/>
				<p style="font-size: x-large; font-weight: bold">로딩 중 입니다 ...</p>
			</div>
		</div>
    	</main>	
    	<script src="${ pageContext.request.contextPath }/resources/js/smenu.js"></script>
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 
