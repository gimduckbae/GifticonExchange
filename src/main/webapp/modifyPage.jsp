<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>

<%
MemberDAO memberDAO = new MemberDAO();
MemberDTO memberDTO = null;

if (login_id != null) {
	memberDTO = memberDAO.selectMemberById(login_id);
}
%>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="w3-content w3-container w3-margin-top">
	<div class="w3-container w3-card-4">
		<div class="w3-center w3-large w3-margin-top">
			<h3>회원정보수정</h3>
		</div>
		<div>
			<form id="myForm" action="./actions/modifyPage_action.jsp" method="post">
				<p>
					<label>이름</label> <input class="w3-input" type="text" id="email" name="email" value="<%=memberDTO.getMember_name()%>" disabled readonly>
				</p>
				<p>
					<label>아이디</label> <input class="w3-input" type="text" id="id" name="id" value="<%=memberDTO.getLogin_id()%>" disabled readonly>
				</p>
				<p class="w3-center"></p>

				<br />
				<p>
					<label>닉네임</label> <input class="w3-input" name="nick" id="pw2" value="<%=memberDTO.getNickname()%>">
				</p>
				<p>
					<label>기존 비밀번호</label> <input class="w3-input" id="old_pw" name="old_pw" type="password">
				</p>
				<p>
					<label>변경 될 비밀번호</label> <input class="w3-input" id="pw" name="pw" type="password">
				</p>
				<p class="w3-center">
					<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">수정완료</button>
				</p>
			</form>
		</div>
	</div>
</div>
<%@ include file="./footer.jsp"%>