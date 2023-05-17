<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
BoardDAO boardDAO = new BoardDAO();
List<BoardDTO> postList = boardDAO.selectAllBoardList();
%>
<link rel="stylesheet" href="./css/board_main.css">
<div class="container">
	<h2>1:1 문의 게시판</h2>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">글 번호</th>
				<th scope="col">작성자</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
				<th scope="col">답변상태</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (BoardDTO post : postList) {
			%>
			<tr>
				<th scope="row"><%=post.getPost_no()%></th>
				<td><%=post.getLogin_id()%></td>
				<td><a href="./board_viewPost.jsp?post_no=<%=post.getPost_no()%>"><%=post.getTitle()%></a></td>
				<td><%=post.getCreate_date()%></td>
				<td><%=post.getStatus()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<button type="button" class="btn btn-secondary" id="newpost">문의등록</button>
	<div class="bottom-hr">
		<hr>
	</div>
</div>
<script src="./scripts/board_main.js"></script>
<%@ include file="footer.jsp"%>
