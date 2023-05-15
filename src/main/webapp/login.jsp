<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
</head>
<body>
	<form>
		<div>
			<div class="input-group mb-3">
				<input type="text" id="input_id" class="form-control" placeholder="아이디" aria-label="Recipient's username" aria-describedby="button-addon2" name="input_id">
			</div>
			<input type="text" class="form-control mb-3" placeholder="비번" id="input_pw">
		</div>
		<button id="join_btn" class="btn btn-primary" type="button">로그인</button>
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script>
	$(function() {
		$("#join_btn").click(idCheck);

		function idCheck() {
			let input_id = $("#input_id").val();
			let input_pw = $("#input_pw").val(); //입력창에 받은 값  

			$.ajax({
				async : true, // 비동기 true
				type : 'get', // GET 타입
				data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
					"input_id" : input_id,
					"input_pw" : input_pw
				},
				url : "./actions/login_action.jsp", // 타겟 url 주소
				dataType : "json", // json 형태로 받아오겠다
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.result === "true") {
						alert("로그인성공");
					} else if (data.result === "wrongpw") {
						alert("비밀번호 틀림");
					} else {
						alert("회원정보를 찾을 수 없다.");
					}
				},
				error : function() {
					alert(" 오류가 발생했습니다. 다시 시도해주세요.");
				}
			})
		}
	});
</script>

</body>
</html>
=======
<%@ include file="./header.jsp"%>
<link rel="stylesheet" href="./css/login.css">
<h1>LOGIN</h1>
<div class="container">
	<div class="col-6 mx-auto">
		<form class="form-control" action="./actions/login_action.jsp" method="post">
			<label for="login_id" class="form-label">아이디</label> <input type="text" name="login_id" id="login_id" class="form-control"> <label for="password" class="form-label">비밀번호</label> <input type="text" name="password" id="password" class="form-control">
			<div class="d-grid">
				<button id="join_btn" class="btn btn-outline-dark btn-block my-3">로그인</button>
			</div>
		</form>
	</div>
	<label for="loginsave" class="form-label">아이디저장</label> <input type="checkbox" name="loginsave" value="true" id="loginsave">
	<button type="reset" class="btn btn-dark">인증</button>
	<button class="btn btn-dark" type="button">아이디찾기</button>
	<button class="btn btn-dark" type="button">비밀번호찾기</button>
</div>
<script src="./scripts/login.js"></script>
<%@ include file="./footer.jsp"%>
>>>>>>> develop
