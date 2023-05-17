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

			String sql = "INSERT INTO member (member_no, login_id, password, member_name, nickname)"
					+ " VALUES ( (SELECT NVL( ( MAX(member_no) ), 0)+1 FROM member), ?, ?, ?, ? )";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getLogin_id());
			psmt.setString(2, member.getPassword());
			psmt.setString(3, member.getMember_name());
			psmt.setString(4, member.getNickname());

			result = psmt.executeUpdate();

			if (result == 1) {
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

	public int updateMember(MemberDTO member, boolean isChangePass) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = DBConnectionManager.getConnection();

			if (isChangePass) {

				String sql = "UPDATE MEMBER SET LOGIN_ID = ?, MEMBER_ NAME = ? ,PASSWORD = ? , NICKNAME = ? "
						+ "  WHERE login_id = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, member.getJoin_date());
				psmt.setString(2, member.getPassword());
				psmt.setString(3, member.getMember_name());
				psmt.setString(4, member.getNickname());

				result = psmt.executeUpdate();
			} else {

				String sql = "UPDATE MEMBER SET  LOGIN_ID = ?, MEMBER_ NAME = ? ,PASSWORD = ? , NICKNAME = ? "
						+ "  WHERE login_id = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, member.getJoin_date());
				psmt.setString(2, member.getPassword());
				psmt.setString(3, member.getMember_name());
				psmt.setString(4, member.getNickname());

				result = psmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

	// 개인정보 수정하는 부분 2
	public List<MemberDTO> updateMembe(String login_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<MemberDTO> updateMemberr = new ArrayList<MemberDTO>();

		try {

			conn = DBConnectionManager.getConnection();
			String sql = "UPDATE MEMBER SET PASSWORD = ? , NICKNAME = ?  WHERE login_id = ?";
			psmt = conn.prepareStatement(sql);

	
			psmt.setString(1, login_id);			
			rs = psmt.executeQuery();
			
			System.out.println(login_id +"login_id");
			while (rs.next()) {
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setLogin_id(rs.getString("Login_id"));
				memberDTO.setPassword(rs.getString("Password"));
				memberDTO.setMember_name(rs.getString("Member_name"));
				memberDTO.setNickname(rs.getString("Nickname"));
				updateMemberr.add(memberDTO);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return updateMemberr;
	}

	// 개인정보 수정하는 부분 3
	public List<MemberDTO> updateMemberr(String login_id ) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<MemberDTO> updatedMembers = new ArrayList<>();

		try {
			conn = DBConnectionManager.getConnection();
			String sql = "UPDATE MEMBER SET PASSWORD = ?, NICKNAME = ? WHERE login_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, password);
			psmt.setString(2, nickname);
			psmt.setString(3, login_id);
			int rowsUpdated = psmt.executeUpdate();

			if (rowsUpdated > 0) {
				System.out.println("Member updated successfully.");

				// Retrieve the updated member details
				String selectSql = "SELECT * FROM MEMBER WHERE login_id = ?";
				psmt = conn.prepareStatement(selectSql);
				psmt.setString(1, login_id);
				rs = psmt.executeQuery();

				while (rs.next()) {
					MemberDTO memberDTO = new MemberDTO();
					memberDTO.setLogin_id(rs.getString("login_id"));
					memberDTO.setPassword(rs.getString("password"));
					memberDTO.setMember_name(rs.getString("member_name"));
					memberDTO.setNickname(rs.getString("nickname"));
					updatedMembers.add(memberDTO);
				}
			} else {
				System.out.println("Member update failed. No matching login_id found.");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return updatedMembers;
	}
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