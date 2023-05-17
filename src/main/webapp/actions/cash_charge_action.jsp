<%@page import="history.TransActionDTO"%>
<%@page import="history.TransActionDAO"%>
<%@page import="javax.websocket.Session"%>
<%@page import="member.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
out.println("<script>history.replaceState(null,null,'/GifticonExchange/cash_charge.jsp')</script>"); //보여지는 URL 주소만 바꾸려고 씀
if (session.getAttribute("login_id") != null) {
	String login_id = (String) session.getAttribute("login_id");
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
	int amount = Integer.parseInt(request.getParameter("amount"));

	PointDAO pointDAO = new PointDAO();
	int result = pointDAO.chargePoint(login_id, amount);
	
	TransActionDAO transActionDAO = new TransActionDAO();
	TransActionDTO transActionDTO = new TransActionDTO();
	transActionDTO.setAmount(amount);
	transActionDTO.setLogin_id(login_id);
	transActionDTO.setType(1); // 입금은 1=true / 출금은 0=false
	transActionDAO.insertTransActionHistory(transActionDTO);

	if (result == 1) {
		out.println("<script>alert('결제가 완료 되었습니다.');</script>");
		out.println("<script>location.href = './myPage.jsp';</script>");
	} else {
		out.println("<script>alert('결제에 실패 했습니다.');</script>");
		out.println("<script>location.href = './myPage.jsp';</script>");
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
</body>
</html>