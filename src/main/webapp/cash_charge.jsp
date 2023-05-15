<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
</head>
<link rel="stylesheet" href="./css/cash_charge.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<div class="container mt-5">
	<h4 class="text-center">충전하기</h4>
	<div class="d-flex flex-column">
		<div class="input-group mb-5">
			<input type="number" min="10000" step="1000" id="amount" class="form-control border-bottom border-secondary" placeholder="충전할 금액을 입력해 주세요." style="border: none; border-radius: 0;">
		</div>
		<div class="d-flex flex-row mb-5">
			<button class="btn btn-light add-btn ms-1 me-1 border border-secondary" type="button" style="width: 50%;">+1만원</button>
			<button class="btn btn-light add-btn ms-1 me-1 border border-secondary" type="button" style="width: 50%;">+5만원</button>
			<button class="btn btn-light add-btn ms-1 me-1 border border-secondary" type="button" style="width: 50%;">+10만원</button>
			<button class="btn btn-light add-btn ms-1 me-1 border border-secondary" type="button" style="width: 50%;">+50만원</button>
		</div>
		<hr>
		<div class="payment-banner text-center">
			<div class="row">
				<img src="./images/pay/npay.webp" class="col payment-img rounded border border-secondary" alt="네이버페이"> <img src="./images/pay/kpay.webp" class="col payment-img rounded border border-secondary" alt="카카오페이"> <img src="./images/pay/tpay.webp" class="col payment-img rounded border border-secondary" alt="토스페이"> <img src="./images/pay/payco.webp" class="col payment-img rounded border border-secondary" alt="페이코"> <img src="./images/pay/apay.webp" class="col payment-img rounded border border-secondary" alt="알리페이">
			</div>
		</div>
		<hr>

		<div>
			<p class="fs-1">
				선택한 결제수단 : <span id="paymethod_text" class="fs-1">결제 수단을 선택해주세요.</span>
			</p>
		</div>
		<div class="d-grid gap-2 mt-3">
			<button id="payment_action" class="btn btn-primary" type="button">충전하기</button>
		</div>
	</div>
</div>
<script src="./scripts/cash_charge.js"></script>
<%@ include file="./footer.jsp"%>