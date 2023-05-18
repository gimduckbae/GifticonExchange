package member;

public class PointDTO {

	String login_id;
	int point;
	int withdraw;
	String point_char;
	String withdraw_char;

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getWithdraw() {
		return withdraw;
	}

	public void setWithdraw(int withdraw) {
		this.withdraw = withdraw;
	}

	public String getPoint_char() {
		return point_char;
	}

	public void setPoint_char(String point_char) {
		this.point_char = point_char;
	}

	public String getWithdraw_char() {
		return withdraw_char;
	}

	public void setWithdraw_char(String withdraw_char) {
		this.withdraw_char = withdraw_char;
	}

}
