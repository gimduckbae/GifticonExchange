<%--
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.PointDAO"%>
<%@page import="member.PointDTO"%>



<%
request.setCharacterEncoding("utf-8");
String login_id = (String) session.getAttribute("login_id");

PointDAO pointDAO = new PointDAO();
int result = pointDAO.updatePointInfo(login_id);

// 사용자가 선택한 데이터의 ID 값을 받아옴
// 데이터베이스에서 데이터를 삭제하는 작업을 수행하는 Java 코드를 작성

if (result == 0) {
	// Deletion successful
	out.print("<script>location.href='../adminMain.jsp'</script> ");

} else {
	out.print("<script>location.href='../adminMain.jsp'</script> ");
}
%>


 --%>