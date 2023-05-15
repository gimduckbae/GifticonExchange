<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<div class="container w-50 p-3 mt-5">
	<form action="" method="post">
		<div class="input-group mb-3">
			<input type="text" id="input" class="form-control" placeholder="기프티콘 번호" value="92006400447496" name="input">
			<button class="btn btn-outline-secondary" type="button" id="button">조회</button>
		</div>
		<div class="form-floating mb-3">
			<input disabled type="texet" class="form-control" id="couponNo" placeholder="쿠폰번호"> <label for="couponNo">쿠폰번호</label>
		</div>
		<div class="form-floating mb-3">
			<input disabled type="texet" class="form-control" id="brandName" placeholder="브랜드이름"> <label for="brandName">브랜드이름</label>
		</div>
		<div class="form-floating mb-3">
			<input disabled type="texet" class="form-control" id="virtualCouponName" placeholder="쿠폰이름"> <label for="virtualCouponName">쿠폰이름</label>
		</div>
		<div class="form-floating mb-3">
			<input disabled type="texet" class="form-control" id="salePrice" placeholder="가격"> <label for="salePrice">가격</label>
		</div>
		<div class="form-floating mb-3">
			<input disabled type="texet" class="form-control" id="validityStartDate" placeholder="발급일"> <label for="validityStartDate">발급일</label>
		</div>
		<div class="form-floating mb-3">
			<input disabled type="texet" class="form-control" id="validityEndDate" placeholder="만료일"> <label for="validityEndDate">만료일</label>
		</div>
		<div class="btn-box d-flex flex-row-reverse">
			<button type=button id="cancel" class="btn btn-secondary ms-1">취소</button>
			<button type=button id="reg" class="btn btn-primary">즉시판매</button>
		</div>
	</form>
</div>
<%@ include file="./footer.jsp"%>
<script src="./scripts/coupon.js"></script>