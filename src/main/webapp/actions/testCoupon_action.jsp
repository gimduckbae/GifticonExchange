<%@page import="org.json.simple.JSONObject"%>
<%@page import="gifticon.api.HappyOrder"%>
<%@page import="gifticon.GifticonDTO"%>
<%@page import="gifticon.GifticonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언

request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
String couponNumber = request.getParameter("num");

GifticonDAO gifticonDao = new GifticonDAO();
String res = HappyOrder.getResponseByGifticonNumber(couponNumber);
GifticonDTO gifticonDto = gifticonDao.getGifticonStatusByResponse(res);

obj.put("resultMsg", gifticonDto.getResultMsg());
obj.put("resultCode", gifticonDto.getResultCode());
obj.put("virtualCouponName", gifticonDto.getVirtualCouponName());
obj.put("brandCode", gifticonDto.getBrandCode());
obj.put("brandName", gifticonDto.getBrandName());
obj.put("consumerPrice", gifticonDto.getConsumerPrice());
obj.put("salePrice", gifticonDto.getSalePrice());
obj.put("usableAmount", gifticonDto.getUsableAmount());
obj.put("validityStartDate", gifticonDto.getValidityStartDate());
obj.put("validityEndDate", gifticonDto.getValidityEndDate());
obj.put("status", gifticonDto.getStatus());

response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
%>
