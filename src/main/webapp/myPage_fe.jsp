<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




<link rel="stylesheet" href="myPage_fe.css">
</head>
<body>
	<header><%@ include file="nav_bar.jsp"%></header>




	<div class="wrapper-main">
		<div class="mypage-lnb">

			<h2>마이페이지</h2>
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="#">내 이지콘머니 충전</a></li>
				<li class="list-group-item"><a href="#">결제내역</a></li>
				<li class="list-group-item"><a href="#">이지콘함</a></li>
			</ul>


			<br>
			<h4>My활동</h4>
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="#">1:1문의 게시판</a></li>
				<li class="list-group-item"><a href="#">자주묻는 질문</a></li>
				<li class="list-group-item"><a href="#">이벤트 참여현황</a></li>
				
			</ul>
		</div>



		<div class="mypage-main">
			<h2>내 정보</h2>
			<ul class="mypage-info-ul">
				<li><span>내 이지콘머니<a href="#"></a></span></li>
				<li><span>보유쿠폰<a href="#"></a></span></li>
			</ul>
		</div>
		
		<div class="mypage-contents">
		<hr>
		<h4>보유쿠폰</h4>
		</div>
		
		<div>
		
		
		
		
		</div>

	</div>
	<div class="clearfix"></div>
	<%@ include file="footer.jsp"%>
</body>
</html>