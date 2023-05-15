package history;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBConnectionManager;

public class TransActionDAO {

	/** TransActionDAO 형식을 매개변수로 받아서 TRANSACTION_HISTORY 테이블에 insert 하는 메소드. 성공하면 true 리턴 */
	public boolean insertTransActionHistory(TransActionDTO transActionDTO) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "INSERT INTO transaction_history (login_id, amount, type)" + " VALUES (?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, transActionDTO.getLogin_id());
			psmt.setInt(2, transActionDTO.getAmount());
			psmt.setInt(3, transActionDTO.getType());

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
