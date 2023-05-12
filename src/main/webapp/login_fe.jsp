<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="login_fe.css">
        

</head>
<body>

<header><%@ include file="nav_bar.jsp" %></header>
<h1>LOGIN</h1>
<div class="container">
	<div class="col-6 mx-auto">
		<form class="form-control" action="login" method="post">
			<label for="userId" class="form-label">아이디</label>
			<input type="text" name="user_id" id="userId" class="form-control">
			<label for="password" class="form-label">비밀번호</label>
			<input type="text" name="user_pw" id="password" class="form-control">
			<div class="d-grid">
				<button class="btn  btn-outline-dark btn-block my-3">로그인</button>
			</div>
				<button type="reset" class="btn btn-dark">인증</button>
		</form>
	</div>
</div>




<%@ include file="footer.jsp" %>


</body>
</html>