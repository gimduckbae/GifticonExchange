<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/login.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
</head>
<body>


<h1>LOGIN</h1>
<div class="container">
	<div class="col-6 mx-auto">
		<form class="form-control" action="./actions/login_action.jsp" method="post">
			<label for="login_id" class="form-label">아이디</label> <input type="text" name="login_id" id="login_id" class="form-control"> <label for="password" class="form-label">비밀번호</label> <input type="password" name="password" id="password" class="form-control">
			<div class="d-grid">
				<button id="join_btn" class="btn btn-outline-dark btn-block my-3"  >로그인</button>
			</div>

			<label for="loginsave" class="form-label">아이디저장</label> <input type="checkbox" name="loginsave" value="true" id="loginsave">
		</form>
	</div>
</div>

<script>

	</script>
<script src="./scripts/login.js"></script>
<%@ include file="./footer.jsp"%>
 	<script>
 
 	</script>

</body>
</html>
