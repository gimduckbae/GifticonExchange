<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate(); //logout 처리 끝. 세션 정리
		
		response.sendRedirect("login_status.jsp"); //페이지 이동
	%>
	
	
	
	1.로그아웃 버튼을 누른다.
	2번. 버튼을 누르면 세션값이 리무브 
	3.로그인페이지로이동
</body>
</html>