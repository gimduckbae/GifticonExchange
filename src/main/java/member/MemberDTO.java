package member;

public class MemberDTO {
	int member_no;
	String login_id;
	String password;
	String member_name;
	String nickname;
	String join_date;

	public MemberDTO() {

	}

	public MemberDTO(String login_id, String password, String member_name, String nickname) {
		this.login_id = login_id;
		this.password = password;
		this.member_name = member_name;
		this.nickname = nickname;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

}
