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

	public List<Image_FileDTO> selectAllProductImage() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<Image_FileDTO> image_fileDTOs = new ArrayList<Image_FileDTO>();

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT file_no, file_name, banner_no,"
					+ " SUBSTR(file_name, 1, INSTR(file_name, '.')-1) org_name"
					+ " FROM image_file WHERE banner_no IS NULL";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				Image_FileDTO image_FileDTO = new Image_FileDTO();
				image_FileDTO.setFile_no(rs.getInt("file_no"));
				image_FileDTO.setFile_name(rs.getString("file_name"));
				image_FileDTO.setBanner_no(rs.getInt("banner_no"));
				image_FileDTO.setOrg_name(rs.getString("org_name"));
				image_fileDTOs.add(image_FileDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return image_fileDTOs;
	}

	/** 배너로 등록된 모든 이미지 가져오기 */
	public List<Image_FileDTO> selectAllBannerImage() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<Image_FileDTO> image_fileDTOs = new ArrayList<Image_FileDTO>();

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT file_no, file_name, banner_no FROM image_file" + " WHERE banner_no IS NOT NULL";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				Image_FileDTO image_FileDTO = new Image_FileDTO();
				image_FileDTO.setFile_no(rs.getInt("file_no"));
				image_FileDTO.setFile_name(rs.getString("file_name"));
				image_FileDTO.setBanner_no(rs.getInt("banner_no"));
				image_fileDTOs.add(image_FileDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return image_fileDTOs;
	}

	/** 배너 이미지 추가 */
	public int insertBannerImage(String file_path) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "INSERT INTO image_file (file_no, file_name, banner_no)"
					+ " VALUES ((SELECT NVL(MAX(file_no), 0)+1 FROM image_file), ?,"
					+ " (SELECT NVL(MAX(banner_no), 0)+1 FROM image_file))";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, file_path);
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

	/** 상품 이미지 추가 */
	public int insertProductImage(String file_path) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "INSERT INTO image_file (file_no, file_name)"
					+ " VALUES ((SELECT NVL(MAX(file_no), 0)+1 FROM image_file), ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, file_path);
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

}
