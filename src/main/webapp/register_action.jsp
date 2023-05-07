<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
	String id = request.getParameter("input_id");
	String pw = request.getParameter("input_pw");
	String name = request.getParameter("input_name");
	String nickName = request.getParameter("input_nickname");

	MemberDAO memberDAO = new MemberDAO();
	MemberDTO mem = new MemberDTO(id, pw, name, nickName); // 생성자를 통해 바로 값 넣기

	boolean result = memberDAO.insertMember(mem);
	if (result) {
		out.println("<script>alert('회원가입 완료');</script>");
		out.println("<script>location.href = './login.jsp'</script>");
	} else {
		out.println("<script>alert('회원가입 실패');</script>");
		out.println("<script>history.back();</script>");
	}
	%>

</body>
</html>