
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="CashMember.CashMemberDAO"%>
<%@page import="CashMember.CashMemberDTO"%>    

<%

request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
String name = request.getParameter("name"); 
int account = Integer.parseInt(request.getParameter("account"));
int cash = Integer.parseInt(request.getParameter("cash"));
int cashOut = Integer.parseInt(request.getParameter("cashout"));

CashMemberDAO cashMemberDAO = new CashMemberDAO();


//놓친부분	
if (cashout==true) {     
	%>
		<script> 	alert("출금이 되었습니다.");</script>
<% 
	}else{
		%>
		<script> 	alert("출금이 실패했습니다");</script>
		<% 
};
%>


</body>
</html>