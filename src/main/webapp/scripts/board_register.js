$(function() {

	// 문의글 등록버튼 클릭 이벤트
	$("#submit").click(function() {
		const title = $("#input_title").val();
		const content = $("#input_area").val();

		$.ajax({
			async: true, // 비동기 = true
			type: 'GET', // GET 타입
			data: { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
				"title": title,
				"content": content
			},
			url: "./actions/board_register_action.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				if (data.result === "true") {
					alert("문의내용이 정상적으로 등록 되었습니다.");
					location.href = "./board_main.jsp";
				}

			},
			error: function() {
				alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
	});
	
	
});