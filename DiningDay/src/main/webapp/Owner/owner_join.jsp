<!-- 12/15/18:10_강현아 + 점주용 회원가입 개설 -->
<!-- 12/26/14:10_강현아 + 페이지 연결 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주 회원가입</title>
</head>
<%@ include file="/Template/header.jsp"%> 
<main style="display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 68.5px; padding:100px 0 100px 0; background:white;">
<div class="position-static d-block bg-body p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin" style="width:500px;" >
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">점주 계정 회원가입</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form action="owner_joinPro.ow" style="text-align: center;" method="post" name="owner_join">
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>아이디</label> </div>
				    	<input type="text" name="OWN_ID" class="form-control"  placeholder="영문, 글자 포함 최소 6자리 이상"/>
				  </div>
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>비밀번호</label> </div>
				    	<input type="password" name="OWN_PW" class="form-control" placeholder="영문 대소문자, 숫자, 기타문자 포함 8~14자리"/>
				  </div>
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>비밀번호 확인</label> </div>
				    	<input type="password" name="OWN_PWCHECK" class="form-control" placeholder="비밀번호를 다시 작성해 주세요."/>
				  </div>
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>이름</label> </div>
				    	<input type="email" name="OWN_NAME" class="form-control" />
				  </div>
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>이메일</label> </div>
				    	<input type="email" name="OWN_EMAIL" class="form-control" />
				  </div>
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>전화번호</label> </div>
				    	<input type="tel" name="OWN_TEL" class="form-control" />
				  </div>		  
				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>사업자번호</label> </div>
				    	<input type="text" name="OWN_CRN" class="form-control" />
				  </div>	
  				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>식당명</label> </div>
				    	<input type="text" name="STORE_NAME" class="form-control" />
				  </div>					  
  				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>식당 위치</label> </div>
				    	<input type="text" name="STORE_LOCATION" class="form-control" />
				  </div>
  				  <div class="form-outline mb-4">
				  	<div style="text-align: left;"> <label>식당 구분</label> </div>
		    			<select name="STORE_CATEGORY" id="STORE_CATEGORY" class="form-select" aria-label="Default select example">
							<option selected>업종 선택</option>
							<option value="한식">한식</option>
							<option value="일식">일식</option>
							<option value="중식">중식</option>
							<option value="레스토랑">레스토랑</option>
							<option value="카페">카페</option>
						</select>
				  </div>
				  <br>
				  
				  
			    <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
				  <li class="nav-item" role="presentation">
				    <a class="nav-link active" id="own_success" data-mdb-toggle="pill" href="javascript:check();"  role="tab"
				      aria-controls="register" aria-selected="true"
				      style="color: #111111; background-color: #FFF2A6; border-color: #ffffff;">가입</a>
				  </li>
				  <li class="nav-item" role="presentation">
				    <a class="nav-link" id="own_fail" data-mdb-toggle="pill" href="owner_login.ow" role="tab"
				      aria-controls="none" aria-selected="false">취소</a>
				  </li>
				</ul>
				
				
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function check() {
	// alert("체크");	
	// 전송 (버튼 type=submit)
	document.owner_join.submit();
}
</script>
</main>
<%@ include file="/Template/footer.jsp"%> 
</html>

