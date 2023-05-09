package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBConnectionManager;

public class MemberDAO {

	/** member_tb 테이블에서 한사람의 정보를 login_id 값으로 조회 */
	public MemberDTO selectMemberById(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberDTO memberDTO = null;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT * FROM member_tb WHERE login_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setLogin_id(rs.getString("login_id"));
				memberDTO.setLogin_pw(rs.getString("login_pw"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setNickName(rs.getString("nickname"));
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

			String sql = "INSERT INTO member_tb (login_id, login_pw, name, nickname) VALUES (?,?,?,?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getLogin_id());
			psmt.setString(2, member.getLogin_pw());
			psmt.setString(3, member.getName());
			psmt.setString(4, member.getNickName());

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
	
	/** member_tb 테이블에서 한사람의 정보를 login_id 값으로 조회 */
	public MemberDTO id_pw_Check(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberDTO memberDTO = null;

		try {
			conn = DBConnectionManager.getConnection();
																			//id값을 불러오면 pw 등 값이 같이 넘어오니까
																				//굳이 pw까지 부를 필요가 없다.
			String sql = "SELECT * FROM member_tb WHERE login_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
					memberDTO = new MemberDTO();
					memberDTO.setLogin_id(rs.getString("login_id"));
					memberDTO.setLogin_pw(rs.getString("login_pw"));			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return memberDTO;
	}

	
	/** member_tb 테이블에서 한사람의 정보를 login_id 값으로 조회 */
	public MemberDTO pwCheck(String pw) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberDTO memberDTO = null;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "SELECT * FROM member_tb WHERE login_id and login_pw = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pw);
		
			rs = psmt.executeQuery();

			if (rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setLogin_pw(rs.getString("login_pw"));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return memberDTO;
	}

}
