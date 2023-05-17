package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class PointDAO {
	/** 한 사람의 포인트 정보를 login_id로 조회하고 PointDTO 형식으로 가져오는 메소드 */
	public PointDTO selectMemberById(String login_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		PointDTO pointDTO = null;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT login_id, point, withdraw FROM point WHERE login_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, login_id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				pointDTO = new PointDTO();
				pointDTO.setLogin_id(rs.getString("login_id"));
				pointDTO.setPoint(rs.getInt("point"));
				pointDTO.setWithdraw(rs.getInt("withdraw"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return pointDTO;
	}

	// 출금
	public int withdraw(String login_id, int withdraw) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "UPDATE Point SET point = point - ?,withdraw= withdraw +?  WHERE login_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, withdraw); // 출금할 포인트 설정
			psmt.setInt(2, withdraw); // 출금할 포인트 설정
			psmt.setString(3, login_id);

			System.out.println("id" + login_id);
			System.out.println("출금액: " + withdraw);

			result = psmt.executeUpdate();
			System.out.println("result: "+result);
			// if() {
			// 출금 후에 withdraw 변수를 0으로 초기화 미완성
//	        sql = "UPDATE Point SET withdraw = 0 WHERE login_id = ?";
//	        psmt = conn.prepareStatement(sql);
//	        psmt.setString(1, login_id);
//	        psmt.executeUpdate();
//		}else {

//		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return result;
	}

	/** 출금 대기 인원 조회 */

	public List<PointDTO> selectAllWithdraw() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<PointDTO> withdrawlist = new ArrayList<PointDTO>();

		try {
			conn = DBConnectionManager.getConnection();
			String sql = " select login_id,point, withdraw" + " from point  where withdraw>=0"; //놓친거
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				PointDTO pointDTO = new PointDTO();
				pointDTO.setLogin_id(rs.getString("login_id"));
				pointDTO.setPoint(rs.getInt("point"));
				pointDTO.setWithdraw(rs.getInt("withdraw"));
				withdrawlist.add(pointDTO);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return withdrawlist;
	}

	
	// 거부했을 때
	public int deletePointInfo(String login_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			// Delete record from POINT table

			String sql = "update point set point = point + withdraw WHERE login_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, login_id);
			result = psmt.executeUpdate();

			System.out.println("처리결과: " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}
	
//동의했을때
	public int updatePointInfo(String login_id) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
 
			// 쿼리문!											//놓친거
			String sql = "UPDATE POINT SET WITHDRAW=0  WHERE login_id = ?"; 

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, login_id);
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
