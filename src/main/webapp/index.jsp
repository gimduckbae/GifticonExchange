<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<%@page import="image_file.Image_FileDTO"%>
<%@page import="image_file.Image_FileDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<link href="./css/index.css" rel="stylesheet">



<%
Image_FileDAO image_FileDAO = new Image_FileDAO();
List<Image_FileDTO> banners = image_FileDAO.selectAllBannerImage();
List<Image_FileDTO> product_images = image_FileDAO.selectAllProductImage();
%>

<%--상단 이벤트 배너--%>
<div class="banner d-flex flex-row temp-link">
	<ul>
		<%
		for (Image_FileDTO item : banners) {
		%>
		<li><img src="./images/<%=item.getFile_name()%>" class="evt-img"></li>
		<%
		}
		%>
	</ul>
</div>
<br>
<h3 class="br-text">HOT BRAND</h3>
<br>

<div class="container text-center">
	<div class="row">
		<div class="col">
			<img src="./img/logo1.png" class="rounded logo-img" alt="...">
		</div>
		<div class="col">
			<img src="./img/logo2.png" class="rounded logo-img" alt="...">
		</div>
		<div class="col">
			<img src="./img/logo3.png" class="rounded logo-img" alt="...">
		</div>
		<div class="col">
			<img src="./img/logo4.png" class="rounded logo-img" alt="...">
		</div>
		<div class="col">
			<img src="./img/logo5.png" class="rounded logo-img" alt="...">
		</div>
	</div>
</div>
<br>
<br>

<script src="./scripts/index.js"></script>


<%@ include file="./footer.jsp"%>