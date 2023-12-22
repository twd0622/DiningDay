<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>현재 페이지 타이틀</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
	<%@ include file="/Template/store_sidebar_open.jsp"%> 	
		<main style="display: flex;  align-items: center; text-align: center; padding:20px; height: 850px; flex-direction: column;">
			<div class="animate__animated animate__slideInDown mainContainer mt-5 p-5" style="border: 1px solid black; width: 30%; height: 620px; background:#FFDAB9;">
				<form method="post"  style="display:inline-block;">
					<h1 style="text-align: left;font-size: 22px;" class="p-5">사업자용 계정 정보 수정</h1>
					<div class="input-group mb-3 mt-2">
						<span class="input-group-text" id="id">이름</span>
						<input type="text" class="form-control" placeholder="Username" name="OWN_NAME"
						aria-label="Username" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="id">아이디</span>
						<input type="text" class="form-control" placeholder="UserId" name="OWN_ID"
						aria-label="Username" aria-describedby="basic-addon1" readonly>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="pw">비밀번호</span>
						<input type="password" class="form-control" placeholder="UserPw" name="OWN_PW"
						aria-label="Username" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="mail">이메일</span>
						<input type="text" class="form-control" placeholder="UserMail" name="OWN_EMAIL"
						aria-label="Username" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="phone">전화번호</span>
						<input type="text" class="form-control" placeholder="UserPhone" name="OWN_TEL"
						aria-label="Username" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="">사업자 번호</span>
						<input type="text" class="form-control" placeholder="UserCrn" name="OWN_CRN"
						aria-label="Username" aria-describedby="basic-addon1" readonly>
					</div>
					<div style="text-align: center;">
						<button type="button" class="nav__link btn btn-danger mt-4" id="reset"
			    		style="width:90px;height:40px;float: right;">돌아가기
			    		</button>
						<button type="button" class="nav__link btn btn-info mt-4" id="update"
			    		style="width:90px;height:40px;float: right;  margin-right: 1em;">수정하기
			    		</button>
					</div>
				</form>
			</div>					
    	</main>	
	<%@ include file="/Template/store_sidevar_close.jsp"%> 	
</html> 