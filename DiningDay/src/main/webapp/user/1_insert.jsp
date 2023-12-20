<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member/insert.jsp</title>
</head>
	<body>
		<h2>회원가입</h2>
		<hr>
		
		<form action="insertPro.me" method="post">
			아이디: <input type="text" name="user_id"> <br>
			비밀번호: <input type="password" name="user_pass"> <br>
			이름: <input type="text" name="user_name"> <br>
			
			<br>
			<input type="submit" value="회원가입">
		</form>
		<br>
		<a href="login.me">로그인 화면으로..</a>
		
	</body>
</html>