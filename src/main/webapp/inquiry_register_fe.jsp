<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="inquiry_register_fe.css">
</head>
<body>
	<header><%@ include file="nav_bar.jsp"%></header>

	<div class="inquiry-resister-wrap">
		<div class="inquiry-resi-title">
			<h3>문의 작성</h3>
			<hr>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">제목</span> <input
					type="text" class="form-control" aria-label="Username"
					aria-describedby="basic-addon1">
			</div>

		</div>

		<div class="inquiry-resister-main-wrap">

			<div class="inquiry-resister-main">
				<p></p>

				<div class="input-group">
					<span class="input-group-text">내용</span>
					<textarea class="form-control" aria-label="With textarea"></textarea>
				</div>

			</div>
		</div>
		
		<div class="button-wrap">

		<button type="button" class="btn btn-secondary" id="plusli">등록</button>
		</div>
		<div class="bottom-hr">
			<hr>
		</div>
	</div>



	




	<div class="clearfix"></div>

	<%@ include file="footer.jsp"%>


</body>
</html>