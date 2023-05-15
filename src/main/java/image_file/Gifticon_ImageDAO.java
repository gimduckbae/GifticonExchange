package image_file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class Gifticon_ImageDAO {

	/** GIFTICON_IMAGE 테이블의 정보 한 줄을 register_no로 찾아서 가져오는 메소드 */
	public Gifticon_ImageDTO selectGifticon_ImageByRegisterNo(int register_no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		Gifticon_ImageDTO gifticon_ImageDTO = null;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT register_no, file_path, file_name  FROM gifticon_image WHERE register_no = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, register_no);
			rs = psmt.executeQuery();

			if (rs.next()) {
				gifticon_ImageDTO = new Gifticon_ImageDTO();
				gifticon_ImageDTO.setRegister_no(rs.getInt("register_no"));
				gifticon_ImageDTO.setFile_path(rs.getString("file_path"));
				gifticon_ImageDTO.setFile_name(rs.getString("file_name"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return gifticon_ImageDTO;
	}

	/** GIFTICON_IMAGE 테이블의 모든 정보를 List<Gifticon_ImageDTO> 형식으로 가져오는 메소드 */
	public List<Gifticon_ImageDTO> selectAllGifticon_Image() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<Gifticon_ImageDTO> gifticon_ImageList = new ArrayList<Gifticon_ImageDTO>();

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT register_no, file_path, file_name  FROM gifticon_image";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				Gifticon_ImageDTO gifticon_ImageDTO = new Gifticon_ImageDTO();
				gifticon_ImageDTO.setRegister_no(rs.getInt("register_no"));
				gifticon_ImageDTO.setFile_path(rs.getString("file_path"));
				gifticon_ImageDTO.setFile_name(rs.getString("file_name"));
				gifticon_ImageList.add(gifticon_ImageDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return gifticon_ImageList;
	}

	/** Gifticon_ImageDTO에 담긴 데이터를 GIFTICON_IMAGE 테이블에 넣는 메소드 */
	public int insertGifticon_Image(Gifticon_ImageDTO gifticon_ImageDTO) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();
			String sql = "INSERT INTO gifticon_image (register_no, file_path, file_name)" + " VALUES(? ,?, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, gifticon_ImageDTO.getRegister_no());
			psmt.setString(2, gifticon_ImageDTO.getFile_path());
			psmt.setString(3, gifticon_ImageDTO.getFile_name());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

}
