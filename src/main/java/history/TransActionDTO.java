package history;

public class TransActionDTO {

	String login_id;
	String history_date;
	int amount;
	int type;

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getHistory_date() {
		return history_date;
	}

	public void setHistory_date(String history_date) {
		this.history_date = history_date;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
