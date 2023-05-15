<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<link rel="stylesheet" href="./css/manager_fe.css">


<div class="manager-wrap">

<div class="manager-lnb">
	<h2>관리</h2>
		<ul class="list-group list-group-flush">
			<li class="list-group-item"><a href="#">출금신청내역</a></li>
			<li class="list-group-item"><a href="#">문의게시판관리</a></li>
			
		</ul>
		
	</div>

	<div class="manager-title">
		<h2>관리자 페이지</h2>
		<hr>
	</div>
	

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
				<th scope="col">답변상태</th>
			</tr>
		</thead>
		<tbody>
			
			<tr>
				<th scope="row">no</th>
				<td>sadsa</td>
				<td><a href="#">안녕</a></td>
				<td>2023-03-03</td>
				<td>답변대기중</td>
			</tr>
			<tr>
				<th scope="row">no</th>
				<td>sadsa</td>
				<td><a href="#">안녕</a></td>
				<td>2023-03-03</td>
				<td>답변대기중</td>
			</tr>
			
			<tr>
				<th scope="row">no</th>
				<td>sadsa</td>
				<td><a href="#">안녕</a></td>
				<td>2023-03-03</td>
				<td>답변대기중</td>
			</tr>
			
			
		</tbody>
	</table>

	<button type="button" class="btn btn-secondary" id="newpost">답변등록</button>
	<div class="bottom-hr">
		<hr>
	</div>
</div>
	</div>








</div>


<%@ include file="footer.jsp"%>