package item;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		ItemDAO itemDAO = new ItemDAO();
		
		itemDAO.insertItemsInfo("싱글레귤러 아이스크림", "./img/br-item1.webp", 3500);
		itemDAO.insertItemsInfo("파인트 아이스크림(배달가능)", "./img/br-item2.webp", 8900);
		itemDAO.insertItemsInfo("쿼터 아이스크림(배달가능)", "./img/br-item3.webp", 17000);
		itemDAO.insertItemsInfo("패밀리 아이스크림(배달가능)", "./img/br-item4.webp", 24000);
		itemDAO.insertItemsInfo("하프갤론 아이스크림(배달가능)", "./img/br-item5.webp", 29000);
		itemDAO.insertItemsInfo("옹기종기팩(배달가능)", "./img/br-item6.webp", 26500);
		itemDAO.insertItemsInfo("골라먹는 27 큐브(배달가능)", "./img/br-item7.webp", 29000);
		itemDAO.insertItemsInfo("듀얼 와츄원 NO.9(배달가능)", "./img/br-item8.webp", 26350);
		itemDAO.insertItemsInfo("해피버스데이(배달가능)", "./img/br-item9.webp", 27000);
		itemDAO.insertItemsInfo("위글위글 허니비(배달가능)", "./img/br-item10.webp", 32000);
		itemDAO.insertItemsInfo("모바일 금액권 1만원권", "./img/br-item11.webp", 10000);
		itemDAO.insertItemsInfo("모바일 금액권 3만원권", "./img/br-item12.webp", 30000);
		itemDAO.insertItemsInfo("모바일 금액권 5만원권", "./img/br-item13.webp", 50000);
		itemDAO.insertItemsInfo("모바일 금액권 10만원권", "./img/br-item14.webp", 100000);
		itemDAO.insertItemsInfo("알고보면 스윗한 쿠로미(배달가능)", "./img/br-item15.webp", 25000);
		itemDAO.insertItemsInfo("아메리카노 (ICED)", "./img/br-item16.webp", 28000);
		itemDAO.insertItemsInfo("카푸치노블라스트 모카(Regular)", "./img/br-item17.webp", 5100);
		itemDAO.insertItemsInfo("설향 딸기 블라스트 2잔", "./img/br-item18.webp", 9000);
		
	
	}

}
