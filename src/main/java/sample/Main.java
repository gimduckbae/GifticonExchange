package sample;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		SampleDao sampleDao = new SampleDao();
		
		sampleDao.insertSampleInfo( "베스킨라빈스 파인트", "BR000B", 8400, "./img/img1.png");
		sampleDao.insertSampleInfo( "파스쿠찌 아메리카노", "PC000B", 4600, "./img/img2.png");
		sampleDao.insertSampleInfo( "파리바게트 카페라떼", "PB000B", 5100, "./img/img3.png");
		sampleDao.insertSampleInfo( "베스킨라빈스 파인트", "BR000B", 8400, "./img/img1.png");
		sampleDao.insertSampleInfo( "파스쿠찌 아메리카노", "PC000B", 4600, "./img/img2.png");
		sampleDao.insertSampleInfo( "파리바게트 카페라떼", "PB000B", 5100, "./img/img3.png");
		
		System.out.println();
	

	}

}
