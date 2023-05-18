<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<div class="manager-wrap ms-5">
	<%@ include file="./admin_menu.jsp"%>
	<div class="waiting-answer">
		<h3>출금 신청 대기 리스트</h3>
		<hr>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">출금 신청자</th>
					<th scope="col">보유포인트</th>
					<th scope="col">출금 신청금액</th>
					<th scope="col">신청승인</th>
					<th scope="col">신청거절</th>
				</tr>
			</thead>
			<tbody class="fs-5">
				<tr>
					<th scope="row">no</th>
					<td>garam</td>
					<td>600000</td>
					<td>100000</td>
					<td>
						<button type="button" class="btn btn-secondary" id="newpost">승인</button>
					</td>
					<td>
						<button type="button" class="btn btn-danger" id="newpost">거절</button>
					</td>
				</tr>


			</tbody>
		</table>
		<div class="bottom-hr">
			<hr>
		</div>
	</div>
</div>
<%@ include file="./footer.jsp"%>