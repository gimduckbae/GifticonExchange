package point_charge;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cash.CashChargeDao;
import cash.CashChargeDto;


import cash.HistoryDao;
import cash.HistoryDto;
import cash.MemberDao;

@WebServlet(urlPatterns = "/point/charge.txt")
public class PointChargeServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			//1
			int coinNo = Integer.parseInt(req.getParameter("coinNo"));

			//2
			String memberId = (String)req.getSession().getAttribute("ses");

			//3 - coin 단일조회
			CashChargeDao cashDao = new CashChargeDao();
			CashChargeDto cashDto =cashDao.get(cashNo);

			//4 - history 등록
			HistoryDto historyDto = new HistoryDto();
			historyDto.setMemberId(memberId);
			historyDto.setHistoryAmount(cashDto.getCashAmount());
			historyDto.setHistoryMemo("포인트상품 구매");

			HistoryDao historyDao = new HistoryDao();
			historyDao.insert(historyDto);

			//5 - member 수정
			//[1] 원래 포인트에서 현재 포인트만 추가 - 회원아이디, 추가된 포인트
			//[2] history에서 해당 회원 내역을 전부 계산하여 재설정 - 회원아이디
			MemberDao memberDao = new MemberDao();
			memberDao.addPoint(memberId, coinDto.getCashAmount());//1번 방식
			//memberDao.refreshPoint(memberId);//2번 방식

			//완료 시 redirect
			resp.sendRedirect("charge_success.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}