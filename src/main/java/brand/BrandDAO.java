package brand;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class BrandDAO {
	
	public List<BrandDTO> selectAllBrands() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BrandDTO brandDTO = null;
		List<BrandDTO> brands = new ArrayList<BrandDTO>();
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "SELECT * FROM brand";
			
			psmt = conn.prepareStatement(sql);
			
			
			rs = psmt.executeQuery();
			
			
			while (rs.next()) {				
				brandDTO = new BrandDTO();
				brandDTO.setBr_name(rs.getString("br_name"));
				brandDTO.setBr_img(rs.getString("br_img"));
				brands.add(brandDTO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return brands;
	}
	
	//insert
			public int insertBrandInfo(String br_name, String br_img) {

				Connection conn = null;
				PreparedStatement psmt = null;
				ResultSet rs = null;
				int result = 0;
				try {
					conn = DBConnectionManager.getConnection();

					// 쿼리문!
					String sql = "insert into brand"
							+" values( ?, ?)";

					psmt = conn.prepareStatement(sql);
					psmt.setString(1, br_name);
					psmt.setString(2, br_img);
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
