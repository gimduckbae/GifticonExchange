<%@page import="member.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.CartDAO"%>
<%@page import="gifticon.GifticonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<%
CartDAO cartDAO = new CartDAO();
List<CartDTO> cartList = cartDAO.selectAllCartByLogin_Id(login_id);
%>
<link rel="stylesheet" href="./css/cart.css">


<div class="container-fluid">
	<table class="table align-middle">
		<thead>
			<tr>
				<th scope="col"><input type="checkbox" class="form-check-input check-all">전체선택</th>
				<th scope="col">상품명</th>
				<th scope="col">판매가</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (CartDTO item : cartList) {
			%>
			<tr>
				<th scope="row"><input type="checkbox" class="form-check-input" id="<%=item.getRegister_no()%>" name="checks" data-price="<%=item.getGifticonDTO().getSale_price()%>"></th>
				<td>
					<img src="./images/<%=item.getGifticonDTO().getCoupon_name()%>.png" class="img-fluid img-thumbnail me-3" style="max-width: 10%;"> <span class="fs-5 fw-bold"><%=item.getGifticonDTO().getCoupon_name()%></span>
				</td>
				<td class="fs-6 fw-semibold p-price"><%=item.getGifticonDTO().getSale_price_char()%>콘
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<span id="total_price" class="fs-5 fw-bold">0콘</span>
	<button type="button" id="del-btn" class="btn btn-outline-dark">선택상품 삭제</button>

	<button type="button" id="buy-btn" class="btn btn-outline-dark">선택상품 구매</button>
</div>




<%--
<div class="cart-wrap">
	<div class="cart-title">
		<h3>장바구니</h3>
		<hr>
	</div>
	<div class="cart-main">
		<table class="table align-middle">
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" class="check-all">전체선택</th>
					<th scope="col">상품명</th>
					<th scope="col">판매가</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (CartDTO item : cartList) {
				%>
				<tr>
					<th scope="row"><input type="checkbox" id="<%=item.getRegister_no()%>" name="checks" data-price="<%=item.getGifticonDTO().getSale_price()%>"></th>
					<td>
						<img src="./images/<%=item.getGifticonDTO().getCoupon_name()%>.png" class="img-fluid img-thumbnail me-3" style="max-width: 10%;"> <span class="fs-5 fw-bold"><%=item.getGifticonDTO().getCoupon_name()%></span>
					</td>
					<td class="fs-6 fw-semibold p-price"><%=item.getGifticonDTO().getSale_price_char()%>콘
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<hr>
	<div class="total-count">

		<table>
			<tr>
				<th scope="col">합계</th>
				<td>125423원</td>
			</tr>
		</table>
	</div>
	<hr style="margin-top: 60px;">


	<div class="cart-btn-wrap">
		<button type="button" id="del-btn" class="btn btn-outline-dark btn-sm">선택상품 삭제</button>

		<button type="button" id="buy-btn" class="btn btn-outline-dark btn-sm">선택상품 구매하기</button>

	</div>

--%>





</div>
<script src="./scripts/cart.js"></script>
<%@ include file="./footer.jsp"%>
