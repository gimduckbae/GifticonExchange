<%@page import="org.json.simple.JSONObject"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
response.setContentType("application/json");	// HTML 형식이 아닌 JSON 형식으로 쓰겠다
JSONObject obj = new JSONObject();				// JSON 객체를 담기위해 선언

request.setCharacterEncoding("UTF-8");	// 한글 정상 인식을 위해
String id = request.getParameter("id");	// 매개변수로 담겨온 id값 변수에 저장하기. ?id=abcd 주소로 오는것

MemberDAO memberDAO = new MemberDAO();	// DB 처리하기위한 자바 DAO 클래스 선언
MemberDTO memberDTO = memberDAO.selectMemberById(id);	// 해당 id값으로 조회되는 데이터가 있으면 DTO는 null값이 아닐것임

boolean useAble = memberDTO == null;	// 중복아이디가 아니면 DTO는 null 임. 그렇다면 useAble은 true가 담김.

if (useAble) {
	obj.put("result", "true");	// json 객체의 result 키에 true 넣기

} else {
	obj.put("result", "false");	// json 객체의 result 키에 false 넣기
}
response.getWriter().write(obj.toString());	// 최종으로 만들어둔 json 객체를 완성해서 뿌림
%>
