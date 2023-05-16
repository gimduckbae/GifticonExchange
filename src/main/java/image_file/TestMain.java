package image_file;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Gifticon_ImageDAO gifticon_ImageDAO = new Gifticon_ImageDAO();
		Image_FileDAO image_FileDAO = new Image_FileDAO();
		Banner_ImageDAO banner_ImageDAO = new Banner_ImageDAO();
//		
//		image_FileDAO.insertImage_File("./img/evt2-1.png", "해피오더 이벤트1");
//		image_FileDAO.insertImage_File("./img/evt2-2.png", "해피오더 이벤트2");
//		image_FileDAO.insertImage_File("./img/evt2-3.png", "해피오더 이벤트3");
//		image_FileDAO.insertImage_File("./img/evt4.png", "던킨도넛츠 이벤트");
//		image_FileDAO.insertImage_File("./img/evt5.png", "쉐이크쉑 이벤트");
//		
//		gifticon_ImageDAO.insertGifticon_Image(1, "./img/br-item1.webp", "싱글레귤러 아이스크림");
//		gifticon_ImageDAO.insertGifticon_Image(2, "./img/br-item1.webp", "파인트 아이스크림");
//		gifticon_ImageDAO.insertGifticon_Image(3, "./img/br-item1.webp", "쿼터 아이스크림");
//		gifticon_ImageDAO.insertGifticon_Image(4, "./img/br-item1.webp", "하프갤론 아이스크림");
//		gifticon_ImageDAO.insertGifticon_Image(5, "./img/br-item1.webp", "패밀리 아이스크림");
//		
		banner_ImageDAO.insertBanner_Image(6, "./img/evt2-1.png", "해피오더 이벤트1");
		banner_ImageDAO.insertBanner_Image(7, "./img/evt2-2.png", "해피오더 이벤트2");
		banner_ImageDAO.insertBanner_Image(8, "./img/evt2-3.png", "해피오더 이벤트3");

		
		

		
		
		

	}

}
