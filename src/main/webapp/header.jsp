<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String login_id = null;
%>
<!DOCTYPE html>
<head>
<title>이지콘</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-black navbar-dark">
		<a class="navbar-brand ms-3" href="index.jsp">이지콘</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>


		<form class="d-flex" role="search">
			<input class="form-control me-2" type="search" placeholder="상품검색" aria-label="Search">
			<button class="btn btn-outline-secondary" type="submit">Search</button>
		</form>


		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="./product_list.jsp">구매</a></li>
				<li class="nav-item"><a class="nav-link" href="./coupon.jsp">판매</a></li>
				<li class="nav-item"><a class="nav-link" href="./board_main.jsp">고객센터</a></li>
				<%
				if (session.getAttribute("login_id") != null) {
					login_id = (String) session.getAttribute("login_id");
				%>
				<li class="nav-item"><a class="nav-link" href="./logout.jsp">로그아웃</a></li>
				<li class="nav-item"><a class="nav-link" href="./myPage.jsp">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" href="./cart.jsp">장바구니</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="./login.jsp">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="./register.jsp">회원가입</a></li>
				<%
				}
				if (login_id != null && login_id.equals("admin")) {
				%>
				<li class="nav-item"><a class="nav-link" href="./admin.jsp">관리자기능</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</nav>
	<br>