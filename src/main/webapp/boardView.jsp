<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
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
BoardDAO boardDAO = new BoardDAO();
List<BoardDTO> items = boardDAO.selectAllFromBoard();
%>
<body>
	<div class="container">
		<h1>Q&A</h1>
		<!-- 게시글 목록 표시 영역 -->
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">문의 목록</h5>
				<!-- 게시글 목록을 표시할 테이블 -->
				<table class="table table-sm table-hover">
					<thead class="table-secondary">
						<tr>
							<th>#</th>
							<th>작성날짜</th>
							<th>카테고리</th>
							<th>글제목</th>
							<th>닉네임</th>
							<th>답변상태</th>
						</tr>
					</thead>
					<tbody>
						<!-- 여기에 서버에서 가져온 게시글 데이터를 반복하여 표시 -->
						<%-- 예시로 3개의 게시글을 표시하는 경우 --%>
						<%
						for (BoardDTO item : items) {
						%>
						<tr class="board_item">
							<td><%=item.getNo()%></td>
							<td><%=item.getCreate_date()%></td>
							<td><%=item.getCategory()%></td>
							<td><%=item.getTitle()%></td>
							<td><%=item.getNickname()%></td>
							<%
							if (item.getStatus() == 0) {
							%>
							<td>답변대기중</td>
							<%
							} else {
							%>
							<td>답변완료</td>
							<%
							}
							%>
						</tr>
						<%
						}
						%>

						<!-- 여기까지 -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {
		$(".board_item").click(function() {
			let num = $(this).find("td:first-child").text();
			location.href = './boardDetail.jsp?no=' + num;
		});
	});
</script>
</html>