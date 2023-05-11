<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<%-- 1:1 문의 게시판 프론트 --%>
</head>
<style>
button{
float: right
;}


</style>
<body>

	<header><%@ include file="nav_bar.jsp"%></header>
	<div class="container">
		<h2>1:1 문의 게시판</h2>
		<hr>
		<table class="table table-warning">
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
					<td>민지</td>
					<td>안녕하세요 문의 드려요</td>
					<td>2021-02-01</td>
					<td>무</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>의성</td>
					<%--내용란 --%>
					<td>왜 환불 안해주세요</td>
					<td>2021-02-01</td>
					<td>무</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>수호</td>
					<td>고소할겁니다</td>
					<td>2021-02-01</td>
					<td>유</td>
				</tr>
			</tbody>
		</table>
		
	    <button type="button" class="btn btn-secondary">등록</button>
		<hr>

	</div>






	<%@ include file="footer.jsp"%>
</body>
<script>
	
</script>
</html>