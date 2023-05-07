<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
	String id = request.getParameter("id");
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO memberDTO = memberDAO.selectMemberById(id);

	boolean useAble = memberDTO == null;

	if (useAble) {
		out.println("true");
	} else {
		out.println("false");
	}
	%>
</body>
</html>