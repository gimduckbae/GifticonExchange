package sample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBConnectionManager;

public class SampleDao {

	/** member 테이블에서 no로 한명 찾기 */
	public SampleDto selectMemberByNo(int no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		SampleDto sampleDto = null;
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "SELECT * FROM member WHERE no = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, no);
			
			rs = psmt.executeQuery();
			
			
			if (rs.next()) {				
				sampleDto = new SampleDto();
				sampleDto.setNo(rs.getInt("no"));
				sampleDto.setName(rs.getString("name"));
				sampleDto.setJumin(rs.getString("jumin"));
				sampleDto.setPasswd(rs.getString("passwd"));
				sampleDto.setId(rs.getString("id"));
				sampleDto.setAn_key(rs.getString("an_key"));
				sampleDto.setAn_key_dap(rs.getString("an_key_dap"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return sampleDto;
	}
}
