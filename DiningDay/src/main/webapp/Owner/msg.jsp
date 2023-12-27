<!-- 12/26/14:10_강현아 + 로그인 실패용 msg.jsp 추가 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주 로그인</title>
</head>
<body>
<script type="text/javascript">
	alert("아이디 혹은 비밀번호가 틀렸습니다.");
	// 자바스크립트 하이퍼링크
//	location.href="login.jsp";
	// 방금 전에 방문한 페이지로 이동(되돌아 감, 뒤로 이동)
	history.back();
</script>
</body>
</html>