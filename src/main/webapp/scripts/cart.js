$(function() {

	// 구매하기 버튼 클릭
	$(".buy").click(function() {
		const register_no = $(this).attr("id");
		addCart(register_no);
	});



	/** 장바구니에 상품 추가 비동기처리 */
	function addCart(register_no) {

		$.ajax({
			async: true, // 비동기 true
			type: 'GET', // GET 타입
			data: { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
				"register_no": register_no,
				"type": "add"
			},
			url: "./actions/cart_action.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				console.log(data.count);
				if (data.result === 'true') { // 사용가능한 아이디면 가입버튼 활성화
				}
			},
			error: function() {
				alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		})
	}

	// 장바구니 체크 삭제
	$("#del-btn").click(function() {
		var checkList = [];
		$("input[name='checks']:checked").each(function() {
			checkList.push($(this).attr("id"));
		});
		console.log(checkList);
		delCart(checkList);
	});

	// 1개씩 ajax 삭제처리
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
				console.log("here");
				console.log(data);
				if (data.result === 'true') { // 사용가능한 아이디면 가입버튼 활성화
				}
			},
			error: function() {
				//alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		})
	}



});