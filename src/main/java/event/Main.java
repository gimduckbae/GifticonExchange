package event;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		EventDAO eventDAO = new EventDAO();
		
		eventDAO.insertEventInfo("베스킨라빈스 이벤트", "./img/evt1.png");
		eventDAO.insertEventInfo("KFC 이벤트", "./img/evt2.png");
		eventDAO.insertEventInfo("피자헛 이벤트", "./img/evt3.png");
		eventDAO.insertEventInfo("던킨도너츠 이벤트", "./img/evt4.png");
		eventDAO.insertEventInfo("쉐이크쉑 이벤트", "./img/evt5.png");
	}

}
