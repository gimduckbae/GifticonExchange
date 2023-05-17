<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<%@page import="image_file.Image_FileDTO"%>
<%@page import="image_file.Image_FileDAO"%>
<%@page import="java.util.List"%>
<%@ include file="./header.jsp"%>
<%
Image_FileDAO image_FileDAO = new Image_FileDAO();
%>
<div class="container">
	<div class="item-view">
		<div class="row">
			<div class="col">
				<%
				for (int i = 0; i < 1; i++) {
				%>
				<div class="col">
					<img src="" class="item-img" alt="...">
				</div>
				<%
				}
				%>
			</div>
			<div class="col" style="margin-top: 100px;">
				<%
				for (int i = 0; i < 1; i++) {
				%>
				<div>
					<h4 class="it-info"></h4>
					</h3>
				</div>
				<br>
				<div class="row">
					<div class="col">
						<p class="it-text">선물하기</p>
						<p class="it-text">교환처</p>
						<p class="it-text">쿠폰 이용안내</p>
					</div>
					<div class="col">
						<p>가능</p>
						<p>베스킨라빈스, baskinrobbins</p>
						<p>구매 후 환불 불가</p>
					</div>
				</div>
				<button type="button" class="btn btn-red btn-lg">바로구매</button>
				<button type="button" class="btn btn-blue btn-lg">판매하기</button>
				<%
				}
				%>
			</div>
		</div>
		<div class="banner d-flex flex-row">
			<ul>
				<%
				for (int i = 5; i < 8; i++) {
				%>
				<li class="evt2"><img src="" class="evt2-img"></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</div>
<script src="./scripts/product_detail.js"></script>
<link href="./css/product_detail.css" rel="stylesheet">