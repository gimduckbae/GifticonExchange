<%@page import="member.PointDTO"%>
<%@page import="member.PointDAO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<%
if (login_id == null) {
	out.println("<script>alert('로그인이 필요한 기능입니다.');</script>");
	response.sendRedirect("./login.jsp"); //페이지 이동
}
PointDAO pointDAO = new PointDAO();
PointDTO pointDTO = pointDAO.selectPointById(login_id);
%>

<link rel="stylesheet" href="./css/myPage.css">
<div class="wrapper-main">
	<div class="mypage-lnb">
		<h2>마이페이지</h2>
		<ul class="list-group list-group-flush">
			<li class="list-group-item"><a href="./cash_charge.jsp">콘 충전</a></li>
			<li class="list-group-item"><a href="#">충전내역</a></li>
			<li class="list-group-item"><a href="#">출금내역</a></li>
			<li class="list-group-item"><a href="#">구매내역</a></li>
			<li class="list-group-item"><a href="#">판매내역</a></li>
		</ul>

	</div>
	<div class="mypage-main mt-5">
		<h2>내 정보</h2>
		<ul class="mypage-info-ul">
			<li><span><%=pointDTO.getPoint_char()%>콘 보유중</span></li>
			<li><span>내 정보수정<a href="#"></a></span></li>
		</ul>
	</div>

	<div class="mypage-contents">
		<hr>
		<h4>보유쿠폰</h4>
	</div>
	<div></div>
</div>
<%@ include file="footer.jsp"%>
