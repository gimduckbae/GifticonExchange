package member;

import java.util.List;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		PointDAO dao  = new PointDAO();
		
		List<PointDTO> list =dao.selectAllWithdraw();
		
		for(PointDTO item : list ) {
			System.out.println(item.getWithdraw());
			System.out.println(item.getLogin_id());
			System.out.println(item.getPoint());		
		}
	}

	
	
}
