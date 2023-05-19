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
	public BoardDTO selectPostByPost_No(int post_no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BoardDTO boardDTO = null;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT b.board_no, b.post_no, b.login_id, b.title"
					+ ", TO_CHAR(b.create_date, 'YYYY-MM-DD') create_date"
					+ ", TO_CHAR(b.modify_date, 'YYYY-MM-DD') modify_date"
					+ ", DECODE(b.status, 0, '답변대기중', 1, '답변완료') status"
					+ ", p.content, NVL(p.answer, ' ') answer, NVL2(p.answer_date, TO_CHAR(p.answer_date, 'YYYY-MM-DD'), '답변대기중' ) answer_date"
					+ " FROM board b LEFT OUTER JOIN post p ON b.post_no = p.post_no" + " WHERE b.post_no = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, post_no);
			rs = psmt.executeQuery();

			if (rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setBoard_no(rs.getInt("board_no"));
				boardDTO.setPost_no(rs.getInt("post_no"));
				boardDTO.setLogin_id(rs.getString("login_id"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setCreate_date(rs.getString("create_date"));
				boardDTO.setModify_date(rs.getString("modify_date"));
				boardDTO.setStatus(rs.getString("status"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setAnswer(rs.getString("answer"));
				boardDTO.setAnswer_date(rs.getString("answer_date"));
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
			String sql = "SELECT board_no, post_no, substr(login_id,1,length(login_id)-3)||lpad('*',3,'*') login_id, title"
					+ ", TO_CHAR(create_date, 'YYYY-MM-DD') create_date"
					+ ", TO_CHAR(modify_date, 'YYYY-MM-DD') modify_date"
					+ ", DECODE(status, 0, '답변대기중', 1, '답변완료') status"
					+ ", login_id login_id_org" + " FROM board ORDER BY post_no DESC";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setBoard_no(rs.getInt("board_no"));
				boardDTO.setPost_no(rs.getInt("post_no"));
				boardDTO.setLogin_id(rs.getString("login_id"));
				boardDTO.setLogin_id_org(rs.getString("login_id_org"));
				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setCreate_date(rs.getString("create_date"));
				boardDTO.setModify_date(rs.getString("modify_date"));
				boardDTO.setStatus(rs.getString("status"));
				boardList.add(boardDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return boardList;
	}
	
	
	/** 답변 대기중인 문의내용 불러오기 */
	public List<BoardDTO> selectAllQuestionList() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT board_no, post_no, substr(login_id,1,length(login_id)-3)||lpad('*',3,'*') login_id, title"
					+ ", TO_CHAR(create_date, 'YYYY-MM-DD') create_date"
					+ ", TO_CHAR(modify_date, 'YYYY-MM-DD') modify_date"
					+ ", DECODE(status, 0, '답변대기중', 1, '답변완료') status"
					+ " FROM board WHERE status = 0 ORDER BY post_no DESC";
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
				boardDTO.setStatus(rs.getString("status"));
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
			String sql = "INSERT ALL" + " INTO board (board_no, post_no, login_id, title)"
					+ " VALUES (?, (SELECT NVL(MAX(post_no), 0)+1 FROM board), ?, ?)"
					+ " INTO post (board_no, post_no, content)"
					+ " VALUES (?, (SELECT NVL(MAX(post_no), 0)+1 FROM board), ?)" + " SELECT * FROM dual";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardDTO.getBoard_no());
			psmt.setString(2, boardDTO.getLogin_id());
			psmt.setString(3, boardDTO.getTitle());
			psmt.setInt(4, boardDTO.getBoard_no());
			psmt.setString(5, boardDTO.getContent());
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

	/** post_no로 해당 문의 답변하기 */
	public int answerPost(int post_no, String answer) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "UPDATE post SET answer = ?, answer_date = SYSDATE WHERE post_no = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, answer);
			psmt.setInt(2, post_no);
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

	/** post_no로 해당 문의 답변상태 완료로 업데이트 하기 */
	public int answerPost2(int post_no) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "UPDATE board SET status = 1 WHERE post_no = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, post_no);
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

}
