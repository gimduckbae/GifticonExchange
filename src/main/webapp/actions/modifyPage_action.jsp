<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO member = new MemberDTO();
	String login_id = (String) session.getAttribute("login_id");
	member = memberDAO.selectMemberById(login_id);

	String nickname_aft = request.getParameter("nick");
	String password_aft = request.getParameter("pw");
	String password_bef = request.getParameter("old_pw");

	// 비밀번호 일치, 정보수정 가능
	if (member.getPassword().equals(password_bef)) {
		int result = memberDAO.updateMember(nickname_aft, login_id, password_aft);
		if (result >= 1) {
			out.println("<script>alert('정보 수정이 완료되었습니다.');</script>");
			out.println("<script>location.href = '../myPage.jsp';</script>");
		}
		// 비밀번호 불일치, 정보수정 불가
	} else {
		out.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
		out.println("<script>histoy.back();</script>");
	}
	%>
</body>
</html>

