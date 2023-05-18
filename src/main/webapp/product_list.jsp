<%@page import="gifticon.GifticonDTO"%>
<%@page import="gifticon.GifticonDAO"%>
<%@page import="java.util.List"%>
<%@page import="image_file.Image_FileDTO"%>
<%@page import="image_file.Image_FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
GifticonDAO gifticonDAO = new GifticonDAO();
List<GifticonDTO> product_infos = gifticonDAO.selectAllProduct();
%>
<%@ include file="./header.jsp"%>
<link rel="stylesheet" href="./css/product_list.css">

<%--인덱스 포문 --%>
<div class="container text-center">
	<br>
	<h3 class="br-text mt-4">판매 상품</h3>
	<h4 class="row row-cols-4 it-imgbox br-text mt-5">All(12)</h4>
	
	<div class="row row-cols-4 it-imgbox">
		<%
		for (int i = 0; i < 13; i++) {
		%>
		<div class="col pd-box"><br>
			<img src="./images/MSGR 블라스트.png" class="it-img" alt="..."><br>
			<br>
			<p class="br-text fs-5">MSGR 블라스트</p>
			<br>
			<p class="br-text fs-5">5,000원</p>
			<button type="button" class="btn btn-outline-dark pd-btn btn-red">장바구니</button>
			<button type="button" class="btn btn-outline-dark pd-btn btn-blue">구매하기</button>
			<br> <br>
		</div>
		<%
		}
		%>
	</div>
</div><br><br>


<%@ include file="./footer.jsp"%>