<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="gifticon.GifticonDAO"%>
<%@page import="gifticon.GifticonDTO"%>
<%@ page import="java.util.Date" %>


<%



request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
GifticonDAO gifticonDao = new GifticonDAO();
int register_no = Integer.parseInt(request.getParameter("register_no"));
String login_id = request.getParameter("login_id");
String recive_id = request.getParameter("recive_id");

boolean result = gifticonDao!= null;

if (result) {
	out.print("<script>alert('선물이 성공적으로 보내졌습니다.');</script> ");
	out.print("<script>location.href='../index.jsp'</script> ");
} else {
	out.print("<script>alert('선물이 보내지지 않았습니다.');</script> ");
	out.print("<script>location.href='../index.jsp'</script> ");
}
%>

    