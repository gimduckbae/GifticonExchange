$(function() {
	loginCheck();

	/** 로그인 체크용 함수. 비로그인 상태면 뒤로가기 실행 */
	function loginCheck() {
		$.ajax({
			async: false, // 비동기 true
			type: 'GET', // GET 타입
			url: "./actions/loginCheck.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				if (data.login === 'false') { // 로그인 상태
					alert("로그인이 필요한 기능입니다.");
					location.href = 'login.jsp';
				}
			}
		});
	}
});

