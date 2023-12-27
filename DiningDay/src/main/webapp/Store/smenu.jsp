<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀</title>
    <style>
    	input, textarea {
    		text-align:center;
    	}
    	td, th {
        	justify-content: center;
        	align-items: center;
        	padding: 7px;
    	}
    	table {
    		text-align: center;
		}  
    </style>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
		<main style="display: flex;  align-items: center; text-align: center; padding:24px;">
			<div class="mainContainer" style="border: 1px solid black; width: 100%; height: 2000px; background:white; ">
				<div class="p-5" style="text-align: left;">
					<h1 class="mb-3">메뉴 추가</h1>
					<form method="post">
					<table class="table" border="3">
					    <thead>
					    	<tr>
					    		<th style="background-color: #FFF2A6;">메뉴 이름</th>
					    		<th style="background-color: #FFF2A6;">사진</th>
					    		<th style="background-color: #FFF2A6;">설명</th>
					    		<th style="background-color: #FFF2A6;">가격</th>
					    		<th colspan="2" style="background-color: #FFF2A6;">재고상태</th>
					    		<th colspan="2" style="background-color: #FFF2A6;" colspan="2">
						    		<button type="button" class="btn btn-outline-success" id="add"
						    		style="text-align: center;width:50px;height:50px;margin: 0 auto; line-height: 100%;">
			                        	<ion-icon name="add-outline"></ion-icon>
			                   	 	</button>
					    		</th>
					    	</tr>
					    </thead>
						<tbody id="tbody_1" class="table-group-divider">
							<tr>
								<td><input type="text" class="form-control" name="MENU_NAME" value="상큼한 스튜"></td>
								<td>
									<input type="file" class="form-control" id="inputFile_1" name="MENU_PHOTO" 
									aria-describedby="fileButton_1">
								</td>
								<td><textarea style="resize: none;" cols="50" rows="3" name="MENU_INFO" placeholder="싱싱한 재료를 사용한 토마토 스튜"></textarea></td>
								<td><input type="text" class="form-control" name="MENU_PRICE" value="17,000"></td>
								<td colspan="2">
									<select class="form-select">
										<option selected value="판매중" style="font-size: 12px;">판매중</option>
										<option value="품절">품절</option>
									</select>
								</td>
								<td>
									<button type="button" class="btn btn-outline-warning" name="update"
						    		style="text-align: center;width:60px;height:50px;margin: 0 auto;">
						    		수정</button>
			                   	 </td>
								<td>
			                   	 	<button type="button" class="btn btn-outline-danger" name="delete_2"
						    		style="text-align: center;width:50px;height:50px;margin: 0 auto;">
			                        	<ion-icon name="trash-outline"></ion-icon>
			                   	 	</button>
			                	</td>
							</tr>
				    	</tbody>
					</table>
					</form>
					<h3 class="mt-5">메뉴 추가 사진 미리보기</h3>
					<div class="image_container" id="img_1" style="width:500px; height:500px;">
					</div>
					<h1 class="mb-3 mt-5">메뉴 관리</h1>
					<table class="table" border="3">
					    <thead>
					    	<tr>
					    		<th style="background-color: #FFF2A6;">메뉴 이름</th>
					    		<th style="background-color: #FFF2A6;">사진</th>
					    		<th style="background-color: #FFF2A6;">설명</th>
					    		<th style="background-color: #FFF2A6;">가격</th>
					    		<th style="background-color: #FFF2A6;">재고상태</th>
					    		<th style="background-color: #FFF2A6;" colspan="2">
					    		</th>
					    	</tr>
					    </thead>
						<tbody id="tbody_2" class="table-group-divider">
							<tr>
								<td><input type="text" class="form-control" name="MENU_NAME" value="상큼한 스튜"></td>
								<td>
									<span>image_1.png</span>
									<input type="file" class="form-control" id="inputFile_2" name="MENU_PHOTO" 
									aria-describedby="fileButton_1">
								</td>
								<td><textarea style="resize: none;" cols="50" rows="3" name="MENU_INFO" placeholder="싱싱한 재료를 사용한 토마토 스튜"></textarea></td>
								<td><input type="text" class="form-control" name="MENU_PRICE" value="17,000"></td>
								<td>
									<select class="form-select">
										<option selected value="판매중" style="font-size: 12px;">판매중</option>
										<option value="품절">품절</option>
									</select>
								</td>
								<td>
									<button type="button" class="btn btn-outline-warning" name="update"
						    		style="text-align: center;width:60px;height:50px;margin: 0 auto;">
						    		수정</button>
						    		<button type="button" name="save" class="btn btn-outline-success">저장</button>
			                   	 </td>
								<td>
			                   	 	<button type="button" class="btn btn-outline-danger" name="delete_2"
						    		style="text-align: center;width:50px;height:50px;margin: 0 auto;">
			                        	<ion-icon name="trash-outline"></ion-icon>
			                   	 	</button>
			                	</td>
							</tr>
							<tr>
								<td><input type="text" class="form-control" name="MENU_NAME" value="상큼한 스튜"></td>
								<td>
									<span>image_2.png</span>
									<input type="file" class="form-control" id="inputFile_2" name="MENU_PHOTO" 
									aria-describedby="fileButton_1">
								</td>
								<td><textarea style="resize: none;" cols="50" rows="3" name="MENU_INFO" placeholder="싱싱한 재료를 사용한 토마토 스튜"></textarea></td>
								<td><input type="text" class="form-control" name="MENU_PRICE" value="17,000"></td>
								<td>
									<select class="form-select">
										<option selected value="판매중" style="font-size: 12px;">판매중</option>
										<option value="품절">품절</option>
									</select>
								</td>
								<td>
									<button type="button" class="btn btn-outline-warning" name="update"
						    		style="text-align: center;width:60px;height:50px;margin: 0 auto;">
						    		수정</button>
						    		<button type="button" name="save" class="btn btn-outline-success"
						    		style="text-align: center;width:60px;height:50px;margin: 0 auto;">저장</button>
			                   	 </td>
								<td>
			                   	 	<button type="button" class="btn btn-outline-danger" name="delete_2"
						    		style="text-align: center;width:50px;height:50px;margin: 0 auto;">
			                        	<ion-icon name="trash-outline"></ion-icon>
			                   	 	</button>
			                	</td>
							</tr>
				    	</tbody>
					</table>
					<h3 class="mt-5">메뉴 수정 사진 미리보기</h3>
					<div class="image_container" id="img_2" style="width:500px; height:500px;">
					</div>
				</div>
			</div>
    	</main>	
    	<script src="${ pageContext.request.contextPath }/Store/resour/js/menu_control.js"></script>
    	<script src="${ pageContext.request.contextPath }/Store/resour/js/photo_control.js"></script>
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 
