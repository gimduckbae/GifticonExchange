package gifticon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import dbconn.DBConnectionManager;

public class GifticonDAO {

	/** API호출 후 리턴된 response로 기프티콘 정보 Json을 파싱해서 Dto에 담아 리턴하는 메소드 */
	public GifticonDTO getGifticonStatusByResponse(String response) {
		JSONParser parser = new JSONParser();
		GifticonDTO resultDto = null;

		try {
			resultDto = new GifticonDTO();
			JSONObject resultResponse = (JSONObject) ((JSONObject) parser.parse(response)).get("result"); // response ->
																											// result
																											// 가져오기

			int resultCode = Integer.parseInt((String) resultResponse.get("resultCode")); // result -> resultCode 이걸로 결과
																							// 구분
			String resultMsg = (String) resultResponse.get("resultMsg");

			resultDto.setResultMsg(resultMsg);
			resultDto.setResultCode(resultCode);

//			resultDto.setCoupon_number("92006400447496");
//			resultDto.setCoupon_name("파인트아이스크림");
//			resultDto.setBrand_code("BR00TEST");
//			resultDto.setBrand_name("배스킨라빈스");
//			resultDto.setOrigin_price(0);
//			resultDto.setPurchase_price(0);
//			resultDto.setSale_price(0);
//			resultDto.setStart_date("161202");
//			resultDto.setEnd_date("170305");
//			resultDto.setLogin_id("admin");
//			
//			return resultDto;

			if (resultCode != 0) { // resultCode 가 0이 아니면 resultMsg, resultCode만 Dto에 담아서 리턴하겠다.
				return resultDto;
			}

			JSONObject resultData = (JSONObject) resultResponse.get("resultData"); // result -> resultData 여기에 기프티콘 간단한
																					// 정보 있음

			JSONArray virtualCouponList = (JSONArray) resultData.get("virtualCouponList"); // resultData ->
																							// virtualCouponList 여기에
																							// 기프티콘 상세정보 있음
			JSONObject virtualCouponInfo = (JSONObject) virtualCouponList.get(0); // 버추얼쿠폰리스트가 JSONArray 형식이라 0번 인덱스만
																					// JSONObject 형식으로 쓸 것임

			String couponNo = (String) resultData.get("couponNo"); // 쿠폰번호
			String virtualCouponName = (String) virtualCouponInfo.get("virtualCouponName"); // 기프티콘 풀네임
			String brandCode = (String) virtualCouponInfo.get("brandCode"); // "BR000B" 이런 형식인데 대충 브랜드명+지점번호 느낌인듯
			String brandName = (String) virtualCouponInfo.get("brandName"); // 배스킨라빈스
			// int consumerPrice = (int) ((double) virtualCouponInfo.get("consumerPrice"));
			// // 소비자 판매가 (정가)
			int salePrice = (int) ((double) virtualCouponInfo.get("salePrice")); // 실제 구매가?
			int usableAmount = (int) ((double) virtualCouponInfo.get("usableAmount")); // 사용가능 잔액
			String validityStartDate = (String) virtualCouponInfo.get("validityStartDate"); // 발급일
			String validityEndDate = (String) virtualCouponInfo.get("validityEndDate"); // 유효기간
			String status = (String) virtualCouponInfo.get("status"); // 사용가능 여부

			System.out.println(resultData);

			if (status.equals("N")) {
				return null;
			}

//			if (usableAmount != salePrice) {
//				return null;
//			}	92001492092461

			// Dto에 값 담아주기
			resultDto.setCoupon_number(couponNo);
			resultDto.setCoupon_name(virtualCouponName);
			resultDto.setBrand_code(brandCode);
			resultDto.setBrand_name(brandName);
			resultDto.setPurchase_price(usableAmount);
			resultDto.setOrigin_price(salePrice);
			resultDto.setStart_date(validityStartDate);
			resultDto.setEnd_date(validityEndDate);

			resultDto.setSale_price(usableAmount); // 판매가 정해줘야함

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return resultDto;
	}

	/** 쿠폰DTO를 받아서 테이블에 저장하는 메소드 */

	public boolean insertGifticon(GifticonDTO itemDto) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "INSERT INTO gifticon (register_no, brand_code, brand_name, coupon_number, coupon_name, purchase_price, sale_price, origin_price, start_date, end_date) "
					+ " VALUES( (SELECT NVL(MAX(register_no), 0)+1 FROM gifticon) , ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, itemDto.getBrand_code());
			psmt.setString(2, itemDto.getBrand_name());
			psmt.setString(3, itemDto.getCoupon_number());
			psmt.setString(4, itemDto.getCoupon_name());
			psmt.setInt(5, itemDto.getPurchase_price());
			psmt.setInt(6, itemDto.getSale_price());
			psmt.setInt(7, itemDto.getOrigin_price());
			psmt.setString(8, itemDto.getStart_date());
			psmt.setString(9, itemDto.getEnd_date());
			// psmt.setString(10, itemDto.getLogin_id());

			result = psmt.executeUpdate();

			if (result == 1) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return false;
	}

