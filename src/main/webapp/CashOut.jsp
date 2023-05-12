<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>iamport</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
</head>


<body>

<form action="CashOutMain.jsp" method="post">
				<div class="form-group">
					<label for="wAccountNumber">출금계좌번호:</label> 
					<input type="text" class="form-control" placeholder="출금계좌번호"  name="account">
				</div>
				<div class="form-group">
					<label for="wAccountPassword">출금계좌비밀번호:</label> 
					<input type="password" class="form-control" placeholder="출금계좌비밀번호" id="wAccountPassword" name="pw">
				</div>
			</form>
         <form>
	<div class="container mt-5">
		<h4 class="text-center" >출금하기</h4>
		<div class="d-flex flex-column">
			<div class="input-group mb-3">
				<input type="number" min="10000" step="1000" id="amount"
					class="form-control border-bottom border-secondary"
					placeholder="충전할 금액을 입력해 주세요."
					style="border: none; border-radius: 0;">
			</div>
			<div class="d-flex flex-row mb-3">
				<button class="btn btn-light ms-1 me-1 border border-secondary"
					id="amount" onclick="plus1()" type="button" style="width: 50%;">+1만원</button>
				<button class="btn btn-light ms-1 me-1 border border-secondary"
					type="button" id="amount" onclick="plus5()" style="width: 50%;">+5만원</button>
				<button class="btn btn-light ms-1 me-1 border border-secondary"
					type="button" id="amount" onclick="plus10()" style="width: 50%;">+10만원</button>
				<button class="btn btn-light ms-1 me-1 border border-secondary"
					type="button" id="amount" onclick="plus50()" style="width: 50%;">+50만원</button>
			</div>
			<div class="payment-banner"
				style="background-image: url('./images/pay/naverpay.webp');"></div>
			<div class="payment-banner"
				style="background-image: url('./images/pay/kakaopay.webp');"></div>
			<div class="payment-banner"
				style="background-image: url('./images/pay/tosspay.webp');"></div>
			<div class="payment-banner"
				style="background-image: url('./images/pay/payco.webp');"></div>
			<div class="payment-banner"
				style="background-image: url('./images/pay/alipay.webp');"></div>
			<div class="d-grid gap-2 mt-3">
				<button class="btn btn-primary" type="submit">출금하기</button>
			</div>
		</div>
	</div>
	</form>
	<h2>출금</h2>
	<tr>
		<td>출금수단 :</td>
		<td><button class="payment" type="button">체크카드</button></td>
		<td><button class="payment" type="button">계좌이체</button></td>
		<td><button class="payment" type="button">테스트용</button></td>
	</tr>
	<tr>은행명
		<td><select>
		 </select> </td>
	</tr>
	<br>
	<br>




	<script>
		let count = 0;

		function plus1() {
			count += 10000;
			document.getElementById('amount').value = count;
		}

		function plus5() {
			count += 50000;
			document.getElementById('amount').value = count;
		}

		function plus10() {
			count += 100000;
			document.getElementById('amount').value = count;
		}

		function plus50() {
			count += 500000;
			document.getElementById('amount').value = count;
		}
	</script>
</body>
</html>







