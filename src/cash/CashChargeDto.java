package cash;

public class CashChargeDto {

	private int cashNo;
	private String cashName;
	private int cashAmount;
	public int getCashNo() {
		return cashNo;
	}
	public void setCashNo(int cashNo) {
		this.cashNo = cashNo;
	}
	public String getCashName() {
		return cashName;
	}
	public void setCashName(String cashName) {
		this.cashName = cashName;
	}
	public int getCashAmount() {
		return cashAmount;
	}
	public void setCashAmount(int cashAmount) {
		this.cashAmount = cashAmount;
	}
	@Override
	public String toString() {
		return "CashChargeDto [cashNo=" + cashNo + ", cashname=" + cashName + ", cashAmount=" + cashAmount + "]";
	}
	
	
}
