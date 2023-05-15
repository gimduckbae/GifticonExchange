<%@page import="org.json.simple.JSONObject"%>
<%@page import="gifticon.api.HappyOrder"%>
<%@page import="gifticon.GifticonDTO"%>
<%@page import="gifticon.GifticonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언

request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
String couponNumber = request.getParameter("num");

GifticonDAO gifticonDao = new GifticonDAO();
String res = HappyOrder.getResponseByGifticonNumber(couponNumber);
GifticonDTO gifticonDto = gifticonDao.getGifticonStatusByResponse(res);

if (gifticonDto != null) {
	obj.put("resultMsg", gifticonDto.getResultMsg());
	obj.put("resultCode", gifticonDto.getResultCode());
	obj.put("coupon_number", gifticonDto.getCoupon_number());
	obj.put("coupon_name", gifticonDto.getCoupon_name());
	obj.put("brand_code", gifticonDto.getBrand_code());
	obj.put("brand_name", gifticonDto.getBrand_name());
	obj.put("origin_price", gifticonDto.getOrigin_price());
	obj.put("start_date", gifticonDto.getStart_date());
	obj.put("end_date", gifticonDto.getEnd_date());
	obj.put("status", true);
} else {
	obj.put("status", false);
}
response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
%>
