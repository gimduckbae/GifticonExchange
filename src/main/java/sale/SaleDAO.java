package sale;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class SaleDAO {

	public List<SaleDTO> selectAllProduct() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		SaleDTO saleDTO = null;
		List<SaleDTO> items = new ArrayList<SaleDTO>();
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "SELECT * FROM sale_item";
			
			psmt = conn.prepareStatement(sql);
			
			
			rs = psmt.executeQuery();
			
			
			while (rs.next()) {				
				saleDTO = new SaleDTO();
				saleDTO.setBrandname(rs.getString("brandname"));
				saleDTO.setBrandcode(rs.getString("brandcode"));
				saleDTO.setItem_img(rs.getString("item_img"));
				saleDTO.setSaleprice(rs.getInt("saleprice"));
				items.add(saleDTO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return items;
	}
	
	//insert
			public int insertSaleInfo(String brandname, String brandcode, String item_img, int saleprice) {

				Connection conn = null;
				PreparedStatement psmt = null;
				ResultSet rs = null;
				int result = 0;
				try {
					conn = DBConnectionManager.getConnection();

					// 쿼리문!
					String sql = "insert into sale_item"
							+" values( ?, ?, ?, ?)";

					psmt = conn.prepareStatement(sql);
					psmt.setString(1, brandname);
					psmt.setString(2, brandcode);
					psmt.setString(3, item_img);
					psmt.setInt(4, saleprice);
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
