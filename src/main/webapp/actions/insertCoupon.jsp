<%@page import="org.json.simple.JSONObject"%>
<%@page import="gifticon.api.HappyOrder"%>
<%@page import="gifticon.GifticonDTO"%>
<%@page import="gifticon.GifticonDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언

request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
String couponNumber = request.getParameter("num");

GifticonDAO gifticonDao = new GifticonDAO();
String res = HappyOrder.getResponseByGifticonNumber(couponNumber);
GifticonDTO gifticonDto = gifticonDao.getGifticonStatusByResponse(res);

if (gifticonDto != null) {
	gifticonDto.setLogin_id((String) session.getAttribute("login_id"));
	boolean result = gifticonDao.insertGifticon(gifticonDto);
	if (result) {
		obj.put("result", true);
	}
}
response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
%>