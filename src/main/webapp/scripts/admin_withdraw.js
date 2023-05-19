$(function() {

	$("#yes").click(function() {
		const login_id = $(this).data("loginid");

		$.ajax({
			async: true, // 비동기 = true
			type: 'GET', // GET 타입
			data: { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
				"login_id": login_id
			},
			url: "./actions/adminAgree_action.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				if (data.result === "true") {
					alert("출금 승인이 완료되었습니다.");

					location.href = "./admin.jsp";
				} else {
					alert("출금 승인이 실패했습니다.");
				}

			},
			error: function() {
				alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
	});


	$("#no").click(function() {
		const login_id = $(this).data("loginid");

		$.ajax({
			async: true, // 비동기 = true
			type: 'GET', // GET 타입
			data: { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
				"login_id": login_id
			},
			url: "./actions/adminDisagree_action.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				if (data.result === "true") {
					alert("출금 거절이 완료되었습니다.");
					location.href = "./admin.jsp";
				} else {
					alert("출금 거절이 실패했습니다.");
				}

			},
			error: function() {
				alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
	});

});