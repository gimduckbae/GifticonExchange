<%@page import="gifticon.GifticonDTO"%>
<%@page import="gifticon.GifticonDAO"%>
<%@page import="java.util.List"%>
<%@page import="image_file.Image_FileDTO"%>
<%@page import="image_file.Image_FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
String search = request.getParameter("search").trim();
GifticonDAO gifticonDAO = new GifticonDAO();
List<GifticonDTO> product_infos = gifticonDAO.searchProduct(search);

// 검색 결과가 없다면 전체상품 조회
if(product_infos.size() < 1) {
	product_infos = gifticonDAO.selectAllProduct();
}

%>
<%@ include file="./header.jsp"%>
<link rel="stylesheet" href="./css/product_list.css">

<%--인덱스 포문 --%>
<div class="container text-center">
	<br>
	<h3 class="br-text mt-4">판매 상품</h3>
	<h4 class="row row-cols-4 it-imgbox br-text mt-5">
		All(<%=product_infos.size()%>)
	</h4>

	<div class="row row-cols-4 it-imgbox">
		<%
		for (GifticonDTO product : product_infos) {
		%>
		<div class="col pd-box">
			<a href="./product_detail.jsp?no=<%=product.getRegister_no()%>"> <br> <img src="./images/<%=product.getCoupon_name()%>.png" class="it-img" alt="..."><br> <br>
				<p class="br-text fs-5"><%=product.getCoupon_name()%></p> <br>
				<p class="br-text fs-5"><%=product.getSale_price()%>원
				</p>
			</a>
			<button type="button" id="<%=product.getRegister_no()%>" class="btn btn-outline-dark pd-btn btn-red buy">장바구니</button>
			<button type="button" class="btn btn-outline-dark pd-btn btn-blue">구매하기</button>
			<br> <br>
		</div>
		<%
		}
		%>
	</div>
</div>
<br>
<br>

<script src="./scripts/cart.js"></script>
<%@ include file="./footer.jsp"%>