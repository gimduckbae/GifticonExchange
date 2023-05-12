<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="loginCSS.css" rel="stylesheet" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
</head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<div></div>
		<div></div>
	</header>

	<form action="./actions/login_action.jsp" method="post">
		<div>
			<div class="input-group mb-3">
				<input type="text"  class="form-control"
					placeholder="아이디" name="input_id" id="input_id">
			</div>
			<input type="text" class="form-control mb-3" placeholder="비번"
				name="input_pw" id="input_pw">
		</div>
		<button id="join_btn" class="btn btn-primary" type="submit" onclick="trylogin()">로그인</button>
		<input type="checkbox" name="loginsave" value="true"  id="loginsave">아이디저장<br>
		<br><button id="join_btn" class="btn btn-primary" type="submit">아이디찾기</button>
		<button id="join_btn" class="btn btn-primary" type="submit">비밀번호찾기</button>
	</form>


</body>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>


<script>// 아이디저장 
window.onload = () => {
	  const btn = document.getElementById('loginChk');
	  const inputId = document.getElementById('input_id');
	  const inputPw = document.getElementById('input_pw');
	  const inputCheck = document.getElementById('loginsave');

	  let loginId_LocalStorage = localStorage.getItem('input_id');
	  console.log(loginId_LocalStorage);

	  if (loginId_LocalStorage !== null) {
	    inputId.value = loginId_LocalStorage; 
	    inputCheck.checked = true;
	  }

	  if (btn) {
	    btn.addEventListener('click', function () {
	      if (inputCheck.checked) {
	        console.log(inputCheck.checked);
	        localStorage.setItem('input_id', inputId.value);
	      } else {
	        console.log(inputCheck.checked);
	        localStorage.removeItem('input_id');
	      }

	      inputId.value = ''; 
	      inputPw.value = '';
	    });
	  }
	}
</script>


</body>
</html>