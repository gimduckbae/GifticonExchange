<%@page import="image_file.Image_FileDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String directory = request.getSession().getServletContext().getRealPath("/images");
int sizeLimit = 100 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request, directory, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
String fileSysName01 = multi.getFilesystemName("file");
System.out.println(fileSysName01);

Image_FileDAO image_FileDAO = new Image_FileDAO();
//image_FileDAO.insertProductImage(fileSysName01);
image_FileDAO.insertBannerImage(fileSysName01);
%>