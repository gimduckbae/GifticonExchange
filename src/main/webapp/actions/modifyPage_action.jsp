<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%
request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
MemberDAO memberDAO = new MemberDAO();
MemberDTO member = new MemberDTO();
String login_id = (String) session.getAttribute("login_id");
member = memberDAO.selectMemberById(login_id);
if (member.getPassword().equals(request.getParameter("old_pw"))) {
	out.print("<script>alert('비밀번호가 틀렸습니다.');</script> ");
	out.print("<script>history.back();</script> ");
	if (memberDAO.updateMember(request.getParameter("nick"), request.getParameter("id"),
	request.getParameter("pw")) == 1) {
%>
<script>
	alert("회원 정보 수정 성공!");
	location.href = "../admin.jsp";
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
}
%>

