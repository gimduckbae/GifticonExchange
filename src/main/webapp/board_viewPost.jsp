<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<%
request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
int post_no = Integer.parseInt(request.getParameter("post_no"));
BoardDAO boardDAO = new BoardDAO();
BoardDTO boardDTO = boardDAO.selectPostByPost_No(post_no);

if (login_id != null && (login_id.equals(boardDTO.getLogin_id()) || login_id.equals("admin"))) {
%>
<link rel="stylesheet" href="./css/board_viewPost.css">

<div class="inquiry-sub-wrap">
	<div class="inquiry-title">
		<h3><%=boardDTO.getTitle()%></h3>
		<ul>
			<li>작성자: <%=boardDTO.getLogin_id()%></li>
			<li>작성일: <%=boardDTO.getCreate_date()%></li>
			<li>답변일: <%=boardDTO.getAnswer_date()%></li>
		</ul>
		<hr>
	</div>
	<div class="inquiry-main-wrap">
		<h5>문의 내용</h5>
		<div class="inquiry-main">
			<%=boardDTO.getContent()%>
		</div>
	</div>
	<div class="inquiry-answer-wrap">
		<h5>문의 답변</h5>
		<div class="inquiry-answer">
			<%=boardDTO.getAnswer()%>
		</div>
	</div>
	<hr>
	<button type="button" id="btn_back" class="btn btn-dark" onclick="location.href='./board_main.jsp';">목록보기</button>
</div>
<script src="./scripts/board_viewPost.js"></script>
<%@ include file="footer.jsp"%>


<%
} else {
out.println("<script>alert('접근 권한이 없습니다.');</script>");
out.println("<script>location.href = 'board_main.jsp';</script>");
}
%>
