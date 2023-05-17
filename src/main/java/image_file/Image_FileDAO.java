package image_file;

import java.io.File;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class Image_FileDAO {

	/** 모든 상품이미지 정보 가져오기 */
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

	/** 배너번호로 배너정보 가져오기 */
	public Image_FileDTO selectBannerByBannerNo(int banner_no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		Image_FileDTO image_FileDTO = null;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT file_no, file_name, banner_no FROM image_file" + " WHERE banner_no = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, banner_no);
			rs = psmt.executeQuery();

			if (rs.next()) {
				image_FileDTO = new Image_FileDTO();
				image_FileDTO.setFile_no(rs.getInt("file_no"));
				image_FileDTO.setFile_name(rs.getString("file_name"));
				image_FileDTO.setBanner_no(rs.getInt("banner_no"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return image_FileDTO;
	}

	/** 파일 경로로 배너 이미지 추가 */
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

	/** 파일 경로로 상품 이미지 추가 */
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

	/** 배너 번호로 삭제하기 */
	public boolean deleteBannerByNo(int banner_no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		CallableStatement cstmt = null;

		try {
			conn = DBConnectionManager.getConnection();
			cstmt = conn.prepareCall("{call DELETE_BANNER(?)}");
			cstmt.setInt(1, banner_no);
			rs = cstmt.executeQuery();
			cstmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return false;
	}

	/** 실제 파일 삭제처리 */
	public boolean deleteFileByName(String file_name) {

		File f = new File(file_name);
		if (f.exists()) {
			f.delete();
			System.out.printf("삭제완료: %s\n", file_name);
			return true;
		}
		return false;
	}

}
