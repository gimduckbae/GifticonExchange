package gifticon;

public class GifticonDTO {
	String resultMsg;
	int resultCode;

	String virtualCouponName;
	String brandCode;
	String brandName;
	int consumerPrice;
	int salePrice;
	int usableAmount;
	String validityStartDate;
	String validityEndDate;
	String status;

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

	public int getResultCode() {
		return resultCode;
	}

	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}

	public String getVirtualCouponName() {
		return virtualCouponName;
	}

	public void setVirtualCouponName(String virtualCouponName) {
		this.virtualCouponName = virtualCouponName;
	}

	public String getBrandCode() {
		return brandCode;
	}

	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public int getConsumerPrice() {
		return consumerPrice;
	}

	public void setConsumerPrice(int consumerPrice) {
		this.consumerPrice = consumerPrice;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getUsableAmount() {
		return usableAmount;
	}

	public void setUsableAmount(int usableAmount) {
		this.usableAmount = usableAmount;
	}

	public String getValidityStartDate() {
		return validityStartDate;
	}

	public void setValidityStartDate(String validityStartDate) {
		this.validityStartDate = validityStartDate;
	}

	public String getValidityEndDate() {
		return validityEndDate;
	}

	public void setValidityEndDate(String validityEndDate) {
		this.validityEndDate = validityEndDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "GifticonDto [resultMsg=" + resultMsg + ", resultCode=" + resultCode + ", virtualCouponName="
				+ virtualCouponName + ", brandCode=" + brandCode + ", brandName=" + brandName + ", consumerPrice="
				+ consumerPrice + ", salePrice=" + salePrice + ", usableAmount=" + usableAmount + ", validityStartDate="
				+ validityStartDate + ", validityEndDate=" + validityEndDate + ", status=" + status + "]";
	}

}
