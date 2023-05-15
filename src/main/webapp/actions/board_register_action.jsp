<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언
request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해

// 세션 아이디가 null 이면 메인으로 이동
String writer = null;
if (session.getAttribute("login_id") == null) {
	response.sendRedirect("../index.jsp");
} else {
	writer = (String) session.getAttribute("login_id");
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO memberDTO = memberDAO.selectMemberById(writer);
	String nickname = memberDTO.getNickname();
}

String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDAO boardDAO = new BoardDAO();
BoardDTO boardDTO = new BoardDTO();
boardDTO.setBoard_no(1);
boardDTO.setLogin_id(writer);
boardDTO.setTitle(title);
boardDTO.setContent(content);

int result = boardDAO.insertNewPost(boardDTO);

if (result == 2) {
	obj.put("result", "true");
} else {
	obj.put("result", "false");
}
response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
%>