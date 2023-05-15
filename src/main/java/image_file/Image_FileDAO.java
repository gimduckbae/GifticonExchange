package image_file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBConnectionManager;

public class Image_FileDAO {

	/** IMAGE_FILE 테이블에 정보 집어넣는 메소드 */
	public int insertImage_File(Image_FileDTO image_FileDTO) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "INSERT INTO image_file" + " VALUES(?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, image_FileDTO.getFile_path());
			psmt.setString(2, image_FileDTO.getFile_name());
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

}
