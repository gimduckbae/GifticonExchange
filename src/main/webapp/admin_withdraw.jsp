<%@page import="java.util.List"%>
<%@page import="member.PointDTO"%>
<%@page import="member.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<%
//비로그인 상태거나 admin 계정이 아니면 메인페이지로 이동
if (session.getAttribute("login_id") == null || !(session.getAttribute("login_id").equals("admin"))) {
	response.sendRedirect("index.jsp");
}
PointDAO pointDAO = new PointDAO();
List<PointDTO> withdrawList = pointDAO.selectWaitingWithdraw();
%>
<div class="manager-wrap ms-5">
	<%@ include file="./admin_menu.jsp"%>
	<div class="waiting-answer">
		<h3>출금 신청 대기 리스트</h3>
		<hr>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">출금 신청자</th>
					<th scope="col">보유포인트</th>
					<th scope="col">출금 신청금액</th>
					<th scope="col">신청승인</th>
					<th scope="col">신청거절</th>
				</tr>
			</thead>

			<tbody class="fs-5">

				<%
				for (PointDTO item : withdrawList) {
				%>
				<tr>
					<td><%=item.getLogin_id()%></td>
					<td><%=item.getPoint_char()%></td>
					<td><%=item.getWithdraw_char()%></td>
					<td>
						<button type="button" class="btn btn-secondary" id="yes" data-loginid="<%=item.getLogin_id()%>">승인</button>
					</td>
					<td>
						<button type="button" class="btn btn-danger" id="no" data-loginid="<%=item.getLogin_id()%>">거절</button>
					</td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
		<div class="bottom-hr">
			<hr>
		</div>
	</div>
</div>
<script src="scripts/admin_withdraw.js"></script>
<%@ include file="./footer.jsp"%>