<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.PointDAO"%>
<%@page import="member.PointDTO"%>
<%
if (session.getAttribute("login_id") != null) {
	String login_id = (String) session.getAttribute("login_id");
	request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
	int withdraw = Integer.parseInt(request.getParameter("withdraw"));
	int result = 0;

	PointDAO pointDAO = new PointDAO();

	// 소지 포인트 조회
	int myPoint = pointDAO.selectPointById(login_id).getPoint();

	// 출금 가능한 상태
	if (myPoint >= withdraw) {
		result = pointDAO.withdraw(login_id, withdraw);
	} else {
		result = -1;
	}

	if (result == 1) {
		// 출금이 성공한 경우
		out.print("<script>alert('출금 신청이 완료되었습니다.');</script> ");
		out.print("<script>location.href='../myPage.jsp'</script>");

	} else if (result == -1) {
		// 잔액이 부족한경우
		out.print("<script>alert('보유 이지콘이 부족합니다.');</script>");
		out.print("<script>location.href='../myPage.jsp'</script>");

	} else {
		// 출금이 실패한 경우
		out.print("<script>alert('오류가 발생했습니다.');</script>");
		out.print("<script>history.back();</script>");
	}
}
%>