<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>회원 정보 관리</h1>
		<hr>
		
		<%
		// p510 JSTL (JSP Standard Tag Library)
		// JSTL 다운로드 http://tomcat.apache.org -> menu, taglibs -> download -> jar 4개 다받기
		
		// p519
		// JSTL core	: if, for
		// JSTL fmt		: 날짜, 숫자 모양
		// JSTL xml, JSTL sql
		
		// 상단에서 라이브러리 선언 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" % >
		// <c:set> 변수 선언, <c:if>, <c:choose>, <c:when>, <c:otherwise>
		// <c:foreach>, <c:forTokens>, <c:redirect>
		
		%>
		<c:if test="${ empty sessionScope.login }">
			<c:redirect url="login.me" />
		</c:if>
		
		${sessionScope.name}님 반갑습니다.
		<a href="logout.me">로그아웃</a>
		
		<hr>
		<a href="write.bo">게시판 글쓰기</a>
		<a href="boardList.bo">게시판 글목록</a>
		<hr>
		<a href="fwrite.bo">파일 게시판 글쓰기</a>
		<a href="fboardList.bo">파일 게시판 글목록</a>
		<hr>
		<a href="reWrite.re">답글 게시판 글쓰기</a>
		<a href="reBoardList.re">답글 게시판 글목록</a>			
		<hr>
		<a href="todoList.to">나의 ToDoList</a>
		<hr>
		<a href="info.me">나의 정보 조회</a>
		<a href="update.me">나의 정보 수정</a>
		<a href="javascript:if(confirm('탈퇴 하시겠습니까?') == true){location.href = 'delete.me';}">회원 탈퇴</a>
		<br>
		
		<c:if test="${!empty sessionScope.login}">
			<c:if test="${sessionScope.login eq 'admin'}">
				<a href="list.me">회원 목록 조회</a>
			</c:if>
		</c:if>
</body>
</html>