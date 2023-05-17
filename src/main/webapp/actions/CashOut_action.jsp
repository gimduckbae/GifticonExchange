<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.PointDAO"%>
<%@page import="member.PointDTO"%>

<%


if (session.getAttribute("login_id") != null) {
	request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
	String login_id = (String) session.getAttribute("login_id"); //*********
	int withdraw = Integer.parseInt(request.getParameter("withdraw"));
	PointDAO pointDAO = new PointDAO();
	int result = pointDAO.withdraw(login_id, withdraw);

	if (result == 1) {
		// 출금이 성공한 경우
		out.print("<script>alert('출금 신청이 완료되었습니다.');</script> ");
		out.print("<script>location.href='../CashOutMain.jsp'</script> ");
	} else {
		// 출금이 실패한 경우
		out.print("<script>alert('오류가 발생했습니다.');</script> ");
		out.print("<script>history.back();</script> ");
	}
}
%>

