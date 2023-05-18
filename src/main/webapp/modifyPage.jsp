<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>
				<form id="myForm" action="./actions/modifyPage_action.jsp"
					method="post">
					<p>
						<label>Name</label> <input class="w3-input" type="text" id="email"
							name="email" value="<%=session.getAttribute("")%>" required>
					</p>
					<p>
						<label>ID</label> <input class="w3-input" type="text" id="id"
							name="id" readonly value="<%=session.getAttribute("login_id")%>">
					</p>
					<p class="w3-center"></p>

					<br /> <input type="hidden" name="id"
						value="<%--=item.getNickname()--%>">
					<p>
						<label>Nickname</label> <input class="w3-input" name="nick"
							id="pw2">

					</p>
					<p>
						<label>Password</label> <input class="w3-input" id="old_pw"
							name="old_pw" type="password">
					</p>
					<p>
						<label>New Password</label> <input class="w3-input" id="pw"
							name="pw" type="password">
					</p>
					<p class="w3-center">
						<button type="submit"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">수정완료</button>
					</p>
				</form>

			</div>
		</div>
	</div>
</body>
</html>
