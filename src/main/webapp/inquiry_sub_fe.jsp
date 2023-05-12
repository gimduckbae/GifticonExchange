<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 문의  프론트--%>

<link rel="stylesheet" href="inquiry_sub_fe.css">
</head>

<body>
	<header><%@ include file="nav_bar.jsp"%></header>

	<div class="inquiry-sub-wrap">
		<div class="inquiry-title">
			<h3>제목란(ex:안녕하세요)</h3>

			<ul>
				<li>작성자 :garam</li>
				<li>작성일 :YYYY-MM-DD</li>
				<li>답변일 :YYYY-MM-DD</li>
			</ul>
			<hr>
		</div>

		<div class="inquiry-main-wrap">
			<h5>문의 내용</h5>
			<div class="inquiry-main">
		    <p></p>
			
			</div>
		</div>
		<div class="inquiry-answer-wrap">
			<h5>문의 답변</h5>
			<div class="inquiry-answer">
			
			<p></p>



			</div>
		</div>

<hr>

	</div>




	<div class="clearfix"></div>

	<%@ include file="footer.jsp"%>
</body>
</html>