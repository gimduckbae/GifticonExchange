<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<link rel="stylesheet" href="./css/myPage.css">
<div class="wrapper-main">
	<div class="mypage-lnb">
		<h2>마이페이지</h2>
		<ul class="list-group list-group-flush">
			<li class="list-group-item"><a href="">내 이지콘머니 충전</a></li>
			<li class="list-group-item"><a href="modifyPage.jsp">개인정보수정</a></li>
			<li class="list-group-item"><a href="./CashOutUser.jsp">
					이지콘머니 출금신청</a></li>
			<li class="list-group-item"><a href="./CashOut.jsp"> 이지콘머니
					출금신청(관리자)</a></li>
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


	<button type="button" class="btn btn-warning" id="giftbutton"
		onclick="openPopupWindow()">선물하기</button>

	<script>
		function openPopupWindow() {

			var popupFeatures = "width=500 height=600,scrollbars=yes";
			var popupWindow = window.open("gift.jsp", "_blank", popupFeatures);

			if (popupWindow == null || typeof (popupWindow) == "undefined") {
				alert("팝업 차단 기능을 해제해주세요.");
			}
		}
	</script>
	<script>
	openPopupWindow(600,700)
	function openPopupWindow(width,height) {
	    if (window.outerWidth) {
	        // IE7+, Firefox, Chrome, Safari, Opera
	        window.outerWidth = 600px;
	        window.outerHeight = 700px;
	    } else if (window.innerWidth) {
	        // IE6, IE5
	        window.innerWidth = 600px;
	        window.innerHeight = 700px;
	    }
	}

	</script>

	<%@ include file="footer.jsp"%>