	/** 판매중인 모든 상품 조회하기 */
	public List<GifticonDTO> selectAllProduct() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<GifticonDTO> products = new ArrayList<GifticonDTO>();

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT register_no, brand_name, coupon_name, sale_price,"
					+ " TO_CHAR(start_date, 'YYYY-MM-DD') start_date," + " TO_CHAR(end_date, 'YYYY-MM-DD') end_date,"
					+ " TO_CHAR(sale_price, '999,999,999') sale_price_char"
					+ " FROM gifticon WHERE login_id IS NULL ORDER BY register_no DESC";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				GifticonDTO dto = new GifticonDTO();
				dto.setRegister_no(rs.getInt("register_no"));
				dto.setBrand_name(rs.getString("brand_name"));
				dto.setCoupon_name(rs.getString("coupon_name"));
				dto.setSale_price(rs.getInt("sale_price"));
				dto.setSale_price_char(rs.getString("sale_price_char"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				products.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return products;

	}

	/** 구매한 보유중인 모든 상품 조회하기 */
	public List<GifticonDTO> selectAllMyProduct(String login_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<GifticonDTO> products = new ArrayList<GifticonDTO>();

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT register_no, brand_name, coupon_name, sale_price, coupon_number,"
					+ " TO_CHAR(start_date, 'YYYY-MM-DD') start_date," + " TO_CHAR(end_date, 'YYYY-MM-DD') end_date,"
					+ " TO_CHAR(sale_price, '999,999,999') sale_price_char"
					+ " FROM gifticon WHERE login_id = ? ORDER BY register_no DESC";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, login_id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				GifticonDTO dto = new GifticonDTO();
				dto.setRegister_no(rs.getInt("register_no"));
				dto.setBrand_name(rs.getString("brand_name"));
				dto.setCoupon_name(rs.getString("coupon_name"));
				dto.setCoupon_number(rs.getString("coupon_number"));
				dto.setSale_price(rs.getInt("sale_price"));
				dto.setSale_price_char(rs.getString("sale_price_char"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				products.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return products;

	}

	/** 키워드로 상품 조회하기 */
	public List<GifticonDTO> searchProduct(String keyword) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<GifticonDTO> products = new ArrayList<GifticonDTO>();

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT register_no, brand_name, coupon_name, sale_price,"
					+ " TO_CHAR(start_date, 'YYYY-MM-DD') start_date," + " TO_CHAR(end_date, 'YYYY-MM-DD') end_date,"
					+ " TO_CHAR(sale_price, '999,999,999') sale_price_char" + " FROM gifticon WHERE login_id IS NULL"
					+ " AND (coupon_name LIKE '%'||?||'%' OR brand_name LIKE '%'||?||'%')"
					+ " ORDER BY register_no DESC";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, keyword);
			psmt.setString(2, keyword);
			rs = psmt.executeQuery();

			while (rs.next()) {
				GifticonDTO dto = new GifticonDTO();
				dto.setRegister_no(rs.getInt("register_no"));
				dto.setBrand_name(rs.getString("brand_name"));
				dto.setCoupon_name(rs.getString("coupon_name"));
				dto.setSale_price(rs.getInt("sale_price"));
				dto.setSale_price_char(rs.getString("sale_price_char"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				products.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return products;

	}

	/** 한개의 상품을 register_no로 조회하기 */
	public GifticonDTO selectProductByNo(int no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		GifticonDTO gifticonDTO = null;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT register_no, brand_name, coupon_name, sale_price, coupon_number,"
					+ " TO_CHAR(start_date, 'YYYY-MM-DD') start_date," + " TO_CHAR(end_date, 'YYYY-MM-DD') end_date,"
					+ " TO_CHAR(sale_price, '999,999,999') sale_price_char" + " FROM gifticon WHERE login_id IS NULL"
					+ " AND register_no = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, no);
			rs = psmt.executeQuery();

			if (rs.next()) {
				gifticonDTO = new GifticonDTO();
				gifticonDTO.setRegister_no(rs.getInt("register_no"));
				gifticonDTO.setBrand_name(rs.getString("brand_name"));
				gifticonDTO.setCoupon_name(rs.getString("coupon_name"));
				gifticonDTO.setSale_price(rs.getInt("sale_price"));
				gifticonDTO.setSale_price_char(rs.getString("sale_price_char"));
				gifticonDTO.setStart_date(rs.getString("start_date"));
				gifticonDTO.setEnd_date(rs.getString("end_date"));
				gifticonDTO.setCoupon_number(rs.getString("coupon_number"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return gifticonDTO;

	}
}
