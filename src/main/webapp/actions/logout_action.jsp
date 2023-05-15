<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>


<%
    session.invalidate();

    response.sendRedirect("../login_status.jsp");
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>