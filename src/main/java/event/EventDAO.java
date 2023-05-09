package event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBConnectionManager;

public class EventDAO {
	
	public List<EventDTO> selectAllEvents() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		EventDTO eventDTO = null;
		List<EventDTO> events = new ArrayList<EventDTO>();
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "SELECT * FROM event";
			
			psmt = conn.prepareStatement(sql);
			
			
			rs = psmt.executeQuery();
			
			
			while (rs.next()) {				
				eventDTO = new EventDTO();
				eventDTO.setEvtname(rs.getString("evtname"));
				eventDTO.setEvt_img(rs.getString("evt_img"));
				events.add(eventDTO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return events;
	}
	
	//insert
			public int insertEventInfo(String evtname, String evt_img) {

				Connection conn = null;
				PreparedStatement psmt = null;
				ResultSet rs = null;
				int result = 0;
				try {
					conn = DBConnectionManager.getConnection();

					// 쿼리문!
					String sql = "insert into event"
							+" values( ?, ?)";

					psmt = conn.prepareStatement(sql);
					psmt.setString(1, evtname);
					psmt.setString(2, evt_img);
					result = psmt.executeUpdate();

					System.out.println("처리결과:" + result);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					DBConnectionManager.close(rs, psmt, conn);
				}

				return result;
			}

}
