package history;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBConnectionManager;

public class ShoppingDAO {

	/** ShoppingDTO 형식을 매개변수로 받아서 SHOPPING_HISTORY 테이블에 insert 하는 메소드. 성공하면 true 리턴 */
	public boolean insertShoppingHistory(ShoppingDTO shoppingDTO) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "INSERT INTO shopping_history (login_id, register_no, type)" + " VALUES (?, ?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, shoppingDTO.getLogin_id());
			psmt.setInt(2, shoppingDTO.getRegister_no());
			psmt.setInt(3, shoppingDTO.getType());

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

}
