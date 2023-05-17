<%@page import="gifticon.GifticonDTO"%>
<%@page import="gifticon.GifticonDAO"%>
<%@page import="java.util.List"%>
<%@page import="image_file.Image_FileDTO"%>
<%@page import="image_file.Image_FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
GifticonDAO gifticonDAO = new GifticonDAO();
List<GifticonDTO> product_infos = gifticonDAO.selectAllProduct();
%>
<%@ include file="./header.jsp"%>
<link rel="stylesheet" href="./css/product_list.css">



<div class="container h-auto buy-wrap text-center">
	<div class="buy-icon">
		<h2>판매상품</h2>
	</div>
	<hr>
	<div class="buy-img-wrap">

		<%
		for (GifticonDTO product : product_infos) {
		%>
		<div class="buy-list-wrap col">
			<img src="./images/<%=product.getCoupon_name()%>.png">
			<div class="product-name text-nowrap fw-semibold fs-6"><%=product.getCoupon_name()%></div>
			<div class="product-price fw-bold fs-5"><%=product.getSale_price()%>원
			</div>
		</div>
		<%
		}
		%>




	</div>
</div>
<div style="clear: both;"></div>


<%@ include file="./footer.jsp"%>