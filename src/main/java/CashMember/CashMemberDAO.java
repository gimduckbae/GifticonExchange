package CashMember;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.security.auth.login.AccountException;
import javax.sql.DataSource;

import dbconn.DBConnectionManager;
import CashMember.CashMemberDTO;


public class CashMemberDAO {
	

	  
	 //이름 조회 
	public CashMemberDTO selectMemberById(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		CashMemberDTO cashMemberDTO =null;
		
		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT * FROM cashout WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				cashMemberDTO = new CashMemberDTO();
				cashMemberDTO.setName(rs.getString("name"));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return cashMemberDTO;
	}
	
	//출금
	public boolean withdraw(String name, int account, int cash, int cashout) {

	    Connection conn = null;
	    PreparedStatement psmt = null;
	    ResultSet rs = null;
	    int rs2 = 0;
	    boolean result = false;

	    try {
	        conn = DBConnectionManager.getConnection();
	        conn.setAutoCommit(false); // Set auto-commit to false for transaction handling

	        // First SQL statement
	        String sql = "UPDATE cashwithdraw SET cash = cash - ? WHERE name = ? AND cashout = ?";
	        psmt = conn.prepareStatement(sql);
	        psmt.setInt(1, cash);
	        psmt.setString(2, name);
	        psmt.setInt(3, cashout);
	        rs2 = psmt.executeUpdate();

	        if (rs2 == 0) {
	            conn.rollback(); // Rollback the transaction if update fails
	            return result;
	        }
	        psmt.close();

	        // Second SQL statement
	        sql = "UPDATE cashwithdraw SET cashout = cashout + ? WHERE name = ? AND account = ?";
	        psmt = conn.prepareStatement(sql);
	        psmt.setInt(1, cashout);
	        psmt.setString(2, name);
	        psmt.setInt(3, account);
	        rs2 = psmt.executeUpdate();

	        if (rs2 > 0) {
	            conn.commit(); // Commit the transaction if update succeeds
	            result = true;
	        } else {
	            conn.rollback(); // Rollback the transaction if update fails
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (psmt != null) {
	                psmt.close();
	            }
	            if (conn != null) {
	                conn.setAutoCommit(true); // Reset auto-commit to true
	                conn.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return result;
	}
	
	
	
	  DataSource ds;
	
	 // 모든계좌정보 검색
	
	public ArrayList<CashMemberDTO> getBank(CashMemberDTO dto){
		ArrayList<CashMemberDTO> list = new ArrayList<CashMemberDTO>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int rs2 = 0;
		
			
		
		try {
			
			conn=ds.getConnection();
			String sql ="SELECT *from cashwithdraw where name in (?,?)";
			
			psmt=conn.prepareStatement(sql);
			psmt.setString(1,dto.getName());
			psmt.setInt(2, dto.getAccount());
			
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				CashMemberDTO cashMemberDTO = new CashMemberDTO();
				
				cashMemberDTO.setAccount(rs.getInt(1)); //계자ㅗ번호
				cashMemberDTO.setName(rs.getString(2));//이름
				cashMemberDTO.setCashout(rs.getInt(3));//금액임

				list.add(cashMemberDTO);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return list;
	}
	
	
    public int getBalance(Connection conn, String id) throws SQLException {
        int balance = 0;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        
        try {
            String query = "SELECT * FROM cashout WHERE cashout = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            
            
            
            if (rs.next()) {
                balance = rs.getInt("cashout");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            DBConnectionManager.close(rs, pstmt,conn);
        }
        
        return balance;
    }

    
    
}