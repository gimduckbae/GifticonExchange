<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언

if (session.getAttribute("login_id") == null) {
	obj.put("login", "false"); // 비로그인 login:false 반환
} else {
	obj.put("login", "true"); // 로그인 login:true 반환
}
response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
%>