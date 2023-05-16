<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<%@page import="image_file.Image_FileDTO"%>
<%@page import="image_file.Image_FileDAO"%>
<%@page import="image_file.Banner_ImageDAO"%>
<%@page import="image_file.Banner_ImageDTO"%>
<%@page import="image_file.Gifticon_ImageDAO"%>
<%@page import="image_file.Gifticon_ImageDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<script src="./scripts/index.js"></script>
<link href="./css/index.css" rel="stylesheet">



<%
Image_FileDAO image_FileDAO = new Image_FileDAO();
List<Image_FileDTO> image_FileDTOs = image_FileDAO.selectAllImage_FileList();
Banner_ImageDAO banner_ImageDAO = new Banner_ImageDAO();
List<Banner_ImageDTO> banner_ImageDTOs = banner_ImageDAO.selectAllBanner_ImageList();
Gifticon_ImageDAO gifticon_ImageDAO = new Gifticon_ImageDAO();
List<Gifticon_ImageDTO> gifticon_ImageDTOs = gifticon_ImageDAO.selectAllGifticon_ImageList();
%>

<%--상단 이벤트 배너--%>
<div class="banner d-flex flex-row temp-link">
	<ul>
		<%
		for (int i = 0; i < 5; i++) {
		%>
		<li><img src="<%=banner_ImageDTOs.get(i).getFile_path()%>"
			class="evt-img"></li>
		<%
		}
		%>
	</ul>
</div>
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
	</div>
</div>
<br>
<br>

<div class="container d-flex justify-content-between">
	<div class="">
		<h4>베스킨라빈스로 디저트!</h4>
		<%
		for (int i = 0; i < 3; i++) {
		%>
		<div class="item">
			<img src="<%=gifticon_ImageDTOs.get(i).getFile_path()%>"
				class="item-img" alt="...">
			<h5 class="item-name"><%=gifticon_ImageDTOs.get(i).getFile_name()%></h5>
		</div>
		<%
		}
		%>
	</div>
	<div class="">
		<h4>오늘은 KFC와 함께!</h4>
		<%
		for (int i = 0; i < 3; i++) {
		%>
		<div class="item">
			<img src="<%=gifticon_ImageDTOs.get(i).getFile_path()%>"
				class="item-img" alt="...">
			<h5 class="item-name"><%=gifticon_ImageDTOs.get(i).getFile_name()%></h5>
		</div>
		<%
		}
		%>
	</div>
</div>








<%@ include file="./footer.jsp"%>