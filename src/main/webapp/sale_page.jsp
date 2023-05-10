<%@page import="brand.BrandDAO"%>
<%@page import="brand.BrandDTO"%>
<%@page import="event.EventDTO"%>
<%@page import="event.EventDAO"%>
<%@page import="sample.SampleDto"%>
<%@page import="java.util.List"%>
<%@page import="sample.SampleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
SampleDao sampleDao = new SampleDao();
List<SampleDto> items = sampleDao.selectAllProduct();
EventDAO eventDAO = new EventDAO();
List<EventDTO> events = eventDAO.selectAllEvents();
BrandDAO brandDAO = new BrandDAO();
List<BrandDTO> brands = brandDAO.selectAllBrands();
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
<body>
	<div class="container" style="text-align: center;">
		<div class="banner d-flex flex-row">
			<ul>
				<%
				for (int i = 0; i < 5; i++) {
				%>
				<li><img src="<%=events.get(i).getEvt_img()%>"></li>
				<%
				}
				%>
			</ul>
		</div>
		
		<h3 style="margin-top: 100px;">BRAND</h3>

		<div class="brand-logo">
			<div class="brand-logoList">
				<%
				for (int i = 0; i < 5; i++) {
				%>
				<img src="<%=brands.get(i).getBr_img()%>" alt="..." class="brand-img">
				<%
				}
				%>
			</div>
		</div>



		<div class="card-box" style="margin-top: 100px;">
			<%
			int arrsize = items.size() / 1;
			for (int i = 0; i < arrsize; i += 3) {
			%>
			<div class="card-group" style="margin: 0 auto;">

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
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"><%@include file="./Sale_JS/sale.js"%></script>
</html>