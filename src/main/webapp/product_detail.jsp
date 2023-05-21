<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="gifticon.GifticonDTO"%>
<%@page import="gifticon.GifticonDAO"%>
<%@page import="image_file.Image_FileDTO"%>
<%@page import="image_file.Image_FileDAO"%>
<%@page import="java.util.List"%>
<%@ include file="./header.jsp"%>
<%
request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
int no = Integer.parseInt(request.getParameter("no"));
GifticonDAO gifticonDAO = new GifticonDAO();
GifticonDTO gifticonDTO = gifticonDAO.selectProductByNo(no);
%>
<div class="container">
	<div class="item-view">
		<div class="row">
			<h2 class="it-info">
				상품명 : <span><%=gifticonDTO.getCoupon_name()%></span>
			</h2>
			<hr>
			<div class="col">
				<img src="./images/<%=gifticonDTO.getCoupon_name()%>.png" class="item-img" alt="...">
			</div>
			<div class="col">
				<div>
					<br> <br>
					<h2 class="it-info">
						가격 : <span><%=gifticonDTO.getSale_price_char()%></span>
					</h2>
				</div>
				<div class="row pr-detail">
					<div class="col">
						<p class="it-text fs-5">선물하기</p>
						<p class="it-text fs-5">교환처</p>
						<p class="it-text fs-5">쿠폰 이용안내</p>
					</div>
					<div class="col">
						<p class="fs-5">가능</p>
						<p class="fs-5"><%=gifticonDTO.getBrand_name()%></p>
						<p class="fs-5">구매 후 환불 불가</p>
					</div>
				</div>
				<br>
				<button type="button" data-regno="<%=gifticonDTO.getRegister_no()%>" id="<%=gifticonDTO.getRegister_no()%>" class="btn btn-purple btn-lg buy">구매하기</button>
				<button type="button" class="btn btn-blue btn-lg">판매하기</button>

			</div>
			<hr>
		</div>
		<div class="banner d-flex flex-row">
			<ul>
				<%
				//배너 사진 띄울 곳
				for (int i = 1; i < 4; i++) {
				%>
				<li class="evt2"><img src="./images/evtt<%=i%>.png" class="evt2-img"></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</div>
<br>
<br>
<%@ include file="./footer.jsp"%>



<script src="./scripts/product_detail.js"></script>
<script src="./scripts/cart.js"></script>
<link href="./css/product_detail.css" rel="stylesheet">