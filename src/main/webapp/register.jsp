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
	<form method="post" action="./register_action.jsp">
		<div>
			<div class="input-group mb-3">
				<input type="text" id="input_id" class="form-control"
					placeholder="아이디" aria-label="Recipient's username"
					aria-describedby="button-addon2" name="input_id">
				<button class="btn btn-primary" type="button" id="id_check">중복확인</button>
			</div>
			<input type="text" class="form-control mb-3" placeholder="비번"
				name="input_pw"> <input type="text"
				class="form-control mb-3" placeholder="이름" name="input_name">
			<input type="text" class="form-control mb-3" placeholder="닉네임"
				name="input_nickname">
		</div>
		<button class="btn btn-primary" type="submit">가입하기</button>
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script>
	$(function() {
		$("#id_check").click(function() {
			const input_id = $("#input_id").val();
			
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "register_idCheck.jsp?id=" + input_id, true);
			xhr.send();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
					document.getElementById("result").innerHTML = xhr.responseText.trim();
					if(xhr.responseText.search("가능") != -1){
						form.id.readOnly = true;
					}
				}
			
		});
		
		function checkId() {
			var xhr = new XMLHttpRequest();
			
			xhr.open("GET", "register_idCheck.jsp?id=" + input_id, true);
			xhr.send();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
					document.getElementById("result").innerHTML = xhr.responseText.trim();
					if(xhr.responseText.search("가능") != -1){
						form.id.readOnly = true;
					}
				}
			}
	});
</script>
</html>