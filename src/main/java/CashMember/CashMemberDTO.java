package CashMember;

public class CashMemberDTO {

@Override
	public String toString() {
		return "CashMemberDTO [name=" + name + ", account=" + account + ", cash=" + cash + ", cashout=" + cashout + "]";
	}
private String name;
private int account;
private int cash;
private int cashout;

public int getCashout() {
	return cashout;
}
public void setCashout(int cashout) {
	this.cashout = cashout;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getAccount() {
	return account;
}
public void setAccount(int account) {
	this.account = account;
}
public int getCash() {
	return cash;
}
public void setCash(int cash) {
	this.cash = cash;
}

}
