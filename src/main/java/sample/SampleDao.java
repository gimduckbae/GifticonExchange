package sample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class SampleDao {

	/** member 테이블에서 no로 한명 찾기 */
	public List<SampleDto> selectAllProduct() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		SampleDto sampleDto = null;
		List<SampleDto> items = new ArrayList<SampleDto>();
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "SELECT * FROM sale_sample";
			
			psmt = conn.prepareStatement(sql);
			
			
			rs = psmt.executeQuery();
			
			
			while (rs.next()) {				
				sampleDto = new SampleDto();
				sampleDto.setBrandname(rs.getString("brandname"));
				sampleDto.setBrandcode(rs.getString("brandcode"));
				sampleDto.setSaleprice(rs.getInt("saleprice"));
				sampleDto.setImg(rs.getString("img"));
				items.add(sampleDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return items;
	}
	
	//insert
			public int insertSampleInfo(String brandname, String brandcode, int saleprice, String img) {

				Connection conn = null;
				PreparedStatement psmt = null;
				ResultSet rs = null;
				int result = 0;
				try {
					conn = DBConnectionManager.getConnection();

					// 쿼리문!
					String sql = "insert into sale_sample"
							+" values( ?, ?, ?, ?)";

					psmt = conn.prepareStatement(sql);
					psmt.setString(1, brandname);
					psmt.setString(2, brandcode);
					psmt.setInt(3, saleprice);
					psmt.setString(4, img);
					result = psmt.executeUpdate();

					System.out.println("처리결과:" + result);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					DBConnectionManager.close(rs, psmt, conn);
				}

				return result;
			}
}
