<%@page import="java.util.List"%>
<%@page import="gifticon.GifticonDTO"%>
<%@page import="gifticon.GifticonDAO"%>
<%@page import="member.PointDTO"%>
<%@page import="member.PointDAO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<script src="./scripts/loginCheck.js"></script>
<%
PointDAO pointDAO = new PointDAO();
PointDTO pointDTO = pointDAO.selectPointById(login_id);
GifticonDAO gifticonDAO = new GifticonDAO();
List<GifticonDTO> products = gifticonDAO.selectAllMyProduct(login_id);
%>

<link rel="stylesheet" href="./css/myPage.css">
<div class="wrapper-main">
	<div class="mypage-lnb">
		<h2>마이페이지</h2>
		<ul class="list-group list-group-flush">
			<li class="list-group-item"><a href="./cash_charge.jsp">콘 충전</a></li>
			<li class="list-group-item"><a href="./cash_out.jsp">출금 신청</a></li>
			<li class="list-group-item"><a href="#">충전내역</a></li>
			<li class="list-group-item"><a href="#">출금내역</a></li>
			<li class="list-group-item"><a href="#">구매내역</a></li>
			<li class="list-group-item"><a href="#">판매내역</a></li>
		</ul>

	</div>
	<div class="mypage-main mt-5">
		<h2>내 정보</h2>
		<ul class="mypage-info-ul">
			<li><span><%=pointDTO.getPoint_char()%>콘 보유중</span></li>
			<li><a href="./modifyPage.jsp"><span>내 정보수정</span></a></li>
		</ul>
	</div>

	<div class="mypage-contents container text-center">
		<hr>
		<h4>보유쿠폰</h4>

		<div class="row row-cols-3">
			<%
			for (GifticonDTO product : products) {
			%>
			<div class="card col my-card">
				<img src="./images/<%=product.getCoupon_name()%>.png" class="card-img-top" alt="<%=product.getCoupon_name()%>">
				<div class="card-body">
					<h5 class="card-title fs-5"><%=product.getCoupon_name()%></h5>
					<p class="card-text"><%=product.getSale_price_char()%>콘
					</p>
					<p class="card-text">
						쿠폰번호:
						<%=product.getCoupon_number()%></p>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
	<%@ include file="footer.jsp"%>