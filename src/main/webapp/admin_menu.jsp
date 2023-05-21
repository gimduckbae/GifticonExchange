<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//비로그인 상태거나 admin 계정이 아니면 메인페이지로 이동
if (session.getAttribute("login_id").equals("admin")) {
%>
<link rel="stylesheet" href="./css/admin.css">
<div class="manager-lnb">
	<h2 class="mt-5">관리자 메뉴</h2>
	<ul class="list-group list-group-flush">
		<li class="list-group-item fs-5"><a href="./admin_withdraw.jsp">출금 신청내역</a></li>
		<li class="list-group-item fs-5"><a href="./admin.jsp">문의게시판 관리</a></li>
		<li class="list-group-item fs-5"><a href="./admin_upload.jsp">이미지파일 관리</a></li>
	</ul>
</div>
<%
} else {
out.println("<script>alert('접근 권한이 없습니다.');</script>");
out.println("<script>location.href = 'index.jsp';</script>");
}
%>
