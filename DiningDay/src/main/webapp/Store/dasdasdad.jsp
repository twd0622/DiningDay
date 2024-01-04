<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
					<table class="table" border="3">
					    <thead>
					    	<tr>
					    		<th style="background-color: var(--bg-color); color: white;">메뉴 이름</th>
					    		<th style="background-color: var(--bg-color); color: white;">사진</th>
					    		<th style="background-color: var(--bg-color); color: white;">설명</th>
					    		<th style="background-color: var(--bg-color); color: white;">가격</th>
					    		<th colspan="2" style="background-color: var(--bg-color); color: white;">재고상태</th>
					    		<th colspan="2" style="background-color: var(--bg-color); color: white;"></th>
					    	</tr>
					    </thead>
						<tbody id="tbody_1" class="table-group-divider">
							<tr id="tr_1">
								<td>
									<input type="text" class="form-control border border-dark " name="MENU_NAME">
									<input type="hidden" name="MENU_NO" value="M"></td>
								<td>
									<input type="file" class="form-control border border-dark" id="inputFile_1" name="PHOTO_NAME" aria-describedby="fileButton_1">
									<input type="hidden" name="PHOTO_TYPE" value="M">					
								</td> 
								<td>
									<textarea style="resize: none;" cols="40" rows="3" name="MENU_INFO" placeholder="메뉴 정보 입력해주세요 :)"></textarea>
								</td> 
								<td>
									<input type="text" class="form-control border border-dark" name="MENU_PRICE" placeholder="ex) 17,000">
								</td>
								<td colspan="2">
									<select class="form-select border border-dark">
										<option selected value="판매중">판매중</option>
										<option value="품절">품절</option>
									</select>
								</td> 
								<td>
									<button type="button" name="add" class="btn btn-success">추가</button>
								</td>
								<td>
									<button type="reset" class="btn btn-danger" name="delete_1"
									style="text-align: center;">
						        		초기화
						        	</button>
						        </td>
							</tr>
				    	</tbody>
					</table>
					<h3>메뉴 추가 사진 미리보기</h3>
					<div class="image_container" id="img_1" style="width:500px; height:500px;">
					</div>
					</form>
</body>
</html>