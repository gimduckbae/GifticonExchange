<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
 <%@ include file="./header.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물페이지</title>

<link rel="stylesheet" href="css/gift.css">
</head>
<body>
<%
MemberDAO memberDAO = new MemberDAO();
MemberDTO memberDTO = null;

if (login_id != null) {
	memberDTO = memberDAO.selectMemberById(login_id);
}
%>

<div class="wrap">
	<div class = "header">
	 <h3>선물하기</h3>
  	<p>보내는 사람 : <%=memberDTO.getLogin_id()%></p>
  	</div>
    <form  action="actions/giftgift_action.jsp">
    <div class="giftcontainer">
        <label for="receiver">수신자</label>
        <input type="text" id="receiver" name="receiver" required><br><br>
		 <label for="gifticon" ><select><option >선택하기</option></select></label><br><br>
        <label for="gift">전달메세지</label>
        <textarea id="gift" name="gift" ></textarea><br><br>
        <input type="submit" value="선물 보내기">
         <input type="reset" value="취소하기">
         </div>
    </form>
</div>


</body>
</html>