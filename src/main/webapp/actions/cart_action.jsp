<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Stream"%>
<%@page import="gifticon.GifticonDTO"%>
<%@page import="gifticon.GifticonDAO"%>
<%@page import="member.PointDAO"%>
<%@page import="member.CartDTO"%>
<%@page import="member.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setContentType("application/json"); // HTML 형식이 아닌 JSON 형식으로 쓰겠다
JSONObject obj = new JSONObject(); // JSON 객체를 담기위해 선언

if (session.getAttribute("login_id") != null) {
	String login_id = (String) session.getAttribute("login_id");
	request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
	String type = request.getParameter("type");

	GifticonDAO gifticonDAO = new GifticonDAO();
	CartDAO cartDAO = new CartDAO();
	PointDAO pointDAO = new PointDAO();

	boolean result = false;
	String cartCount = "0";

	// 장바구니 추가 로직
	if (type.equals("add")) {
		int register_no = Integer.parseInt(request.getParameter("register_no"));
		CartDTO checkCart = cartDAO.checkProductInCart(login_id, register_no);
		if (checkCart == null) {
	result = cartDAO.insertProductToCart(login_id, register_no);
		}
	}

	// 장바구니 삭제 로직
	if (type.equals("del")) {

		// "["1", "2"]" 형식으로 들어옴
		String register_no_str_json = request.getParameter("register_no");
		JSONParser parser = new JSONParser();

		// JSONArray 타입의 ["1", "2"] 로 바뀜
		JSONArray register_no_jsonArray = (JSONArray) parser.parse(register_no_str_json);

		// JSONArray의 사이즈 만큼 String[] 배열 생성
		String[] register_no_str = new String[register_no_jsonArray.size()];

		// String[] 배열에 값 채워넣기
		for (int i = 0; i < register_no_jsonArray.size(); i++) {
	register_no_str[i] = (String) register_no_jsonArray.get(i);
		}

		// String[] 배열을 int[] 배열로 변환
		int[] register_no_arr = Stream.of(register_no_str).mapToInt(Integer::parseInt).toArray();
		result = cartDAO.deleteProductInCart(login_id, register_no_arr);
	}

	// 장바구니 선택 상품 구매 로직
	if (type.equals("buy")) {

		// "["1", "2"]" 형식으로 들어옴
		String register_no_str_json = request.getParameter("register_no");
		JSONParser parser = new JSONParser();

		// JSONArray 타입의 ["1", "2"] 로 바뀜
		JSONArray register_no_jsonArray = (JSONArray) parser.parse(register_no_str_json);

		// JSONArray의 사이즈 만큼 String[] 배열 생성
		String[] register_no_str = new String[register_no_jsonArray.size()];

		// String[] 배열에 값 채워넣기
		for (int i = 0; i < register_no_jsonArray.size(); i++) {
	register_no_str[i] = (String) register_no_jsonArray.get(i);
		}

		// String[] 배열을 int[] 배열로 변환
		int[] register_no_arr = Stream.of(register_no_str).mapToInt(Integer::parseInt).toArray();

		// 선택한 상품번호로 총 상품가격 계산
		int productPrice = 0;
		for (int i : register_no_arr) {
	GifticonDTO gifticonDTO = gifticonDAO.selectProductByNo(i);
	productPrice += gifticonDTO.getSale_price();
		}
		// 소지 포인트 조회
		int myPoint = pointDAO.selectPointById(login_id).getPoint();

		// 소지 포인트가 충분할 때
		if (myPoint >= productPrice) {
	result = cartDAO.buyProductByRegister_no(login_id, register_no_arr);
	result = cartDAO.buyProcessPointModify(login_id, register_no_arr);
	// 소지 포인트가 부족할 때
		} else {
	obj.put("point", "low"); // json 객체의 point 키에 low 넣기
		}

		// 구매처리된 상품은 cart 테이블에서 제거
		cartDAO.deleteCart();
	}

	// 최종 결과 json 리턴하기
	if (result) {
		obj.put("result", "true"); // json 객체의 result 키에 true 넣기
	} else {
		obj.put("result", "false"); // json 객체의 result 키에 false 넣기
	}
	cartCount = String.valueOf(cartDAO.selectAllCartByLogin_Id(login_id).size()); // 카트에 담긴 갯수 가져오기
	obj.put("count", cartCount); // json 객체의 count 키에 장바구니에 담긴 상품 갯수 넣기

	response.getWriter().write(obj.toString()); // 최종으로 만들어둔 json 객체를 완성해서 뿌림
}
%>