<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>iamport</title>
<!-- jQuery -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<button class="click">click</button>
</body>

<script>

		const { IMP } = window;
		IMP.init('imp54032413');
			
		IMP.request_pay({
		    pg : 'kakaopay.{TC0ONETIME}',
		    pay_method : 'kakaopay',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 14000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '김수호',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
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
	</script>

</html>