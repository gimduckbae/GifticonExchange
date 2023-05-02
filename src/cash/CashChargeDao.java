package cash;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CashChargeDao {

	public static final String USERNAME = "아이디" , PASSWORD = "비밀번호";
	
	public List<CashChargeDto> list() throws Exception{

		Connection con = JdbcUtils.connect(USERNAME, PASSWORD);

		String sql = "select * from coin order by coin_amount asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		// rs의 내용을 List에 복사
		List<CashChargeDto> list = new ArrayList<>();
		while (rs.next()) {
			CashChargeDto cashDto = new CashChargeDto();

	
			
			// (3개 항목 복사)
			cashDto.setCashNo(rs.getInt("cash_no"));
			cashDto.setCashName(rs.getString("cash_name"));
			cashDto.setCashAmount(rs.getInt("cash_amount"));

			list.add(cashDto);
		}

		con.close();
		return list;
	}
	public CashChargeDto get(int cashNo) throws Exception {
		Connection con = JdbcUtils.connect(USERNAME, PASSWORD);

		String sql = "select * from cash where coin_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, cashNo);
		ResultSet rs = ps.executeQuery();

		CashChargeDto cashDto;
		if(rs.next()) {
			cashDto = new CashChargeDto();

			cashDto.setCashNo(rs.getInt("cash_no"));
			cashDto.setCashName(rs.getString("cash_name"));
			cashDto.setCashAmount(rs.getInt("cash_amount"));
		}
		else {
			cashDto = null;
		}

		con.close();

		return cashDto;
	}
	
	
	
}
