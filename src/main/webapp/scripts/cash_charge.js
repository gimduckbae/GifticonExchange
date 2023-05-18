$(function() {
	const { IMP } = window;
	IMP.init('imp00142432');


	$("#amount").on("keyup", "input[numberOnly]", function() {
		$(this).val($(this).val().replace(/[^0-9]/gi, ""));
	});

	/** 결제수단 클릭시 텍스트 변경 */
	$("img").click(function() {
		const paymethod = $(this).attr("alt");
		$("#paymethod_text").text(paymethod);
	});


	/** 버튼으로 충전금액 늘리기 */
	$('.add-btn').click(function() {
		var amountInput = $('#amount');
		var currentValue = parseInt(amountInput.val()) || 0;
		var plusValue = parseInt($(this).text().replace('+', '').replace('만원', '')) || 0;
		amountInput.val(currentValue + (plusValue * 10000));
	});

	$("#payment_action").click(function() {
		const check_input = $("#amount").val() || 0;
		if (check_input <= 0) {
			alert("충전금액을 올바르게 입력해주세요.");
			return;
		}


		const current_medthod = $("#paymethod_text").text();
		if (current_medthod == "네이버페이") {

		}
		if (current_medthod == "카카오페이") {
			payment();
		}
		if (current_medthod == "토스페이") {

		}
		if (current_medthod == "페이코") {

		}
		if (current_medthod == "알리페이") {

		}


	});

	function payment() {

		let amount_ = $("#amount").val();

		IMP.request_pay({
			pg: 'kakaopay.{TC0ONETIME}',
			pay_method: 'kakaopay',
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: '이지콘 포인트충전',
			amount: amount_,
			buyer_email: '',
			buyer_name: '',
			buyer_tel: '',
			buyer_addr: '',
			buyer_postcode: ''
		}, function request_pay(rsp) {
			if (rsp.success) {
				//var msg = '결제가 완료되었습니다.';
				//msg += '고유ID : ' + rsp.imp_uid;
				//msg += '상점 거래ID : ' + rsp.merchant_uid;
				//msg += '결제 금액 : ' + rsp.paid_amount;
				//msg += '카드 승인번호 : ' + rsp.apply_num;
				location.href = "./actions/cash_charge_action.jsp?amount=" + rsp.paid_amount;
			} else {
				var msg = '오류가 발생했습니다. 다시 시도해주세요.';
				//msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}

		});
	}


});