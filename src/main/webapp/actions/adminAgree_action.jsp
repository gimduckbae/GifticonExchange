<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.PointDAO"%>
<%@page import="member.PointDTO"%>
<%
response.setContentType("application/json"); // HTML 형식이 아닌 JSON 
JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언

request.setCharacterEncoding("utf-8");
String id = request.getParameter("login_id");

PointDAO pointDAO = new PointDAO();
int amount = pointDAO.selectPointById(id).getWithdraw();
int result = pointDAO.withdrawFinal(id, amount);

// 사용자가 선택한 데이터의 ID 값을 받아옴
// 데이터베이스에서 데이터를 삭제하는 작업을 수행하는 Java 코드를 작성

if (result == 1) {
	obj.put("result", "true");

} else {
	obj.put("result", "false");
}
response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
%>