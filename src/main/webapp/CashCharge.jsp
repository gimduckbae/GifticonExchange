<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>iamport</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<style>
.payment-banner {
	width: 100%;
	height: 100%;
}

.payment-img {
	width: 10%;
	height: 10%;
	margin: 1em;
	padding: 0;
	transition: all 0.1s linear;
}

.payment-img:hover {
	transform: scale(1.1);
}
</style>
</head>


<body>
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
</body>


<script>
	$(function() {
		const { IMP } = window;
		IMP.init('imp00142432');		

		
		$("#amount").on("keyup", "input[numberOnly]", function() {
				$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
			});
		
		/** 결제수단 클릭시 텍스트 변경 */
		$("img").click(function() {
			$("#paymethod_text").text($(this).attr("alt"));
		});
		
		
		/** 버튼으로 충전금액 늘리기 */
		$('.add-btn').click(function() {
		    var amountInput = $('#amount');
		    var currentValue = parseInt(amountInput.val()) || 0;
		    var plusValue = parseInt($(this).text().replace('+', '').replace('만원', '')) || 0;
		    amountInput.val(currentValue + (plusValue*10000));
		  });
		
		$("#payment_action").click(payment);
		
		function payment() {
			let pg_;
			let pay_method_;
			let buyer_name_;
			let buyer_tel_;
			let amount_ = $("#amount").val();
			
			IMP.request_pay({
			    pg : 'kakaopay.{TC0ONETIME}',
			    pay_method : 'kakaopay',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : amount_,
			    buyer_email : '',
			    buyer_name : '김수호',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '',
			    buyer_postcode : ''
			}, function request_pay(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;W
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
	
			    alert(msg);
			});
		}
		
			
	});
</script>

</html>