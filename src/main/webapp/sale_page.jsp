<%@page import="event.EventDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="sample.SampleDao"%>
<%@page import="sample.SampleDto"%>
<%@page import="event.EventDAO"%>
<%@page import="event.EventDTO"%>
<%@page import="java.sql.*"%>

<%
SampleDao sampleDao = new SampleDao();
List<SampleDto> items = sampleDao.selectAllProduct();
EventDAO eventDAO = new EventDAO();
List<EventDTO> events = eventDAO.selectAllEvents();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="./Sale_CSS/sale.css">
<link rel="stylesheet" href="./Sale_CSS/autoslide.css">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="./Sale_JS/sale.js"></script>
</head>




<body>
	<div class="container">
	
			<%
			for (int i = 0; i < 5; i++) {
			%>
			<div class="autoslide autoslide_wrap">
				<div class="autoslide_item item1">
					<div class="card house">
						<img src="<%=events.get(i).getEvt_img()%>" alt="...">
					</div>
				</div>
			</div>
			<%
			}
			%>

		<%
		int arrsize = items.size() / 1;
		for (int i = 0; i < arrsize; i += 3) {
		%>
		<div class="card-group flex-row" style="width: 70%; margin: 0 auto;">

			<div class="card">
				<img src="<%=items.get(i).getImg()%>" class="card-img-top images"
					alt="...">
				<div class="card-body">
					<h6 class="card-title">
						상품명 :
						<%=items.get(i).getBrandname()%></h6>
					<h6>
						가격 :
						<%=items.get(i).getSaleprice()%>원
					</h6>
				</div>
			</div>
			<div class="card">
				<img src="<%=items.get(i + 1).getImg()%>"
					class="card-img-top images" alt="...">
				<div class="card-body">
					<h6 class="card-title">
						상품명 :
						<%=items.get(i + 1).getBrandname()%></h6>
					<h6>
						가격 :
						<%=items.get(i + 1).getSaleprice()%>원
					</h6>
				</div>
			</div>
			<div class="card">
				<img src="<%=items.get(i + 2).getImg()%>"
					class="card-img-top images" alt="...">
				<div class="card-body">
					<h6 class="card-title">
						상품명 :
						<%=items.get(i + 2).getBrandname()%></h6>
					<h6>
						가격 :
						<%=items.get(i + 2).getSaleprice()%>원
					</h6>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>