package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class PointDAO {

	/** 한 사람의 포인트 테이블 정보를 login_id로 조회하고 PointDTO 형식으로 가져오는 메소드 */
	public PointDTO selectPointById(String login_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		PointDTO pointDTO = null;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT login_id, point, withdraw, TO_CHAR(point, '999,999,999') point_char,"
					+ " TO_CHAR(withdraw, '999,999,999') withdraw_char FROM point WHERE login_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, login_id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				pointDTO = new PointDTO();
				pointDTO.setLogin_id(rs.getString("login_id"));
				pointDTO.setPoint(rs.getInt("point"));
				pointDTO.setWithdraw(rs.getInt("withdraw"));
				pointDTO.setPoint_char(rs.getString("point_char"));
				pointDTO.setWithdraw_char(rs.getString("withdraw_char"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return pointDTO;
	}

	/** 출금신청한 사람 정보조회 */
	public List<PointDTO> selectWaitingWithdraw() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<PointDTO> list = new ArrayList<PointDTO>();

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "SELECT login_id, point, withdraw, TO_CHAR(point, '999,999,999') point_char,"
					+ " TO_CHAR(withdraw, '999,999,999') withdraw_char FROM point WHERE withdraw > 0";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			if (rs.next()) {
				PointDTO pointDTO = new PointDTO();
				pointDTO.setLogin_id(rs.getString("login_id"));
				pointDTO.setPoint(rs.getInt("point"));
				pointDTO.setWithdraw(rs.getInt("withdraw"));
				pointDTO.setPoint_char(rs.getString("point_char"));
				pointDTO.setWithdraw_char(rs.getString("withdraw_char"));
				list.add(pointDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return list;
	}

	/** login_id 와 충전금액으로 포인트 충전하기 (UPDATE 쿼리문) */
	public int chargePoint(String login_id, int add_amount) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "UPDATE point SET" + " point = point+?" + " WHERE login_id = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, add_amount);
			psmt.setString(2, login_id);
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

	// 출금 처리
	public int withdraw(String login_id, int withdraw) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "UPDATE point SET point = point - ?, withdraw = withdraw + ?  WHERE login_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, withdraw); // 출금할 포인트 설정
			psmt.setInt(2, withdraw);
			psmt.setString(3, login_id);

			System.out.println("id" + login_id);
			System.out.println("출금액: " + withdraw);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return result;
	}

	// 출금 처리
	public int withdrawNo(String login_id, int withdraw) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "UPDATE point SET point = point + ?, withdraw = withdraw - ?  WHERE login_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, withdraw); // 출금할 포인트 설정
			psmt.setInt(2, withdraw);
			psmt.setString(3, login_id);

			System.out.println("id" + login_id);
			System.out.println("출금액: " + withdraw);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return result;
	}

}
