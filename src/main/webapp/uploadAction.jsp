<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html>
<html>
<head>
<title>Upload Result</title>
</head>
<body>
	<h2>Upload Result</h2>
	<%
	String uploadDirectory = request.getSession().getServletContext().getRealPath("/images"); // Replace with the directory to which you want to upload the files
	int maxFileSize = 10 * 1024 * 1024; // Maximum file size (in bytes) - change as needed

	try {
		MultipartRequest multi = new MultipartRequest(request, uploadDirectory, maxFileSize, "UTF-8",
		new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();
		List<String> fileNames = new ArrayList<String>();

		while (files.hasMoreElements()) {
			String fileName = (String) files.nextElement();
			String originalFileName = multi.getOriginalFileName(fileName);
			fileNames.add(originalFileName);
		}

		// Display all uploaded file names
		for (String item : fileNames) {
			out.println("Uploaded file: " + item + "<br>");
		}
	} catch (Exception e) {
		out.println("Upload failed: " + e.getMessage());
	}
	%>
</body>
</html>
