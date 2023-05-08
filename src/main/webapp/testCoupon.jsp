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
	<div class="container" style="margin: 0 auto; margin-top: 10vh;">
		<div class="input-group mb-3">
			<input type="text" id="input" class="form-control"
				placeholder="기프티콘 번호">
			<button class="btn btn-outline-secondary" type="button" id="button">Button</button>
		</div>
	</div>
</body>
<script>
	$(function() {
		$("#button").click(function() {
			checkCoupon();
		});
		
		// 조회한 기프티콘 결과값을 비활성화 된 input그룹에 자동입력 시켜서 등록하자
		function checkCoupon() {
			let couponNumber = $("#input").val();

			$.ajax({
				async : true, // 비동기 true
				type : 'GET', // GET 타입
				data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
					"num" : couponNumber
				},
				url : "./actions/testCoupon_action.jsp", // 타겟 url 주소
				dataType : "json", // json 형태로 받아오겠다
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data);
					if(data.status === "Y") {
						alert("판매 가능한 쿠폰");
						
					} else {
						alert("등록 불가능한 쿠폰");
					}
					
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			})
		}
	});
</script>
</html>