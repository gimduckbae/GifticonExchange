package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.PostDTO;
import dbconn.DBConnectionManager;

public class PostDAO {

	/** POST 테이블의 모든 정보를 List<PostDTO> 형식으로 가져오는 메소드 */
	public List<PostDTO> selectAllPostList() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<PostDTO> postList = new ArrayList<PostDTO>();

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT *  FROM post";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				PostDTO postDTO = new PostDTO();
				postDTO.setBoard_no(rs.getInt("board_no"));
				postDTO.setPost_no(rs.getInt("post_no"));
				postDTO.setContent(rs.getString("content"));
				postDTO.setAnswer(rs.getString("answer"));
				postDTO.setStatus(rs.getInt("status"));
				postList.add(postDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return postList;
	}

}
