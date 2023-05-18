package gifticon;

public class GifticonDTO {
	String resultMsg;
	int resultCode;

	int register_no;
	String brand_code;
	String brand_name;
	String coupon_number;
	String coupon_name;
	int purchase_price;
	int sale_price;
	int origin_price;
	String start_date;
	String end_date;
	String login_id;

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

	public int getRegister_no() {
		return register_no;
	}

	public void setRegister_no(int register_no) {
		this.register_no = register_no;
	}

	public String getBrand_code() {
		return brand_code;
	}

	public void setBrand_code(String brand_code) {
		this.brand_code = brand_code;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public String getCoupon_number() {
		return coupon_number;
	}

	public void setCoupon_number(String coupon_number) {
		this.coupon_number = coupon_number;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public int getPurchase_price() {
		return purchase_price;
	}

	public void setPurchase_price(int purchase_price) {
		this.purchase_price = purchase_price;
	}

	public int getSale_price() {
		return sale_price;
	}

	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}

	public int getOrigin_price() {
		return origin_price;
	}

	public void setOrigin_price(int origin_price) {
		this.origin_price = origin_price;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	@Override
	public String toString() {
		return "GifticonDTO [resultMsg=" + resultMsg + ", resultCode=" + resultCode + ", register_no=" + register_no
				+ ", brand_code=" + brand_code + ", brand_name=" + brand_name + ", coupon_number=" + coupon_number
				+ ", coupon_name=" + coupon_name + ", purchase_price=" + purchase_price + ", sale_price=" + sale_price
				+ ", origin_price=" + origin_price + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", login_id=" + login_id + "]";
	}

}
