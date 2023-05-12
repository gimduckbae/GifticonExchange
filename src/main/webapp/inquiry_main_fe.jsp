<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>





<%-- 1:1 문의 게시판 프론트 --%>
</head>
<style>

footer {
	width: 100%;
	height: 125px; /* footer의 높이 */
	position: absolute;
	bottom: 0;
	left: 0;
}
button {
	float: right;
}

.bottom-hr {
	top: 0;
	padding-top: 40px;
}

.table a{
 text-decoration : none;
 color:black;
}

</style>
<body>

	<header><%@ include file="nav_bar.jsp"%></header>
	<div class="container">
		<h2>1:1 문의 게시판</h2>
		<hr>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">no</th>
					<th scope="col">작성자</th>
					<th scope="col">내용</th>
					<th scope="col">작성일</th>
					<th scope="col">답변유무</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>garam</td>
					<td><a href="#">안녕하세요 문의 드려요</a></td>
					<td>YYYY-MM-DD</td>
					<td>무</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>garam</td>
					<%--내용란 --%>
					<td><a href="#">안녕하세요 문의 드려요</a></td>
					<td>YYYY-MM-DD</td>
					<td>무</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>garam</td>
					<td><a href="#">안녕하세요 문의 드려요</a></td>
					<td>YYYY-MM-DD</td>
					<td>유</td>
				</tr>
			</tbody>
		</table>

		<button type="button" class="btn btn-secondary" id="plusli">등록</button>
		<div class="bottom-hr">
			<hr>
		</div>
	</div>






	<%@ include file="footer.jsp"%>
</body>
<script>
	
</script>
</html>