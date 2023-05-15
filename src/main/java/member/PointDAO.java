package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBConnectionManager;

public class PointDAO {

	/** 한 사람의 포인트 정보를 login_id로 조회하고 PointDTO 형식으로 가져오는 메소드 */
	public PointDTO selectMemberById(String login_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		PointDTO pointDTO = null;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT login_id, point, withdraw FROM point WHERE login_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, login_id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				pointDTO = new PointDTO();
				pointDTO.setLogin_id(rs.getString("login_id"));
				pointDTO.setPoint(rs.getInt("point"));
				pointDTO.setWithdraw(rs.getInt("withdraw"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return pointDTO;
	}

}
