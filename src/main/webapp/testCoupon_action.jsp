<%@page import="gifticon.GifticonDto"%>
<%@page import="gifticon.api.HappyOrder"%>
<%@page import="gifticon.GifticonDao"%>
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
	String couponNumber = request.getParameter("num");

	GifticonDao gifticonDao = new GifticonDao();
	String res = HappyOrder.getResponseByGifticonNumber(couponNumber);
	GifticonDto gifticonDto = gifticonDao.getGifticonStatusByResponse(res);
	%>
	<script>
		const msg = "<%=gifticonDto.toString()%>";
		alert(msg);
		location.href=history.back();
	</script>
	
</body>
</html>