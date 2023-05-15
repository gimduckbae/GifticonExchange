<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>

<div class="container-fluid">
	진입페이지(메인?) <br> <br> <br>
	<%
	if (login_id == null) {
		out.print("로그인을 해주세요");
	} else {
		out.print(login_id + " 님 반갑습니다.");
	}
	%>
</div>

<%@ include file="./footer.jsp"%>
