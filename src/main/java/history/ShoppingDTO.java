package history;

public class ShoppingDTO {

	String login_id;
	int register_no;
	String history_date;
	int type;

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public int getRegister_no() {
		return register_no;
	}

	public void setRegister_no(int register_no) {
		this.register_no = register_no;
	}

	public String getHistory_date() {
		return history_date;
	}

	public void setHistory_date(String history_date) {
		this.history_date = history_date;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
