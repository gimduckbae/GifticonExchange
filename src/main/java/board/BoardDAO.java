package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class BoardDAO {

	/** BOARD 테이블의 정보 한 줄을 board_no로 찾아서 가져오는 메소드 */
	public BoardDTO selectBoardByBoard_No(int board_no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BoardDTO boardDTO = null;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT board_no, post_no, login_id, title"
					+ ", TO_CHAR(create_date, 'YYYY-MM-DD') create_date"
					+ ", TO_CHAR(modify_date, 'YYYY-MM-DD') modify_date" + " FROM board WHERE board_no = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, board_no);
			rs = psmt.executeQuery();

			if (rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setBoard_no(rs.getInt("board_no"));
				boardDTO.setPost_no(rs.getInt("post_no"));
				boardDTO.setLogin_id(rs.getString("login_id"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setCreate_date(rs.getString("create_date"));
				boardDTO.setModify_date(rs.getString("modify_date"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return boardDTO;
	}

	/** BOARD 테이블의 모든 정보를 List<BoardDTO> 형식으로 가져오는 메소드 */
	public List<BoardDTO> selectAllBoardList() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT board_no, post_no, login_id, title"
					+ ", TO_CHAR(create_date, 'YYYY-MM-DD') create_date"
					+ ", TO_CHAR(modify_date, 'YYYY-MM-DD') modify_date" + " FROM board";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setBoard_no(rs.getInt("board_no"));
				boardDTO.setPost_no(rs.getInt("post_no"));
				boardDTO.setLogin_id(rs.getString("login_id"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setCreate_date(rs.getString("create_date"));
				boardDTO.setModify_date(rs.getString("modify_date"));
				boardList.add(boardDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return boardList;
	}

	/** BoardDTO에 담긴 데이터로 새로운 게시글 추가하기 */
	public int insertNewPost(BoardDTO boardDTO) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "INSERT ALL"
						+ " INTO board (board_no, post_no, login_id, title)"
						+ " VALUES (?, (SELECT NVL(MAX(post_no), 0)+1 FROM board), ?, ?)"
						+ " INTO post (board_no, post_no, content)"
						+ " VALUES (?, (SELECT NVL(MAX(post_no), 0)+1 FROM board), ?)"
						+ " SELECT * FROM dual";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardDTO.getBoard_no());
			psmt.setString(2, boardDTO.getLogin_id());
			psmt.setString(3, boardDTO.getTitle());
			psmt.setInt(4, boardDTO.getBoard_no());
			psmt.setString(5, boardDTO.getTitle());
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

}
