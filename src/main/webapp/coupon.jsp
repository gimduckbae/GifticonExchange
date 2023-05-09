<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container w-50 p-3 mt-5">
		<div class="input-group mb-3">
			<input type="text" id="input" class="form-control"
				placeholder="기프티콘 번호" value="92006400447496">
			<button class="btn btn-outline-secondary" type="button" id="button">조회</button>
		</div>

		<div class="form-floating mb-3">
			<input disabled type="texet" class="form-control" id="couponNo"
				placeholder="쿠폰번호"> <label for="couponNo">쿠폰번호</label>
		</div>
		<div class="form-floating mb-3">
			<input disabled type="texet" class="form-control" id="brandName"
				placeholder="브랜드이름"> <label for="brandName">브랜드이름</label>
		</div>
		<div class="form-floating mb-3">
			<input disabled type="texet" class="form-control"
				id="virtualCouponName" placeholder="쿠폰이름"> <label
				for="virtualCouponName">쿠폰이름</label>
		</div>
		<div class="form-floating mb-3">
			<input disabled type="texet" class="form-control" id="salePrice"
				placeholder="가격"> <label for="salePrice">가격</label>
		</div>
		<div class="form-floating mb-3">
			<input disabled type="texet" class="form-control"
				id="validityStartDate" placeholder="발급일"> <label
				for="validityStartDate">발급일</label>
		</div>
		<div class="form-floating mb-3">
			<input disabled type="texet" class="form-control"
				id="validityEndDate" placeholder="만료일"> <label
				for="validityEndDate">만료일</label>
		</div>
		<div class="btn-box d-flex flex-row-reverse">
			<button type=button id="cancel" class="btn btn-secondary ms-1">취소</button>
			<button type=button id="reg" class="btn btn-primary">등록</button>
		</div>
	</div>
</body>
<script>
	$(function() {
		var data;

		$("#reg").click(function() { // 등록버튼
			insertCoupon();
		});

		$("#cancel").click(function() { // 취소버튼
			if (confirm("등록된 정보가 사라집니다.")) {
				$("#couponNo").val("");
				$("#brandName").val("");
				$("#virtualCouponName").val("");
				$("#salePrice").val("");
				$("#validityStartDate").val("");
				$("#validityEndDate").val("");
			}
		});

		$("#button").click(function() { // 조회버튼
			data = checkCoupon();
			$("#couponNo").val(data.couponNo);
			$("#brandName").val(data.brandName);
			$("#virtualCouponName").val(data.virtualCouponName);
			$("#salePrice").val(data.salePrice);
			$("#validityStartDate").val(data.validityStartDate);
			$("#validityEndDate").val(data.validityEndDate);
		});

		// 조회한 기프티콘 결과값을 비활성화 된 input그룹에 자동입력 시켜서 등록하자
		function checkCoupon() {
			let couponNumber = $("#input").val().replace(/\s/gi, "");
			if (couponNumber == "") {
				return;
			}
			var result;

			$.ajax({
				async : false, // 비동기 = true
				type : 'GET', // GET 타입
				data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
					"num" : couponNumber
				},
				url : "./actions/checkCoupon.jsp", // 타겟 url 주소
				dataType : "json", // json 형태로 받아오겠다
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					//console.log(data);
					result = data;
					if (data.status === "Y") {
						let register = confirm("판매 가능한 쿠폰입니다. 등록 하시겠습니까?");
						if (register == true) {
							$("#couponNo").val(data.couponNo);
							$("#brandName").val(data.brandName);
							$("#virtualCouponName").val(data.virtualCouponName);
							$("#salePrice").val(data.salePrice);
							$("#validityStartDate").val(data.validityStartDate);
							$("#validityEndDate").val(data.validityEndDate);
						}
					} else {
						alert("등록 불가능한 쿠폰 입니다.");
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			});
			return result;
		}

		function insertCoupon() {
			let couponNumber = $("#input").val().replace(/\s/gi, "");
			if (couponNumber == "") {
				return;
			}

			$.ajax({
				async : false, // 비동기 = true
				type : 'GET', // GET 타입
				data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
					"num" : couponNumber
				},
				url : "./actions/insertCoupon.jsp", // 타겟 url 주소
				dataType : "json", // json 형태로 받아오겠다
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					//console.log(data);

					if (data.result === "true") {
						alert("판매 등록이 정상 처리되었습니다.");
					} else {
						alert("판매 등록에 실패 했습니다.");
					}
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			});
		}
	});
</script>
</html>