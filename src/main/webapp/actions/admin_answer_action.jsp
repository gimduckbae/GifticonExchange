<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언
request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해

int post_no = Integer.parseInt(request.getParameter("post_no"));
String answer = request.getParameter("content");

BoardDAO boardDAO = new BoardDAO();
int result = 0;

result += boardDAO.answerPost(post_no, answer);
result += boardDAO.answerPost2(post_no);

if (result == 2) {
	obj.put("result", "true");
} else {
	obj.put("result", "false");
}
response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
%>