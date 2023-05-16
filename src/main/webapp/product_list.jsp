<%@page import="java.util.List"%>
<%@page import="image_file.Image_FileDTO"%>
<%@page import="image_file.Image_FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Image_FileDAO image_FileDAO = new Image_FileDAO();
List<Image_FileDTO> products = image_FileDAO.selectAllProductImage();
%>
<%@ include file="./header.jsp"%>
<link rel="stylesheet" href="./css/product_list.css">



<div class="container h-auto buy-wrap">
	<div class="buy-icon">
		<h2>판매상품</h2>
	</div>
	<hr>
	<div class="buy-img-wrap">

		<%
		for (Image_FileDTO item : products) {
		%>
		<div class="buy-list-wrap">
			<img src="./images/<%=item.getFile_name()%>">
			<div class="product-name text-nowrap fw-semibold fs-6"><%=item.getOrg_name()%></div>
			<div class="product-price fw-bold fs-5">5000원</div>
		</div>
		<%
		}
		%>




	</div>
</div>
<div style="clear: both;"></div>


<%@ include file="./footer.jsp"%>