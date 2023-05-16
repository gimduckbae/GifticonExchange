<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>

<link rel="stylesheet" href="./css/manager_fe.css">



<div class="manager-wrap">

	<div class="manager-lnb">
		<h2>관리자 메뉴</h2>
		<ul class="list-group list-group-flush">
			<li class="list-group-item"><a href="#">출금신청내역</a></li>
			<li class="list-group-item"><a href="#">문의게시판관리</a></li>

		</ul>

	</div>

	

	<div class="waiting-answer">
		<h4>출금 신청 대기 리스트</h4>
		<hr>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">대기 번호</th>
					<th scope="col">출금 신청자</th>
					<th scope="col">보유포인트</th>
					<th scope="col">출금 신청금액</th>
					<th scope="col">신청승인 </th>
					<th scope="col">신청거절</th>
				</tr>
			</thead>
			<tbody>

			
				<tr>
					<th scope="row">no</th>
					<td>garam</td>
					<td>600000</td>
					<td>100000</td>
					<td><button type="button" class="btn btn-secondary"
							id="newpost">승인</button></td>
					<td><button type="button" class="btn btn-danger"
							id="newpost">거절</button></td>

				</tr>

				<tr>
					<th scope="row">no</th>
					<td>garam</td>
					<td>600000</td>
					<td>100000</td>
					<td><button type="button" class="btn btn-secondary"
							id="newpost">승인</button></td>
					<td><button type="button" class="btn btn-danger"
							id="newpost">거절</button></td>

		
				</tr>
				<tr>
					<th scope="row">no</th>
					<td>garam</td>
					<td>600000</td>
					<td>100000</td>
					<td><button type="button" class="btn btn-secondary"
							id="newpost">승인</button></td>
					<td><button type="button" class="btn btn-danger"
							id="newpost">거절</button></td>

				</tr>


			</tbody>
		</table>


		<div class="bottom-hr">
			<hr>
		</div>
	</div>
</div>


<%@ include file="./footer.jsp"%>