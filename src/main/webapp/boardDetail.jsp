<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<%
request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
int no = Integer.parseInt(request.getParameter("no"));
BoardDAO boardDAO = new BoardDAO();
BoardDTO boardDTO = boardDAO.selectBoardByNo(no);
%>
<body>
	<div class="container mt-5 mb-5" style="width: 80%;">
		<h1>문의 게시판</h1>
		<!-- 게시판 글 보기 양식 영역 시작 -->
		<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">글 제목</td>
							<td colspan="2"><%=boardDTO.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n",
		"<br>")%></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><%=boardDTO.getNickname()%></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="2"><%=boardDTO.getCreate_date()%></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="2" style="height: 200px; text-align: left;"><%=boardDTO.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
		.replaceAll("\n", "<br>")%></td>
						</tr>
					</tbody>
				</table>
				<a href="./boardView.jsp" class="btn btn-primary">목록</a>
			</div>
		</div>
		<!-- 게시판 글 보기 양식 영역 끝 -->

	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script>
	$(function() {

	});
</script>
</html>