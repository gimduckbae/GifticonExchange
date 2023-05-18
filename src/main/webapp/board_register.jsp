<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<link rel="stylesheet" href="./css/board_register.css">
<div class="inquiry-resister-wrap">
	<div class="inquiry-resi-title">
		<h3 class="mt-5">문의 작성</h3>
		<hr>
	</div>
	<div class="inquiry-resister-main-wrap">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">제목</span>
			<input type="text" id="input_title" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div class="inquiry-resister-main">
			<p></p>
			<div class="input-group">
				<span class="input-group-text">내용</span>
				<textarea id="input_area" class="form-control" aria-label="With textarea"></textarea>
			</div>
		</div>
	</div>
	<div class="button-wrap">
		<button type="button" class="btn btn-secondary" id="submit">등록</button>
	</div>
	<div class="bottom-hr">
		<hr>
	</div>
</div>
<script src="./scripts/board_register.js"></script>
<%@ include file="footer.jsp"%>