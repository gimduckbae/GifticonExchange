$(function() {
	$("#join_btn").attr('disabled', true); // 가입하기 버튼 비활성화

	$("#id_check").click(function() { // 아이디 중복체크 버튼
		checkId();
	});

	$("#join_btn").click(function() { // 회원가입 버튼
		register();
	});

	$("#input_id").focus(function() { // 아이디 입력창 focus 되면 중복체크 다시 시키기
		$("#join_btn").attr('disabled', true);
	});

	/** 아이디 중복체크하는 함수 ajax 방식으로 호출해서 json 형태로 리턴받음 */
	function checkId() {
		let input_id = $("#input_id").val();

		$.ajax({
			async: true, // 비동기 true
			type: 'GET', // GET 타입
			data: { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
				"id": input_id
			},
			url: "./actions/register_idCheck.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				//console.log(data.result);
				if (data.result === 'true') { // 사용가능한 아이디면 가입버튼 활성화
					alert("사용 가능한 아이디입니다.");
					$("#join_btn").attr('disabled', false);
				} else {
					alert("중복된 아이디입니다."); // 중복아이디면 가입버튼 비활성화
					$("#join_btn").attr('disabled', true);
				}
			},
			error: function() {
				alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		})
	}

	/** 회원가입양식 테이블에 insert하기. ajax 방식으로 호출해서 성공유무 json 형태로 리턴받음 */
	function register() {
		let input_id = $("#input_id").val();
		let input_pw = $("#input_pw").val();
		let input_name = $("#input_name").val();
		let input_nickname = $("#input_nickname").val();

		$.ajax({
			async: true, // 비동기 true
			type: 'get', // GET 타입
			data: { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
				"input_id": input_id,
				"input_pw": input_pw,
				"input_name": input_name,
				"input_nickname": input_nickname
			},
			url: "./actions/register_action.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				//console.log(data.result);
				if (data.result === 'true') { // 회원가입 DB insert 성공
					alert("가입완료!");
					location.href = "./login.jsp";
				} else {
					alert("회원가입중 오류가 발생했습니다."); // DB insert중 오류발생함
				}
			},
			error: function() {
				alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		})
	}

});