package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBConnectionManager;

public class BoardDAO {

	public boolean insertBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "INSERT INTO board_info (no, category, title, writer, nickname)"
					+ " VALUSE( (SELECT NVL(MAX(no), 1 FROM board_info ), ?, ?, ?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, board.getCategory());
			psmt.setString(2, board.getTitle());
			psmt.setString(3, board.getWriter());
			psmt.setString(4, board.getNickname());

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
