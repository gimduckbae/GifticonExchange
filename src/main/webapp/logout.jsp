<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.invalidate(); //logout 처리 끝. 세션 정리
response.sendRedirect("./index.jsp"); //페이지 이동
%>

