package member;

import gifticon.GifticonDTO;

public class CartDTO {

	String login_id;
	int register_no;
	GifticonDTO gifticonDTO;

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

	public GifticonDTO getGifticonDTO() {
		return gifticonDTO;
	}

	public void setGifticonDTO(GifticonDTO gifticonDTO) {
		this.gifticonDTO = gifticonDTO;
	}

}
