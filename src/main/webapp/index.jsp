<%@page import="dbconn.DBConnectionManager"%>
<%@page import="sample.SampleDto"%>
<%@page import="sample.SampleDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>index 페이지</h1>
	<%
		SampleDao dao = new SampleDao();
		SampleDto dto = dao.selectMemberByNo(1001);
		out.println(dto.toString());
	%>

</body>
</html>