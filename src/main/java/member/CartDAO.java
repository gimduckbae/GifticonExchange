package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class CartDAO {

	/** CART 테이블의 모든 정보를 List<CartDTO> 형식으로 가져오는 메소드 */
	public List<CartDTO> selectAllCartByLogin_Id(String login_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<CartDTO> cartList = new ArrayList<CartDTO>();

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT login_id, register_no FROM cart" + " WHERE login_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, login_id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				CartDTO cartDTO = new CartDTO();
				cartDTO.setLogin_id(rs.getString("login_id"));
				cartDTO.setRegister_no(rs.getInt("register_no"));
				cartList.add(cartDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return cartList;
	}

}
