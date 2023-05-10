package sale;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		SaleDAO saleDAO = new SaleDAO();
		
		saleDAO.insertSaleInfo( "베스킨라빈스 파인트", "BR000B", "./img/img1.png", 7200);
		saleDAO.insertSaleInfo( "파스쿠찌 아메리카노", "PC000B", "./img/img2.png", 4600);
		saleDAO.insertSaleInfo( "파리바게트 카페라떼", "PB000B", "./img/img3.png", 3900);
		saleDAO.insertSaleInfo( "베스킨라빈스 파인트", "BR000B", "./img/img1.png", 7200);
		saleDAO.insertSaleInfo( "파스쿠찌 아메리카노", "PC000B", "./img/img2.png", 4600);
		saleDAO.insertSaleInfo( "파리바게트 카페라떼", "PB000B", "./img/img3.png", 3900);
		saleDAO.insertSaleInfo( "베스킨라빈스 파인트", "BR000B", "./img/img1.png", 7200);
		saleDAO.insertSaleInfo( "파스쿠찌 아메리카노", "PC000B", "./img/img2.png", 4600);
		saleDAO.insertSaleInfo( "파리바게트 카페라떼", "PB000B", "./img/img3.png", 3900);
		
		System.out.println();
	

	}

}
