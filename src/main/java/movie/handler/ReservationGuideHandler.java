package movie.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.ReservationGuide;
import movie.service.ReservationGuideService;
import mvc.controller.CommandHandler;

public class ReservationGuideHandler implements CommandHandler {
	private static final String FORM_LIST_MEMBER = "/reservation/ReservationList_Member.jsp";
	private static final String FORM_LIST_ADMIN = "/reservation/ReservationList_Admin.jsp";
	ReservationGuideService service = null;
	String result = null;
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// REQUEST GET
		if(req.getMethod().equalsIgnoreCase("get")){
			// 전체예약현황(관리자용)
			if(req.getParameter("id") == null){
				result = findAllReservation(req);
			}
			// 예약현황(회원용)
			if(req.getParameter("id") != null){
				String id = req.getParameter("id");
				result = findMemberReservation(id, req, res);
			}
		}
		
		// REQUEST POST
		else if(req.getMethod().equalsIgnoreCase("post")){
			// 전체예약현황 > 예약취소(관리자용)
			if(req.getParameter("type").equals("예약취소")){
				String[] check = req.getParameterValues("check");
				cancleAdminReservation(check, req);
				result = findAllReservation(req);
				res.sendRedirect("reservationGuide.do");
				return null;
			}else if(req.getParameter("type").equals("예약수정")){
				System.out.println("Reservation Guide 진입 수정");
			}
		}

		return result;
	}
	
	private String findMemberReservation(String id, HttpServletRequest req, HttpServletResponse res){
		service = ReservationGuideService.getInstance();
		List<ReservationGuide> result = service.selectById(id);
		req.setAttribute("user", id);
		req.setAttribute("result", result);
		return FORM_LIST_MEMBER;
	}
	
	private String findAllReservation(HttpServletRequest req){
		service = ReservationGuideService.getInstance();
		List<ReservationGuide> result = service.selectByAll();
		req.setAttribute("result", result);
		return FORM_LIST_ADMIN;
	}
	
	private void cancleAdminReservation(String[] check, HttpServletRequest req){
		service = ReservationGuideService.getInstance();
		service.deleteByNo(check);
	}

}
