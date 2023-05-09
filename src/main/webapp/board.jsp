<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-5 mb-5" style="width: 80%;">
		<h1>문의 게시판</h1>

		<form action="" method="post">
			<input type="text" id="title" class="form-control mt-4 mb-3" placeholder="제목을 입력해주세요." required>
			<div class="form-group">
				<textarea id="content" class="form-control" rows="10" placeholder="문의내용을 입력해주세요" required style="height: 400px; resize: none;"></textarea>
			</div>
			<div class="d-flex flex-row-reverse">
				<button type="button" id="btn-insert" class="btn btn-primary mt-3">등록하기</button>
			</div>
		</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script>
	$(function() {

		$("#btn-insert").click(insertBoard);

		function insertBoard() {
			var title;
			var content;
			
			$.ajax({
				async : false, // 비동기 = true
				type : 'GET', // GET 타입
				data : { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
					"num" : couponNumber
				},
				url : "./actions/insertBoard.jsp", // 타겟 url 주소
				dataType : "json", // json 형태로 받아오겠다
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					//console.log(data);
					
				},
				error : function() {
					alert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			});
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