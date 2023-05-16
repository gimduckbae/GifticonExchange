<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html>
<html>
<head>
<title>Multiple Image Upload</title>
</head>
<body>
	<h2>Multiple Image Upload</h2>
	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
		<input type="file" name="file" multiple> <input type="submit" value="Upload">
	</form>
</body>
</html>
