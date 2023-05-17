<%@page import="image_file.Image_FileDTO"%>
<%@page import="image_file.Image_FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
int banner_no = Integer.parseInt(request.getParameter("banner_no"));
Image_FileDAO image_FileDAO = new Image_FileDAO();
Image_FileDTO banner = image_FileDAO.selectBannerByBannerNo(banner_no);

String file_name = request.getSession().getServletContext().getRealPath("/images/") + banner.getFile_name();
boolean result = image_FileDAO.deleteFileByName(file_name);
if (result) {
	image_FileDAO.deleteBannerByNo(banner_no);
	out.println("<script>alert('삭제가 정상 처리되었습니다.');</script>");
}
%>
<script>
	location.href = "../admin_upload.jsp";
</script>