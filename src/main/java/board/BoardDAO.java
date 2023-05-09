package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class BoardDAO {
	
	public BoardDTO selectBoardByNo(int no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BoardDTO boardDTO = null;
		

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT TO_CHAR(create_date, 'YYYY-MM-DD') create_date, no, category, title, writer, nickname, status,"
					+ " (SELECT content FROM board_text WHERE no = ?) content"
					+ " FROM board_info"
					+ " WHERE no = ?"
					+ " ORDER BY no DESC";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, no);
			psmt.setInt(2, no);

			rs = psmt.executeQuery();

			if (rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setCreate_date(rs.getString("create_date"));
				boardDTO.setNo(rs.getInt("no"));
				boardDTO.setCategory(rs.getInt("category"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setWriter(rs.getString("writer"));
				boardDTO.setNickname(rs.getString("nickname"));
				boardDTO.setStatus(rs.getInt("status"));
				boardDTO.setContent(rs.getString("content"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return boardDTO;
	}
	
	@SuppressWarnings("null")	// null 관련 경고하지마 라는 어노테이션
	public List<BoardDTO> selectAllFromBoard() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT TO_CHAR(create_date, 'YYYY-MM-DD') create_date, no, category, title, writer, nickname, status FROM board_info"
					+ " ORDER BY no DESC";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				BoardDTO temp = new BoardDTO();
				temp.setCreate_date(rs.getString("create_date"));
				temp.setNo(rs.getInt("no"));
				temp.setCategory(rs.getInt("category"));
				temp.setTitle(rs.getString("title"));
				temp.setWriter(rs.getString("writer"));
				temp.setNickname(rs.getString("nickname"));
				temp.setStatus(rs.getInt("status"));
				result.add(temp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}
	

	public boolean insertBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "INSERT ALL"
					+ " INTO board_info (no, category, title, writer, nickname) VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board_info), ?, ?, ?, ?)"
					+ " INTO board_text (no, content, writer) VALUES ((SELECT NVL(MAX(no)+1, 1) FROM board_text), ?, ?)"
					+ " SELECT * FROM dual";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, board.getCategory());
			psmt.setString(2, board.getTitle());
			psmt.setString(3, board.getWriter());
			psmt.setString(4, board.getNickname());
			psmt.setString(5, board.getContent());
			psmt.setString(6, board.getWriter());

			result = psmt.executeUpdate();

			if (result == 2) {
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
