package image_file;

import java.util.List;
import java.util.Random;

import gifticon.GifticonDAO;
import gifticon.GifticonDTO;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int minPrice = 1000; // 최소 가격 (1000원)
		int maxPrice = 20000; // 최대 가격 (20000원)
		int unit = 100; // 단위 (100원)
		Random random = new Random();

		Image_FileDAO image_FileDAO = new Image_FileDAO();
		List<Image_FileDTO> images = image_FileDAO.selectAllProductImage();

		GifticonDAO gifticonDAO = new GifticonDAO();

		for (Image_FileDTO item : images) {
			int range = (maxPrice - minPrice) / unit + 1;
			int randomPrice = random.nextInt(range) * unit + minPrice;

			GifticonDTO dto = new GifticonDTO();
			dto.setBrand_code("BRTEST");
			dto.setBrand_name("배스킨라빈스");
			dto.setCoupon_number(String.valueOf((int) (Math.random() * 10000000))); // 랜덤숫자
			dto.setCoupon_name(item.getOrg_name());
			dto.setPurchase_price(randomPrice);
			dto.setSale_price(randomPrice);
			dto.setOrigin_price(randomPrice);
			dto.setStart_date("20230517");
			dto.setEnd_date("20230520");
			gifticonDAO.insertGifticon(dto);
			System.out.println(item.getOrg_name());
		}

//		psmt.setString(1, itemDto.getBrand_code());
//		psmt.setString(2, itemDto.getBrand_name());
//		psmt.setString(3, itemDto.getCoupon_number());
//		psmt.setString(4, itemDto.getCoupon_name());
//		psmt.setInt(5, itemDto.getPurchase_price());
//		psmt.setInt(6, itemDto.getSale_price());
//		psmt.setInt(7, itemDto.getOrigin_price());
//		psmt.setString(8, itemDto.getStart_date());
//		psmt.setString(9, itemDto.getEnd_date());

//		Image_FileDAO image_FileDAO = new Image_FileDAO();

//		image_FileDAO.deleteBannerByNo(4);
//		
//		image_FileDAO.insertImage_File("./img/evt2-1.png", "해피오더 이벤트1");
//		image_FileDAO.insertImage_File("./img/evt2-2.png", "해피오더 이벤트2");
//		image_FileDAO.insertImage_File("./img/evt2-3.png", "해피오더 이벤트3");
//		image_FileDAO.insertImage_File("./img/evt4.png", "던킨도넛츠 이벤트");
//		image_FileDAO.insertImage_File("./img/evt5.png", "쉐이크쉑 이벤트");
//		

	}

}
