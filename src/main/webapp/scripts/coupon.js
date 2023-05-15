$(function() {
	var data;

	$("#reg").click(insertCoupon); // 등록버튼

	$("#cancel").click(function() { // 취소버튼
		if (confirm("등록된 정보가 사라집니다.")) {
			$("#couponNo").val("");
			$("#brandName").val("");
			$("#virtualCouponName").val("");
			$("#salePrice").val("");
			$("#validityStartDate").val("");
			$("#validityEndDate").val("");
		}
	});

	$("#button").click(function() { // 조회버튼
		data = checkCoupon();
		$("#couponNo").val(data.coupon_number);
		$("#brandName").val(data.brand_name);
		$("#virtualCouponName").val(data.coupon_name);
		$("#salePrice").val(data.origin_price);
		$("#validityStartDate").val(data.start_date);
		$("#validityEndDate").val(data.end_date);
	});

	// 조회한 기프티콘 결과값을 비활성화 된 input그룹에 자동입력 시켜서 등록하자
	function checkCoupon() {
		let couponNumber = $("#input").val().replace(/\s/gi, "");
		if (couponNumber == "") {
			return;
		}
		var result;

		$.ajax({
			async: true, // 비동기 = true
			type: 'GET', // GET 타입
			data: { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
				"num": couponNumber
			},
			url: "./actions/checkCoupon.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				//console.log(data);
				result = data;
				if (data.status === true) {
					if (confirm("사용 가능한 쿠폰입니다. 판매 하시겠습니까?")) {
						$("#couponNo").val(data.coupon_number);
						$("#brandName").val(data.brand_name);
						$("#virtualCouponName").val(
							data.coupon_name);
						$("#salePrice").val(data.origin_price);
						$("#validityStartDate").val(
							data.start_date);
						$("#validityEndDate").val(
							data.end_date);
					}
				} else {
					alert("등록 불가능한 쿠폰 입니다.");
				}
			},
			error: function() {
				alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
		return result;
	}

	function insertCoupon() {
		let couponNumber = $("#input").val().replace(/\s/gi, "");
		if (couponNumber == "") {
			return;
		}
		var result;

		$.ajax({
			async: true, // 비동기 = true
			type: 'GET', // GET 타입
			data: { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
				"num": couponNumber
			},
			url: "./actions/insertCoupon.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				result = data;
				//console.log(data);

				if (data.result === true) {
					alert("판매등록이 정상 처리되었습니다.");
				} else {
					alert("판매등록에 실패 했습니다.");
				}
			},
			error: function() {
				alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
		location.href = "./coupon.jsp";
		return result;
	}
});