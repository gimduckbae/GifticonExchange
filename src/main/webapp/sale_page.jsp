<%@page import="event.EventDTO"%>
<%@page import="event.EventDAO"%>
<%@page import="item.ItemDTO"%>
<%@page import="item.ItemDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
EventDAO eventDAO = new EventDAO();
List<EventDTO> events = eventDAO.selectAllEvents();
ItemDAO itemDAO = new ItemDAO();
List<ItemDTO> items = itemDAO.selectAllItems();
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
<link href="./Sale_CSS/sale.css?after" rel="stylesheet" type="text/css">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">


<body>
	<%--상단 이벤트 배너--%>
	<div class="banner d-flex flex-row">
		<ul>
			<%
			for (int i = 0; i < 5; i++) {
			%>
			<li><img src="<%=events.get(i).getEvt_img()%>" class="evt-img"></li>
			<%
			}
			%>
		</ul>
	</div>
	<div class="container">

		<h3 class="br-text">HOT BRAND</h3>
		<br>

		<div class="container text-center">
			<div class="row">
				<div class="col">
					<img src="./img/logo1.png" class="rounded" alt="...">
				</div>
				<div class="col">
					<img src="./img/logo2.png" class="rounded" alt="...">
				</div>
				<div class="col">
					<img src="./img/logo3.png" class="rounded" alt="...">
				</div>
				<div class="col">
					<img src="./img/logo4.png" class="rounded" alt="...">
				</div>
				<div class="col">
					<img src="./img/logo5.png" class="rounded" alt="...">
				</div>
				<div class="col">
					<img src="./img/logo6.png" class="rounded" alt="...">
				</div>
			</div>
		</div>
		<br>


		<div class="card-group flex-row">
		<%
		for (int i = 0; i < 18; i++) {
		%>

			<div class="card">
				<img src="<%=items.get(i).getIt_img()%>" class="card-img-top images"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">
						상품명 :
						<%=items.get(i).getIt_name()%></h5>
					<h5>
						가격 :
						<%=items.get(i).getIt_price()%>원
					</h5>
				</div>
			</div>

			<%
			}
			%>
		</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"><%@include file="./Sale_JS/sale.js"%></script>
</html>