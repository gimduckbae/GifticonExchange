<%@page import="java.util.List"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="sample.SampleDao"%>
<%@page import="sample.SampleDto"%>
<%@page import="java.sql.*"%>

<%
SampleDao sampleDao = new SampleDao();
List<SampleDto> items = sampleDao.selectAllProduct();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="./Sale_CSS/sale.css">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</head>
<body>
		<%
		int arrsize = items.size() / 1;
		out.print("<script>alert("+ arrsize +")</script>");
		for(int i=0; i<arrsize; i+=3) {
		%>
	<div class="card-group flex-row">
		
		<div class="card">
			<img src = "<%=items.get(i).getImg() %>" class="card-img-top images" alt="...">
			<div class="card-body">
				<h5 class="card-title">상품명 : <%=items.get(i).getBrandname() %></h5>
				<h5>가격 : <%=items.get(i).getSaleprice() %>원</h5>
				<p class="card-text">This is a wider card with supporting text
					below as a natural lead-in to additional content. This content is a
					little bit longer.</p>
			</div>
		</div>
		<div class="card">
			<img src = "<%=items.get(i+1).getImg() %>" class="card-img-top images" alt="...">
			<div class="card-body">
				<h5 class="card-title">상품명 : <%=items.get(i+1).getBrandname() %></h5>
				<h5>가격 : <%=items.get(i+1).getSaleprice() %>원</h5>
				<p class="card-text">This is a wider card with supporting text
					below as a natural lead-in to additional content. This content is a
					little bit longer.</p>
			</div>
		</div>
		<div class="card">
			<img src = "<%=items.get(i+2).getImg() %>" class="card-img-top images" alt="...">
			<div class="card-body">
				<h5 class="card-title">상품명 : <%=items.get(i+2).getBrandname() %></h5>
				<h5>가격 : <%=items.get(i+2).getSaleprice() %>원</h5>
				<p class="card-text">This is a wider card with supporting text
					below as a natural lead-in to additional content. This content is a
					little bit longer.</p>
			</div>
		</div>
	</div>
		<% } %>
		
		
		
		
		
</body>
</html>