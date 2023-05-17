
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>

<%@ include file="./header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/myPage.css">
</head>
<body>



	<div class="wrapper-main">
		<div class="mypage-lnb">
			<h2>마이페이지</h2>
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="">내 이지콘머니 충전</a></li>
				<li class="list-group-item"><a href="">개인정보수정</a></li>
				<li class="list-group-item"><a href="./CashOut.jsp">이지콘머니
						출금신청</a></li>
				<li class="list-group-item"><a href="#">결제내역</a></li>
				<li class="list-group-item"><a href="#">이지콘함</a></li>
			</ul>
			<br>
			<h4>My활동</h4>
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="#">1:1문의 게시판</a></li>
				<li class="list-group-item"><a href="#">자주묻는 질문</a></li>
				<li class="list-group-item"><a href="#">이벤트 참여현황</a></li>
			</ul>
		</div>
		<div class="mypage-main">
			<ul class="mypage-info-ul">
				<li><span><a href="#"></a></span></li>
				<li><span><a href="#"></a></span></li>
			</ul>
		</div>
				<%
		MemberDAO memberDAO = new MemberDAO();
		List<MemberDTO> list = memberDAO.updateMemberr(login_id);
		for (MemberDTO item : list) {
		%>

		<div class="mypage-contents">
			<h3>
				개인정보수정
				</h4>
				<form action="./actions/modifyPage_action.jsp">
					<table>

						<tr>
							<td>이름</td>
							<td><input type="text" name="name" readonly="readonly"
								value=""></td><%=item.getMember_name()%>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="userid" readonly="readonly"
								value=""></td><%=item.getLogin_id()%>
						</tr>
						<tr>
							<td>암호</td>
							<td><input type="password" name="pwd"></td>
						</tr>
						<tr>
							<td>암호확인</td>
							<td><input type="password" name="pwdpwd"></td>
						</tr>

						<tr>

							<td><input type="radio" name="admin" value="0"
								checked="checked">일반회원 <input type="radio" name="admin"
								value="1">관리자</td>
						</tr>
						<tr>
							<td><input type="submit" value="OK" onclick=""></td>
							<td><input type="reset" value="cancle"></td>
						</tr>
					</table>

				</form>
		</div>
	</div>
	<%
	
	
					}
					%>


	<%@ include file="footer.jsp"%>




</body>
</html>
