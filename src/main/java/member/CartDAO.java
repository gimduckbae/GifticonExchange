package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;
import gifticon.GifticonDAO;
import gifticon.GifticonDTO;

public class CartDAO {

	/** CART 테이블의 모든 정보를 List<CartDTO> 형식으로 가져오는 메소드 */
	public List<CartDTO> selectAllCartByLogin_Id(String login_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<CartDTO> cartList = new ArrayList<CartDTO>();

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT c.login_id, c.register_no,"
					+ " g.brand_code, g.brand_name, g.coupon_number, g.coupon_name,"
					+ " g.purchase_price, g.sale_price, g.origin_price,"
					+ " TO_CHAR(g.purchase_price, '999,999,999') purchase_price_char,"
					+ " TO_CHAR(g.sale_price, '999,999,999') sale_price_char,"
					+ " TO_CHAR(g.origin_price, '999,999,999') origin_price_char,"
					+ " TO_CHAR(g.start_date, 'YYYY-MM-DD') start_date," + " TO_CHAR(g.end_date, 'YYYY-MM-DD') end_date"
					+ " FROM cart c" + " INNER JOIN gifticon g" + " ON c.register_no = g.register_no"
					+ " AND c.login_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, login_id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				CartDTO cartDTO = new CartDTO();
				GifticonDTO gifticonDTO = new GifticonDTO();
				cartDTO.setLogin_id(rs.getString("login_id"));
				cartDTO.setRegister_no(rs.getInt("register_no"));
				gifticonDTO.setBrand_name(rs.getString("brand_name"));
				gifticonDTO.setCoupon_name(rs.getString("coupon_name"));
				gifticonDTO.setSale_price(rs.getInt("sale_price"));
				gifticonDTO.setSale_price_char(rs.getString("sale_price_char"));
				gifticonDTO.setStart_date(rs.getString("start_date"));
				gifticonDTO.setEnd_date(rs.getString("end_date"));

				cartDTO.setGifticonDTO(gifticonDTO);
				cartList.add(cartDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return cartList;
	}

	/** 장바구니에 중복상품 담기 방지를 위한 조회 기능 */
	public CartDTO checkProductInCart(String login_id, int register_no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		CartDTO cartDTO = null;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT login_id, register_no FROM cart" + " WHERE login_id = ?" + " AND register_no = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, login_id);
			psmt.setInt(2, register_no);
			rs = psmt.executeQuery();

			if (rs.next()) {
				cartDTO = new CartDTO();
				cartDTO.setLogin_id(rs.getString("login_id"));
				cartDTO.setRegister_no(rs.getInt("register_no"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return cartDTO;
	}

	/** 상품을 장바구니에 추가 상품의 register_no값을 넣는다 */
	public boolean insertProductToCart(String login_id, int register_no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "INSERT INTO cart (login_id, register_no)" + " VALUES (?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, login_id);
			psmt.setInt(2, register_no);
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

	/** 상품을 장바구니에서 삭제. 상품의 register_no로 동작. 반복적인 쿼리를 날리지 않고 한 건만 날림. */
	public boolean deleteProductInCart(String login_id, int[] register_no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		// 매개변수 register_no[] 길이만큼 ? 뒤에 ,? 를 반복해서 붙인다. ?,?,?,? ...
		String sql_psmt = "?";
		for (int i = 1; i < register_no.length; i++) {
			sql_psmt += ", ?";
			// System.out.println(register_no[i] + ", ? 갯수 늘리기");
		}

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "DELETE cart WHERE login_id = ?" + " AND register_no IN (" + sql_psmt + ")";
			System.out.println(sql);
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, login_id);

			// 늘어난 ? 만큼 psmt 값 설정
			for (int i = 0; i < register_no.length; i++) {
				System.out.printf("psmt.setInt(%d, %d) 추가\n", (i + 2), register_no[i]);
				psmt.setInt(i + 2, register_no[i]);
			}

			result = psmt.executeUpdate();
			System.out.println(result + " 행 삭제완료");

			if (result >= 1) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return false;
	}

	/** 구매된 상품 장바구니 테이블에서 제거 */
	public boolean deleteCart() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "DELETE cart WHERE register_no IN "
					+ " (SELECT register_no FROM gifticon WHERE login_id IS NOT NULL)";
			psmt = conn.prepareStatement(sql);
			result = psmt.executeUpdate();

			if (result >= 1) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return false;
	}

	/** 선택 상품을 모두 구매처리. 상품의 register_no로 동작. 반복적인 쿼리를 날리지 않고 한 건만 날림. */
	public boolean buyProductByRegister_no(String login_id, int[] register_no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		// 매개변수 register_no[] 길이만큼 ? 뒤에 ,? 를 반복해서 붙인다. ?,?,?,? ...
		String sql_psmt = "?";
		for (int i = 1; i < register_no.length; i++) {
			sql_psmt += ", ?";
			// System.out.println(register_no[i] + ", ? 갯수 늘리기");
		}

		try {
			conn = DBConnectionManager.getConnection();

			
			String sql = "UPDATE gifticon SET login_id = ? WHERE login_id IS NULL AND register_no IN (" + sql_psmt + ")";
			System.out.println(sql);
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, login_id);

			// 늘어난 ? 만큼 psmt 값 설정
			for (int i = 0; i < register_no.length; i++) {
				System.out.printf("psmt.setInt(%d, %d) 추가\n", (i + 2), register_no[i]);
				psmt.setInt(i + 2, register_no[i]);
			}

			result = psmt.executeUpdate();
			System.out.println(result + " 건 구매 처리완료");

			if (result >= 1) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return false;
	}

}
