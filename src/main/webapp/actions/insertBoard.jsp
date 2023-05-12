<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언

request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");
String nickname = request.getParameter("nickname");

BoardDAO boardDAO = new BoardDAO();
BoardDTO boardDTO = new BoardDTO();
boardDTO.setTitle(title);
boardDTO.setContent(content);
boardDTO.setWriter(writer);
boardDTO.setNickname(nickname);
boardDTO.setCategory(1);

boolean result = boardDAO.insertBoard(boardDTO);



if (result) {
	obj.put("result", "true");
} else {
	obj.put("result", "false");
}
response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
%>