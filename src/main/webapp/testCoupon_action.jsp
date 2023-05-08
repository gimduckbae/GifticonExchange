<%@page import="gifticon.GifticonDTO"%>
<%@page import="gifticon.api.HappyOrder"%>
<%@page import="gifticon.GifticonDAO"%>
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

	GifticonDAO gifticonDao = new GifticonDAO();
	String res = HappyOrder.getResponseByGifticonNumber(couponNumber);
	GifticonDTO gifticonDto = gifticonDao.getGifticonStatusByResponse(res);
	%>
	<script>
		const msg = `<%=gifticonDto.toString()%>
		`;
		alert(msg);
		location.href = history.back();
	</script>

</body>
</html>