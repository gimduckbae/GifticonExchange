package member;

public class MemberDTO {
	String login_id;
	String login_pw;
	String name;
	String nickName;

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String login_id, String login_pw, String name, String nickName) {
		this.login_id = login_id;
		this.login_pw = login_pw;
		this.name = name;
		this.nickName = nickName;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getLogin_pw() {
		return login_pw;
	}

	public void setLogin_pw(String login_pw) {
		this.login_pw = login_pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "MemberDTO [login_id=" + login_id + ", login_pw=" + login_pw + ", name=" + name + ", nickName="
				+ nickName + "]";
	}
}
