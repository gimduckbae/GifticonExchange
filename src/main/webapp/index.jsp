<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<%@page import="image_file.Image_FileDTO"%>
<%@page import="image_file.Image_FileDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<script src="./scripts/index.js"></script>
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

		<div class="item">
			<img src="./images/캐릭터 토이컵 (3종 중 택1).png" class="item-img" alt="...">
			<h5 class="item-name"></h5>
		</div>
		<div class="item">
			<img src="./images/하프갤론 아이스크림(배달가능).png" class="item-img" alt="...">
			<h5 class="item-name"></h5>
		</div>
		<div class="item">
			<img src="./images/해피버스데이(배달가능).png" class="item-img" alt="...">
			<h5 class="item-name"></h5>
		</div>

	</div>
	<div class="">
		<h4>오늘은 던킨과 함께!</h4>

		<div class="item">
			<img src="./images/마이멜로디 딸기 츄이스티 1ea+쿠로미 초코 츄이스티 1ea+아이스아메리카노(S) 1잔.png" class="item-img" alt="...">
			<h5 class="item-name"></h5>
		</div>
		<div class="item">
			<img src="./images/아메리카노(S) 1잔+먼치킨 10개팩.png" class="item-img" alt="...">
			<h5 class="item-name"></h5>
		</div>
		<div class="item">
			<img src="./images/아메리카노(S) 2잔+도너츠 6개팩.png" class="item-img" alt="...">
			<h5 class="item-name"></h5>
		</div>

	</div>
</div>








<%@ include file="./footer.jsp"%>