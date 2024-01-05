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

 #div1{
 	margin-top: 100px;
 	padding-top: 100px;
 }
</style>
<c:set var="storeInfo" value="${requestScope.customerInfo}"/>
<body id="body">
<form action="cus_editPro.cu" method="post" name="cus_edit">
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
           	 <img  value="${customerInfo.CUS_IMAGE}" class="rounded-circle mt-5" width="150px" 
           	 	   src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
            	<span class="font-weight-bold">${customerInfo.CUS_NICK}</span>
           	    <span class="text-black-50">${customerInfo.CUS_EMAIL}</span><span> </span></div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">고객 정보 설정</h4>
                </div>
                <div class="row mt-3">

               		<div class="col-md-6"><label class="labels"><b>이름</b></label>
               			<input type="text" name="CUS_NAME" class="form-control" value="${customerInfo.CUS_NAME}"></div>
                   	<div></div>
               		<div class="col-md-6"><label class="labels"><b>닉네임</b></label>
               			<input type="text" name="CUS_NICK" class="form-control" value="${customerInfo.CUS_NICK}"></div>
                   	<div></div>
                    <div class="col-md-12"><label class="labels"><b>전화번호</b></label>
                    	<input type="text" name="CUS_TEL" class="form-control" value="${customerInfo.CUS_TEL}"></div>
                    	<div></div>
                    <div class="col-md-12"><label class="labels"><b>이메일</b></label>
                    	<input type="text" name="CUS_EMAIL" class="form-control" value="${customerInfo.CUS_EMAIL}"></div>
                    	<div></div>
                    <div class="col-md-12"><label class="labels"><b>생년월일</b></label>
                    	<input type="date" name="CUS_BIRTH" class="form-control" value="${customerInfo.CUS_BIRTH}"></div>
                    	<div></div>
                    <div class="col-md-12"><label class="labels"><b>성별</b></label>
                    <div></div>
                    	 <c:if test="${customerInfo.CUS_GENDER eq 'M'}">
							<input type="radio" class="css-radio" value="M" name="CUS_GENDER" checked>남
							<input type="radio" class="css-radio" value="F" name="CUS_GENDER">여
						 </c:if>
						 <c:if test="${customerInfo.CUS_GENDER eq 'F'}">
							<input type="radio" class="css-radio" value="M" name="CUS_GENDER">남
							<input type="radio" class="css-radio" value="F" name="CUS_GENDER" checked>여
						 </c:if>
					</div>
					
                </div>
                </div>
<!-- 					<div class="d-inline p-2 bg-primary text-white">저장</div> -->
<!-- 					<div class="d-inline p-2 bg-dark text-white">취소</div> -->
           		<ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
				  <li class="nav-item" role="presentation">
				    <a class="nav-link active" id="edit_success" data-mdb-toggle="pill" href="javascript:check();" role="tab"
				      aria-controls="register" aria-selected="true" style="color: #111111; background-color: #FFF2A6;">저장</a>
				  </li>			
				  <li class="nav-item" role="presentation">
				    <a class="nav-link" id="edit_fail" data-mdb-toggle="pill" href="mypage.cu" role="tab"
				      aria-controls="none" aria-selected="false" style="color: #111111; background-color: #d6d6d6;">취소</a>
				  </li>
           		</ul>
        </div>
        <div class="col-md-4">
            <div class="p-3 py-5">
            <p></p>
          		  <div class="d-flex justify-content-between align-items-center experience">
                 	<span><b>프로필이미지 설정</b></span>
                 	<span class="border px-3 p-1 add-experience">
                		 <i class="fa fa-plus"></i>&nbsp;사진 선택</span></div><br>
                		 <div class="container-fluid align-items-center">
                		 	<div class="card" >
                		 		변경 후 이미지<br>
	                		 	<div class="align-items-center text-center">
							 	  <img class="rounded-circle mt-5" align="middle" width="200px" height="200px"
							 	       name="CUS_IMAGE" src="profile/j7.jpg">
							 	</div>
						 		<br>
						    </div>
						 </div>
<!--                 <div class="d-flex justify-content-between align-items-center experience"> -->
<!--                 	<span>프로필이미지 설정</span><span class="border px-3 p-1 add-experience"> -->
<!--                		 <i class="fa fa-plus"></i>&nbsp;사진 선택</span></div><br> -->
<!--                 <div class="col-md-12"><label class="labels">Experience in Designing</label><input type="text" class="form-control" placeholder="experience" value=""></div> <br> -->
<!--                 <div class="col-md-12"><label class="labels">Additional Details</label><input type="text" class="form-control" placeholder="additional details" value=""></div> -->
            </div>
        </div>
    </div>
</div>
</form>
</body>
<script type="text/javascript">
function check() {
	document.cus_edit.submit();
}
</script>
<%@ include file="/Template/footer.jsp"%> 
</html>