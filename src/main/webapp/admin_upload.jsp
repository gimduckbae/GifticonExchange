<%@page import="image_file.Image_FileDTO"%>
<%@page import="java.util.List"%>
<%@page import="image_file.Image_FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//비로그인 상태거나 admin 계정이 아니면 메인페이지로 이동
if (session.getAttribute("login_id") == null || !(session.getAttribute("login_id").equals("admin"))) {
	response.sendRedirect("index.jsp");
}
Image_FileDAO image_FileDAO = new Image_FileDAO();
List<Image_FileDTO> banners = image_FileDAO.selectAllBannerImage();
%>
<%@ include file="./header.jsp"%>

<div class="manager-wrap ms-5">
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
	<form action="" method="post" enctype="multipart/form-data">
		<input type="file" class="form-control" id="file" name="file" multiple><br> <input type="radio" class="btn-check" name="options" id="option1" autocomplete="off" checked> <label class="btn btn-white" for="option1">배너용</label> <input type="radio" class="btn-check" name="options" id="option2" autocomplete="off"> <label class="btn btn-white" for="option2">상품용</label>
		<button type="button" id="submit" class="btn btn-primary">업로드</button>
	</form>

	<form class="mt-5" method="post" action="./actions/delete_banner.jsp">
		<input type="text" id="banner_input" name="banner_no" hidden> <select class="form-select mb-3" id="select-banner">
			<option selected>삭제할 배너를 선택하세요</option>
			<%
			for (Image_FileDTO banner : banners) {
			%>
			<option class="s-banner" value="<%=banner.getBanner_no()%>" id="banner_no"><%=banner.getFile_name()%></option>
			<%
			}
			%>
		</select>
		<button type="submit" id="delete-banner" class="btn btn-primary">삭제</button>
	</form>
</div>
<script src="./scripts/admin_upload.js"></script>
<%@ include file="./footer.jsp"%>