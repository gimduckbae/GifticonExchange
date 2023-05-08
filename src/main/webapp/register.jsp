<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</head>
<body>
	<form>
		<div>
			<div class="input-group mb-3">
				<input type="text" id="input_id" class="form-control"
					placeholder="아이디" aria-label="Recipient's username"
					aria-describedby="button-addon2" name="input_id">
				<button class="btn btn-primary" type="button" id="id_check">중복확인</button>
			</div>
			<input type="text" class="form-control mb-3" placeholder="비번"
				id="input_pw"> <input type="text" class="form-control mb-3"
				placeholder="이름" id="input_name"> <input type="text"
				class="form-control mb-3" placeholder="닉네임" id="input_nickname">
		</div>
		<button id="join_btn" class="btn btn-primary" type="button">가입하기</button>
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script>
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
				async : true, // 비동기 true
				type : 'GET', // GET 타입
				data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
					"id" : input_id
				},
				url : "./actions/register_idCheck.jsp", // 타겟 url 주소
				dataType : "json", // json 형태로 받아오겠다
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					//console.log(data.result);
					if (data.result === 'true') { // 사용가능한 아이디면 가입버튼 활성화
						alert("사용 가능한 아이디입니다.");
						$("#join_btn").attr('disabled', false);
					} else {
						alert("중복된 아이디입니다."); // 중복아이디면 가입버튼 비활성화
						$("#join_btn").attr('disabled', true);
					}
				},
				error : function() {
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
				async : true, // 비동기 true
				type : 'get', // GET 타입
				data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
					"input_id" : input_id,
					"input_pw" : input_pw,
					"input_name" : input_name,
					"input_nickname" : input_nickname
				},
				url : "./actions/register_action.jsp", // 타겟 url 주소
				dataType : "json", // json 형태로 받아오겠다
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					//console.log(data.result);
					if (data.result === 'true') { // 회원가입 DB insert 성공
						alert("가입완료!");
						location.href = "./login.jsp";
					} else {
						alert("회원가입중 오류가 발생했습니다."); // DB insert중 오류발생함
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			})
		}

	});
</script>
</html>