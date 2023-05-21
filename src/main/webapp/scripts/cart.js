$(function() {

	/** 로그인 체크용 함수. 비로그인 상태면 뒤로가기 실행 */
	function loginCheck() {
		var login_status;
		$.ajax({
			async: false, // 비동기 true
			type: 'GET', // GET 타입
			url: "./actions/loginCheck.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				if (data.login === 'false') { // 로그인 상태
					login_status = false;
					alert("로그인이 필요한 기능입니다.");
					location.href = 'login.jsp';
				}
			}
		});
		return login_status;
	}

	// 장바구니 버튼 클릭
	$(".cart").click(function() {
		if (loginCheck() != false) {
			const register_no = $(this).data("regno");
			addCart(register_no);
		}
	});

	// 구매하기 버튼 클릭
	$(".buy").click(function() {
		if (loginCheck() != false) {
			const register_no = $(this).data("regno");
			addCart(register_no);
			if (confirm('구매 페이지로 이동하시겠습니까?')) {
				location.href = './cart.jsp';
			}
		}
	});



	/** 장바구니에 상품 추가 비동기처리 */
	function addCart(register_no) {

		$.ajax({
			async: false, // 비동기 true
			type: 'GET', // GET 타입
			data: { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
				"register_no": register_no,
				"type": "add"
			},
			url: "./actions/cart_action.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				//console.log(data.count);
				$("#cart-count").text(data.count);
				if (data.result === 'true') { // 장바구니 추가 처리성공

				}
			}
		})
	}

	// 장바구니 금액 계산
	$("input[name='checks']").click(sumPrice);

	// 체크된 항목 금액 합계
	function sumPrice() {
		var sum = 0;
		$("input[name='checks']:checked").each(function() {
			sum += $(this).data("price");
		});

		$("#total_price").data("price", sum);
		$("#total_price").text(addCommasToNumber(sum) + "콘");
	}

	// 숫자 3자리마다 컴마찍기
	function addCommasToNumber(number) {
		var parts = number.toString().split(".");
		parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return parts.join(".");
	}



	// 장바구니 체크 삭제
	$("#del-btn").click(function() {
		var checkList = [];
		$("input[name='checks']:checked").each(function() {
			checkList.push($(this).attr("id"));
		});
		//console.log(checkList);
		delCart(checkList);
	});


	// 장바구니 체크 구매
	$("#buy-btn").click(function() {
		var checkList = [];
		$("input[name='checks']:checked").each(function() {
			checkList.push($(this).attr("id"));
		});
		//console.log(checkList);
		buyCart(checkList);
	});




	// 선택한 상품을 배열로 넘겨서 한번에 장바구니에서 삭제
	function delCart(register_no) {

		$.ajax({
			async: false, // 비동기 true
			type: 'GET', // GET 타입
			data: { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
				"register_no": JSON.stringify(register_no),
				"type": "del"
			},
			url: "./actions/cart_action.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				if (data.result === 'true') { // 사용가능한 아이디면 가입버튼 활성화
					location.href = "./cart.jsp"
				}
			},
			error: function() {
				//alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
	}

	// 장바구니 선택 상품 한번에 구매 처리
	function buyCart(register_no) {

		$.ajax({
			async: false,
			type: 'GET',
			data: {
				"register_no": JSON.stringify(register_no),
				"type": "buy"
			},
			url: "./actions/cart_action.jsp",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				if (data.result === 'true') {
					alert('구매가 완료되었습니다.');
					location.href = "./myPage.jsp"
				}
				if (data.point === "low") {
					if (confirm("보유하고 있는 이지콘이 부족합니다.\n충전 페이지로 이동하시겠습니까?")) {
						location.href = "./cash_charge.jsp";
					}
				}
			},
			error: function() {
				//alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
	}


	// 전체선택 체크박스
	$(".check-all").click(function() {
		var isChecked = $(this).prop("checked"); // .check-all 체크박스의 상태 가져오기

		$("input[name='checks']").each(function() {
			$(this).prop("checked", isChecked); // 모든 name="checks" 체크박스의 상태 변경
		});

		sumPrice();
	});

	// 장바구니 페이지 진입시 모두체크 활성화
	document.querySelector(".check-all").click();
});