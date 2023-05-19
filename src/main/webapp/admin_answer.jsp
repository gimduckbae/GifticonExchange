<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<%
request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
int post_no = Integer.parseInt(request.getParameter("post_no"));
BoardDAO boardDAO = new BoardDAO();
BoardDTO post = boardDAO.selectPostByPost_No(post_no);
%>
<link rel="stylesheet" href="./css/board_register.css">
<div class="inquiry-resister-wrap">
	<div class="inquiry-resi-title">
		<h3 class="mt-5">문의 답변작성</h3>
		<hr>
	</div>
	<div class="inquiry-resister-main-wrap">


		<div class="inquiry-resister-main">
			<p></p>
			<div class="input-group">
				<span class="input-group-text">문의내용</span>
				<textarea id="question_area" class="form-control" readonly><%=post.getContent()%></textarea>
			</div>
		</div>

		<div class="inquiry-resister-main">
			<p></p>
			<div class="input-group">
				<span class="input-group-text">답변작성</span>
				<textarea id="input_area" class="form-control"></textarea>
			</div>
		</div>

	</div>
	<div class="button-wrap">
		<button type="button" class="btn btn-secondary" id="submit" data-postno="<%=post.getPost_no()%>">등록</button>
	</div>
	<div class="bottom-hr">
		<hr>
	</div>
</div>
<script src="./scripts/admin_answer.js"></script>
