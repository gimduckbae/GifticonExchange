<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>



<%
request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
MemberDTO member = new MemberDTO();
MemberDAO memberDAO = new MemberDAO();

if (memberDAO.updateMember(request.getParameter("nick"), request.getParameter("id"),
		request.getParameter("old_pw")) == 1) {
%>
<script>
	alert("회원 정보 수정 성공!");
	location.href = "../admin..jsp";
</script>
<%
} else {
%>
<script>
	alert("회원 정보 수정 실패!");
	history.back();
</script>
<%
}
%>
