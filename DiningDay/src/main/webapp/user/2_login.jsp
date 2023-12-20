<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member/login.jsp</title>
</head>
	<body>
		<h2>로그인</h2>
		<hr>
		
		
		<form action="loginPro.me" method="post">
			아이디: <input type="text" name="member_id"> <br>
			비밀번호: <input type="password" name="member_pass"> <br>
			
			<br>
			<input type="submit" value="로그인">
		</form>
		<br>
		<a href="insert.me">회원가입</a>		
			
	</body>
</html>