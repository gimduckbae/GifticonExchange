<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<link rel="stylesheet" href="./css/cart.css">
<div class="cart-wrap">
	<div class="cart-title">
		<h3>장바구니</h3>
		<hr>
	</div>
	<div class="cart-main">
		<table class="table">
			<thead>
				<tr>
					<th scope="col"><input type="checkbox"> 선택</th>
					<th scope="col">상품명</th>
					<th scope="col">판매가</th>


				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row"><input type="checkbox"></th>
					<td><img src="#"></td>
					<td>20,000</td>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox"></th>
					<td><img src="#">Jacob</td>
					<td>20,000</td>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox"></th>
					<td><img src="#">Larry the Bird</td>
					<td>20,000</td>

				</tr>
			</tbody>
		</table>
	</div>
	<hr>
	<div class="total-count">

		<table>
			<tr>
				<th scope="col">합계</th>
			</tr>
		</table>
	</div>
	<hr style="margin-top: 60px;">


	<div class="cart-btn-wrap">
		<button type="button" class="btn btn-outline-dark btn-sm">삭제</button>

		<button type="button" class="btn btn-outline-dark btn-sm">선택상품 구매하기</button>
		<button type="button" class="btn btn-outline-dark btn-sm">전체상품 구매하기</button>
	</div>
</div>

<%@ include file="./footer.jsp"%>
