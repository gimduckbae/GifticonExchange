<%--

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.PointDAO"%>
<%@page import="member.PointDTO"%>



<%
request.setCharacterEncoding("utf-8");
String login_id = (String) session.getAttribute("login_id");
//String login_id = request.getParameter("login_id");
// int login_id = Integer.parseInt(request.getParameter("login_id"));
//** String login_id = request.getParameter("login_id"); */
//int withdraw = Integer.parseInt(request.getParameter("withdraw"));
PointDAO pointDAO = new PointDAO();
int result = pointDAO.deletePointInfo(login_id);
result = pointDAO.updatePointInfo(login_id); //놓친거  - 0으로 셋팅하는거

if (result == 0) {
	// Deletion successful
%>
<script>
	alert("출금이 완료되었습니다.")
</script>
out.print("
<script>
	location.href = '../admin.jsp'
</script>
");
<%
} else {

out.print("<script>location.href='../admin.jsp'</script> ");
}
%>

 --%>