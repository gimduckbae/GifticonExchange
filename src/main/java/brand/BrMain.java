package brand;

public class BrMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		BrandDAO brandDAO = new BrandDAO();
		
		brandDAO.insertBrandInfo("던킨도넛츠", "./img/logo1.png");
		brandDAO.insertBrandInfo("베스킨라빈스", "./img/logo2.png");
		brandDAO.insertBrandInfo("파리바게트", "./img/logo3.png");
		brandDAO.insertBrandInfo("파스쿠찌", "./img/logo4.png");
		brandDAO.insertBrandInfo("쉐이크쉑", "./img/logo5.png");
		

	}

}
