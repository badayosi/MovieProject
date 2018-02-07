package movie.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.ReservationGuide;
import movie.service.ReservationGuideService;
import mvc.controller.CommandHandler;

public class ReservationGuideHandler implements CommandHandler {
	private static final String FORM_VIEW = "/reservation/ReservationMemberPage.jsp";
	ReservationGuideService service = null;
	String result = null;
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 전체예약현황(관리자용)
		if(req.getParameter("user") == null){
			
		}
		if(req.getParameter("id") != null){
			String id = req.getParameter("id");
			result = findMemberReservation(id, req, res);
		}
			
		return result;
	}
	
	private String findMemberReservation(String id, HttpServletRequest req, HttpServletResponse res){
		service = ReservationGuideService.getInstance();
		List<ReservationGuide> result = service.selectById(id);
		req.setAttribute("user", id);
		req.setAttribute("result", result);
		return FORM_VIEW;
	}

}
