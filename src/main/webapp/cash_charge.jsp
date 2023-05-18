<%@page import="member.PointDTO"%>
<%@page import="member.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<%
if (login_id == null) {
	out.println("<script>alert('로그인이 필요한 기능입니다.');</script>");
	response.sendRedirect("./login.jsp"); //페이지 이동
}
PointDAO pointDAO = new PointDAO();
PointDTO pointDTO = pointDAO.selectPointById(login_id);
%>

<link rel="stylesheet" href="./css/cash_charge.css">
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<div class="container mt-5" style="width: 80%;">
	<h3 class="main-title">충전하기</h3>
	<hr class="mt-3">
	<div class="mt-5">
		<img src="./img/cash-coin.svg" alt="" class="cash-icon"> <span
			class="fs-4 cash-ch"> 보유 콘 : <%=pointDTO.getPoint_char()%>콘
		</span><br> <br> <img src="./img/step1.png" alt=""> <span
			class="fs-4 main-title"> 결제금액 입력</span>
	</div>
	<br> <br>
	<div class="d-flex flex-column">

		<div class="input-group mb-5">
			<input type="number" min="10000" step="1000" id="amount"
				class="form-control border-bottom border-secondary cash"
				placeholder="충전금액  (10,000원 이상 충전 가능)"
				style="border: none; border-radius: 0;">
		</div>
		<div class="d-flex flex-row mb-5">

			<button
				class="btn btn-light add-btn ms-1 me-1 border border-secondary"
				type="button" style="width: 50%;">+1만원</button>
			<button
				class="btn btn-light add-btn ms-1 me-1 border border-secondary"
				type="button" style="width: 50%;">+5만원</button>
			<button
				class="btn btn-light add-btn ms-1 me-1 border border-secondary"
				type="button" style="width: 50%;">+10만원</button>
			<button
				class="btn btn-light add-btn ms-1 me-1 border border-secondary"
				type="button" style="width: 50%;">+50만원</button>
		</div>
		<div>
			<img src="./img/step2.png" alt=""> <span
				class="fs-4 main-title"> 결제수단 선택</span>
		</div>
		<br>

		<hr>
		<div class="payment-banner text-center">
			<div class="row">
				<img src="./images/pay/npay.webp"
					class="col payment-img rounded-5 border border-light" alt="네이버페이">
				<img src="./images/pay/kpay.webp"
					class="col payment-img rounded-5 border border-light" alt="카카오페이">
				<img src="./images/pay/tpay.webp"
					class="col payment-img rounded-5 border border-light" alt="토스페이">
				<img src="./images/pay/payco.webp"
					class="col payment-img rounded-5 border border-light" alt="페이코">
				<img src="./images/pay/spay.webp"
					class="col payment-img rounded-5 border border-light" alt="삼성페이">
			</div>
		</div>
		<div class="mt-3">
			<span id="paymethod_text" class="fs-6 main-title"> 결제수단을
				선택해주세요.</span>
		</div>
		<hr>
		<br>
		<div class="text-center">
			<button id="payment_action" class="btn btn-lg add-cash" type="button">충전하기</button>
		</div>
	</div>
</div>
<script src="./scripts/cash_charge.js"></script>
<%@ include file="./footer.jsp"%>