<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>

<div class="manager-wrap">
	<%@ include file="./admin_menu.jsp"%>
	<div class="tb">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">파일명:</th>
					<th scope="col">용량:</th>
				</tr>
			</thead>
			<tbody class="tbody">

			</tbody>
		</table>
	</div>
	<hr>
	<form action="./upload_action.jsp" method="post" enctype="multipart/form-data">
		<input type="file" id="file" name="file" multiple>
		<button type="button" class="btn btn-dark">파일 선택</button>
		<button type="button" id="submit" class="btn btn-primary">업로드</button>
	</form>
</div>
<script src="./scripts/admin_upload.js"></script>
<%@ include file="./footer.jsp"%>