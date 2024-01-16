<!-- 12/19/17:50_강현아 + 고객 정보 수정 개설 -->
<!-- 12/26/14:10_강현아 + 페이지 연결 -->
<!-- 12/27/9:50_강현아 + margin 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 정보 수정</title>
</head>
<%@ include file="/Template/header.jsp"%> 
<style>
#body {
  margin-top: 5%;
}

 #edit_success {
 	color: #111111;
 	background-color: #FFF2A6;
 }
 
 #edit_fail {
	color: #111111; 
	background-color: #d6d6d6;
 }
</style>
<c:set var="customerInfo" value="${requestScope.customerInfo}"/>
<body id="body">
<form action="cus_editPro.cu" method="post" name="cus_edit">
<div class="container rounded bg-white mt-5 mb-5">
	<div class="row">
		<div class="col-md-3 border-right">
			<div class="d-flex flex-column align-items-center text-center p-3 py-5">
				<img value="${customerInfo.CUS_IMAGE}" class="rounded-circle mt-5" width="150px" 
	           	 	 src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
				<span class="font-weight-bold">${customerInfo.CUS_NICK}</span>
				<span class="text-black-50">${customerInfo.CUS_EMAIL}</span>
            </div>
		</div>
        <div class="col-md-5 border-right">
			<div class="p-3 py-5">
				<div class="d-flex justify-content-between align-items-center mb-3">
					<h4 class="text-right mb-4">고객 정보 설정</h4>
				</div>
                <div class="row mt-3">
               		<div class="col-md-12 mb-4"><label class="labels"><b>이름</b></label>
               			<input type="text" name="CUS_NAME" class="form-control" value="${customerInfo.CUS_NAME}"></div>
               		<div class="col-md-12 mb-4"><label class="labels"><b>닉네임</b></label>
               			<input type="text" name="CUS_NICK" class="form-control" value="${customerInfo.CUS_NICK}"></div>
                    <div class="col-md-12 mb-4"><label class="labels"><b>전화번호</b></label>
                    	<input type="text" name="CUS_TEL" class="form-control" value="${customerInfo.CUS_TEL}"></div>
                    <div class="col-md-12 mb-4"><label class="labels"><b>이메일</b></label>
                    	<input type="text" name="CUS_EMAIL" class="form-control" value="${customerInfo.CUS_EMAIL}"></div>
                    <div class="col-md-12"><label class="labels"><b>생년월일</b></label>
                    	<input type="date" name="CUS_BIRTH" class="form-control" value="${customerInfo.CUS_BIRTH}"></div>
                </div>
			</div>
			<ul class="nav nav-pills nav-justified mb-3">
				<li class="nav-item">
					<a class="nav-link active" id="edit_success" data-mdb-toggle="pill" onclick="edit()">저장</a>
				</li>			
				<li class="nav-item">
					<a class="nav-link" id="edit_fail" data-mdb-toggle="pill" href="mypage.cu">취소</a>
				</li>
			</ul>
        </div>
        <div class="col-md-4">
			<div class="p-3 py-5">
				<div class="d-flex justify-content-between align-items-center experience mt-4">
					<span><b>프로필이미지 설정</b></span>
					<span class="border px-3 p-1 add-experience">
					<i class="fa fa-plus"></i>&nbsp;사진 선택</span>
				</div><br>
				<div class="container-fluid align-items-center">
					<div class="card">변경 후 이미지<br>
						<div class="align-items-center text-center">
							<img class="rounded-circle mt-5" align="middle" width="200px" height="200px"
								  name="CUS_IMAGE" src="profile/j7.jpg">
						</div><br>
					</div>
				</div>
            </div>
        </div>
    </div>
</div>
</form>
</body>
<script type="text/javascript">
function edit() {
	document.cus_edit.submit();
}
</script>
<%@ include file="/Template/footer.jsp"%> 
</html>