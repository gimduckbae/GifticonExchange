<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
String id = request.getParameter("login_id"); // 매개변수로 담겨온 id값 변수에 저장하기. ?id=abcd 주소로 오는것
String pw = request.getParameter("password");

MemberDAO memberDAO = new MemberDAO(); // DB 처리하기위한 자바 DAO 클래스 선언
MemberDTO memberDTO = memberDAO.selectMemberById(id); // 해당 id값으로 조회되는 데이터가 있으면 DTO는 null값이 아닐것임
//놓친부분
boolean findId = memberDTO != null; // 중복아이디가 아니면 DTO는 null 임. 그렇다면 useAble은 true가 담김.

//놓친부분	
if (findId) { //아이디를 찾으면 true            
	if (pw.equals(memberDTO.getPassword())) { //id , pw 모두 일치 
		session.setAttribute("login_id", memberDTO.getLogin_id());
		out.print("<script>location.href='../index.jsp'</script> ");

	} else { //비밀번호만 틀림.

		out.print("<script>alert('비밀번호가 틀렸습니다.');</script> ");
		out.print("<script>history.back();</script> ");

	}
} else {
	out.print("<script>alert('회원정보를 찾을 수 없습니다.');</script> ");
	out.print("<script>history.back();</script> ");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>

</body>
</html>
