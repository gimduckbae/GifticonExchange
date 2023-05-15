package image_file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;
import event.EventDTO;

public class Image_FileDAO {

	public List<Image_FileDTO> selectAllImage_FileList() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		Image_FileDTO image_FileDTO = null;
		List<Image_FileDTO> image_fileDTOs = new ArrayList<Image_FileDTO>();

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT * FROM image_file";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				image_FileDTO = new Image_FileDTO();
				image_FileDTO.setFile_path(rs.getString("file_path"));
				image_FileDTO.setFile_name(rs.getString("file_name"));
				image_fileDTOs.add(image_FileDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return image_fileDTOs;
	}

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

	/** IMAGE_FILE 테이블에 정보 집어넣는 메소드 */
	public int insertImage_File(String file_path, String file_name) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "INSERT INTO image_file" + " VALUES(?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, file_path);
			psmt.setString(2, file_name);
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

}
