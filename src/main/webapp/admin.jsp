
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.PointDAO"%>
<%@page import="member.PointDTO"%>
<%@ page import="java.util.*"%>



<%@ include file="./header.jsp"%>
<div class="container">관리자 페이지 입니다</div>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">


</head>
<body>
	<h1>사용자 상세정보</h1>
	<%
	PointDAO dao = new PointDAO();
	List<PointDTO> list = dao.selectAllWithdraw();
	for (PointDTO item : list) {
		
	%>
	
	<form name='PayAgree' action='./actions/CashOut_action.jsp'
		method="post">
		<div class="mb-3">
			<label for="formGroupExampleInput" class="form-label">ID</label> <input
				type="hidden" class="form-control" id="formGroupExampleInput"
				name="id" placeholder="Example input placeholder"
				value="<%=item.getLogin_id()%>"> <%-- 출금자 아이디 --%>
		</div>
		<div class="mb-3">
			<label for="formGroupExampleInput2" class="form-label">Point</label>
			<input type="text" class="form-control" id="inputName" name="name"
				placeholder="Another input placeholder" value="<%=item.getPoint()%>">
		</div><%-- 현재포인트 --%>
		
		<div class="mb-3">	
			<label for="formGroupExampleInput3" class="form-label">Withdraw</label>
			<input type="text" class="form-control" id="inputWithdraw"
				name="withdraw" placeholder="Another input placeholder"
				value="<%=item.getWithdraw()%>"> 		<%-- 결제대기금액 --%>
			
		</div>
		<%-- 출금허가 --%>
		<button id="updateBtn" type="submit" class="btn btn-warning">수락</button>
		<%-- 출금거부 --%>
		<button id="deleteBtn" type="submit" class="btn btn-danger">거부</button>
	</form>
	<%
	}
	%>	
	<%--   출금 거부하면 disagree 액션 페이지로 이동 --%>
	
	<script>
function adjustWidth(input) {
    input.style.width = (input.value.length + 2) + 'ch';
}
</script>
	
	<script>
document.getElementById('deleteBtn').addEventListener('click', () => {
	let form = document.PayAgree;
	if (confirm('거부하시겠습니까?')) {
		form.action = './actions/adminDisagree_action.jsp';
		form.submit();
	}
});

document.getElementById('updateBtn').addEventListener('click', () => {
	let form = document.PayAgree;
	let inputName = document.getElementById('inputName');
	let inputWithdraw = document.getElementById('inputWithdraw');

	if (confirm('수락하시겠습니까?')) {
		form.action = './actions/adminAgree_action.jsp';
		form.submit();
	}
});
</script>

</body>
</html>

