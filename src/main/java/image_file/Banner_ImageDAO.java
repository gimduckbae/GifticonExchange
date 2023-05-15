package image_file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class Banner_ImageDAO {

	/** BANNER_IMAGE 테이블의 정보 한 줄을 no로 찾아서 가져오는 메소드 */
	public Banner_ImageDTO selectBanner_ImageByNo(int no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		Banner_ImageDTO banner_ImageDTO = null;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT banner_no, file_path, file_name  FROM banner_image WHERE no = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, no);
			rs = psmt.executeQuery();

			if (rs.next()) {
				banner_ImageDTO = new Banner_ImageDTO();
				banner_ImageDTO.setBanner_no(rs.getInt("banner_no"));
				banner_ImageDTO.setFile_path(rs.getString("file_path"));
				banner_ImageDTO.setFile_name(rs.getString("file_name"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return banner_ImageDTO;
	}

	/** BANNER_IMAGE 테이블의 모든 정보를 List<Banner_ImageDTO> 형식으로 가져오는 메소드 */
	public List<Banner_ImageDTO> selectAllBanner_ImageList() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<Banner_ImageDTO> banner_ImageList = new ArrayList<Banner_ImageDTO>();

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT banner_no, file_path, file_name  FROM banner_image";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				Banner_ImageDTO banner_ImageDTO = new Banner_ImageDTO();
				banner_ImageDTO.setBanner_no(rs.getInt("banner_no"));
				banner_ImageDTO.setFile_path(rs.getString("file_path"));
				banner_ImageDTO.setFile_name(rs.getString("file_name"));
				banner_ImageList.add(banner_ImageDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return banner_ImageList;
	}

	/** Banner_ImageDTO에 담긴 데이터를 BANNER_IMAGE 테이블에 넣는 메소드 */
	public int insertBanner_Image(Banner_ImageDTO banner_ImageDTO) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "INSERT INTO banner_image (banner_no, file_path, file_name)"
					+ " VALUES( (SELECT NVL(MAX(banner_no), 0)+1 FROM banner_image) ,?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, banner_ImageDTO.getFile_path());
			psmt.setString(2, banner_ImageDTO.getFile_name());
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}
	
	public int insertBanner_Image(int banner_no, String file_path, String file_name) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "INSERT INTO banner_image " + " VALUES( ? ,?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, banner_no);
			psmt.setString(2, file_path);
			psmt.setString(3, file_name);
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

}
