
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.PointDAO"%>
<%@page import="member.PointDTO"%>
<%@ page import="java.util.*"%>



<%@ include file="./header.jsp"%>


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
				<tr>
					<th scope="row">no</th>
					<td>garam</td>
					<td>
						<a href="#">안녕하세요 문의 드려요</a>
					</td>
					<td>2023-03-03</td>
					<td>
						<button type="button" class="btn btn-secondary" id="newpost">답변등록</button>
					</td>
					<td>
						<button type="button" class="btn btn-danger" id="newpost">삭제</button>
					</td>
				</tr>
				<tr>
					<th scope="row">no</th>
					<td>sadsa</td>
					<td>
						<a href="#">안녕</a>
					</td>
					<td>2023-03-03</td>
					<td>
						<button type="button" class="btn btn-secondary" id="newpost">답변등록</button>
					</td>
					<td>
						<button type="button" class="btn btn-danger" id="newpost">삭제</button>
					</td>
				</tr>
				<tr>
					<th scope="row">no</th>
					<td>sadsa</td>
					<td>
						<a href="#">안녕</a>
					</td>
					<td>2023-03-03</td>
					<td>
						<button type="button" class="btn btn-secondary" id="newpost">답변등록</button>
					</td>
					<td>
						<button type="button" class="btn btn-danger" id="newpost">삭제</button>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="bottom-hr">
			<hr>
		</div>
	</div>
</div>
<%@ include file="footer.jsp"%>
