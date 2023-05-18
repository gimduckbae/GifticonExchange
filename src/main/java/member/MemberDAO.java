package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class MemberDAO {

	private static final String nickname = null;
	private static final String password = null;

	/** member_tb 테이블에서 한사람의 정보를 login_id 값으로 조회 */
	public MemberDTO selectMemberById(String id) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberDTO memberDTO = null;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT member_no, login_id, password, member_name, nickname, TO_CHAR(join_date, 'YYYY-MM-dd') join_date FROM member WHERE login_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setMember_no(rs.getInt("member_no"));
				memberDTO.setLogin_id(rs.getString("login_id"));
				memberDTO.setPassword(rs.getString("password"));
				memberDTO.setMember_name(rs.getString("member_name"));
				memberDTO.setNickname(rs.getString("nickname"));
				memberDTO.setJoin_date(rs.getString("join_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return memberDTO;
	}

	/**
	 * MemberDTO 형식을 매개변수로 받아서 member_tb 테이블에 insert 하는 메소드. 성공하면 true 리턴
	 */
	public boolean insertMember(MemberDTO member) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "INSERT ALL" + " INTO member (member_no, login_id, password, member_name, nickname)"
					+ " VALUES ( (SELECT NVL( ( MAX(member_no) ), 0)+1 FROM member), ?, ?, ?, ? )"
					+ " INTO point (login_id)" + " VALUES (?) SELECT * FROM dual";

//			String sql = "INSERT INTO member (member_no, login_id, password, member_name, nickname)"
//					+ " VALUES ( (SELECT NVL( ( MAX(member_no) ), 0)+1 FROM member), ?, ?, ?, ? )";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getLogin_id());
			psmt.setString(2, member.getPassword());
			psmt.setString(3, member.getMember_name());
			psmt.setString(4, member.getNickname());
			psmt.setString(5, member.getLogin_id());

			result = psmt.executeUpdate();

			if (result == 2) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return false;
	}

	// 개인정보 수정하는 부분 1 chatgpt

	public int updateMember(String nickname, String id, String pw) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

				String sql = "UPDATE MEMBER SET PASSWORD = ? , NICKNAME = ? "
						+ "  WHERE login_id = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, pw);
				psmt.setString(2, nickname);
				psmt.setString(3, id);
				
				result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		return result;
	}

	
	
	
	public int loginMember(String id, String pw) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

				String sql = "UPDATE MEMBER SET PASSWORD = ? , NICKNAME = ? "
						+ "  WHERE login_id = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, pw);
				psmt.setString(2, nickname);
				psmt.setString(3, id);
				
				result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}
	
	// 개인정보 수정하는 부분 3

	
	//홍재코드 

//업데이트 수정 대기

//	public boolean updateMember(MemberDTO member) {
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		int result = 0;
//		
//		try {
//			conn = DBConnectionManager.getConnection();
//
//			String sql = "UPDATE MEMBER SET  LOGIN_ID = ?, MEMBER_ NAME = ? ,PASSWORD = ? , NICKNAME = ? "
//					+ "  WHERE login_id = ?";
//
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, member.getLogin_id());
//			psmt.setString(2, member.getPassword());
//			psmt.setString(3, member.getMember_name());
//			psmt.setString(4, member.getNickname());
//
//			result = psmt.executeUpdate();
//
//			if (result == 1) {
//				return true;
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnectionManager.close(rs, psmt, conn);
//		}
//
//		return false;
//	}
//
//	

}