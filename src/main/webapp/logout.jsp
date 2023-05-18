<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<%
session.invalidate(); //logout 처리 끝. 세션 정리
out.println("<script>kakaoLogout();</script>");
response.sendRedirect("./index.jsp"); //페이지 이동
%>
<script src="./scripts/kakao_login.js"></script>
<%@ include file="./footer.jsp"%>

