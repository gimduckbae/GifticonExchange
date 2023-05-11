package item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class ItemDAO {
	
	public List<ItemDTO> selectAllItems() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<ItemDTO> items = new ArrayList<ItemDTO>();
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "SELECT it_name, it_img, TO_CHAR(it_price, 'FM999,999,999,999') AS it_price  "
					+ " FROM item";
			
			psmt = conn.prepareStatement(sql);
			
			
			rs = psmt.executeQuery();
			
			
			while (rs.next()) {				
				ItemDTO itemDTO = new ItemDTO();
				itemDTO.setIt_name(rs.getString("it_name"));
				itemDTO.setIt_img(rs.getString("it_img"));
				itemDTO.setIt_price(rs.getString("it_price"));
				items.add(itemDTO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return items;
	}
	
	//insert
			public int insertItemsInfo(String it_name, String it_img, int it_price) {

				Connection conn = null;
				PreparedStatement psmt = null;
				ResultSet rs = null;
				int result = 0;
				try {
					conn = DBConnectionManager.getConnection();

					// 쿼리문!
					String sql = "insert into item"
							+" values( ?, ?, ?)";

					psmt = conn.prepareStatement(sql);
					psmt.setString(1, it_name);
					psmt.setString(2, it_img);
					psmt.setInt(3, it_price);
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
