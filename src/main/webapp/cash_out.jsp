<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<link rel="stylesheet" href="./css/cash_out.css">
<link rel="stylesheet" href="./css/cash.css">

<div class="block">
	<form action="./actions/cash_out_action.jsp" method="post">
		<div class="container mt-5">
			<div class="d-flex flex-column">
				<div class="input-group mt-3 mb-5">
					<input type="number" min="10000" step="1000" id="amount" name="withdraw" class="form-control border-bottom border-secondary" placeholder="출금할 금액을 입력해 주세요." style="border: none; border-radius: 0;">
				</div>
				<div class="d-flex flex-row mt-5">
					<button class="btn btn-light ms-1 me-1 border border-secondary" id="amount" onclick="plus1()" type="button" style="width: 50%;">+1만원</button>
					<button class="btn btn-light ms-1 me-1 border border-secondary" type="button" id="amount" onclick="plus5()" style="width: 50%;">+5만원</button>
					<button class="btn btn-light ms-1 me-1 border border-secondary" type="button" id="amount" onclick="plus10()" style="width: 50%;">+10만원</button>
					<button class="btn btn-light ms-1 me-1 border border-secondary" type="button" id="amount" onclick="plus50()" style="width: 50%;">+50만원</button>
				</div>
				<button class="btn btn-primary mt-3" type="submit" name="withdraw" onclick="showWarning()">출금신청하기</button>
			</div>
		</div>
	</form>
</div>


<script>
	let count = 0;

	function plus1() {
		count += 10000;
		document.getElementById('amount').value = count;
	}

	function plus5() {
		count += 50000;
		document.getElementById('amount').value = count;
	}

	function plus10() {
		count += 100000;
		document.getElementById('amount').value = count;
	}

	function plus50() {
		count += 500000;
		document.getElementById('amount').value = count;
	}
</script>
</body>
</html>