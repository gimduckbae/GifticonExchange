<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<form>
	<div>
		<div class="input-group mb-3">
			<input type="text" id="input_id" class="form-control" placeholder="아이디" aria-label="Recipient's username" aria-describedby="button-addon2" name="input_id">
			<button class="btn btn-primary" type="button" id="id_check">중복확인</button>
		</div>
		<input type="text" class="form-control mb-3" placeholder="비번" id="input_pw"> <input type="text" class="form-control mb-3" placeholder="이름" id="input_name"> <input type="text" class="form-control mb-3" placeholder="닉네임" id="input_nickname">
	</div>
	<button id="join_btn" class="btn btn-primary" type="button">가입하기</button>
</form>
<script src="./scripts/register.js"></script>
<%@ include file="./footer.jsp"%>