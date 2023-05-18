<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<%
BoardDAO boardDAO = new BoardDAO();
List<BoardDTO> postList = boardDAO.selectAllBoardList();
%>


<div class="manager-wrap">
	<%@ include file="./admin_menu.jsp"%>
	<div class="waiting-answer">
		<h4>답변 대기 리스트</h4>
		<hr>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">글 번호</th>
					<th scope="col">작성자</th>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>
					<th scope="col">답변등록</th>
					<th scope="col">문의삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (BoardDTO post : postList) {
				%>
				<tr>
					<th scope="row"><%=post.getPost_no()%></th>
					<td><%=post.getLogin_id()%></td>
					<td><a
						href="./board_viewPost.jsp?post_no=<%=post.getPost_no()%>"><%=post.getTitle()%></a></td>
					<td><%=post.getCreate_date()%></td>
					<td>
						<button type="button" class="btn btn-secondary" id="newpost">답변등록</button>
					</td>
					<td>
						<button type="button" class="btn btn-danger" id="newpost">삭제</button>
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
<script src="./scripts/admin.js"></script>
<%@ include file="footer.jsp"%>