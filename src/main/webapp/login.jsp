<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<link rel="stylesheet" href="./css/login.css">
<h1>LOGIN</h1>
<div class="container">
	<div class="col-6 mx-auto">
		<form class="form-control" action="./actions/login_action.jsp"
			method="post">
			<label for="login_id" class="form-label">아이디</label> <input
				type="text" name="login_id" id="login_id" class="form-control">
			<label for="password" class="form-label">비밀번호</label> <input
				type="text" name="password" id="password" class="form-control">
			<div class="d-grid">
				<button id="join_btn" class="btn btn-outline-dark btn-block my-3">로그인</button>
			</div>

			<label for="loginsave" class="form-label">아이디저장</label> <input
				type="checkbox" name="loginsave" value="true" id="loginsave">
		</form>
		<ul>
			<li><a href="javascript:void(0)"> <img alt=""
					src="./images/kakao-Btn.png" onclick="kakaoLogin();">
			</a></li>
			<li onclick="kakaoLogout();"><a href="javascript:void(0)"> <span>카카오
						로그아웃</span>
			</a></li>
		</ul>
	</div>
</div>
<script src="./scripts/login.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="./scripts/kakao_login.js"></script>
<%@ include file="./footer.jsp"%>
