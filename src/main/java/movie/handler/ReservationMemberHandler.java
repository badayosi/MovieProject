package movie.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.ReservationMember;
import movie.service.ReservationMemberService;
import mvc.controller.CommandHandler;

public class ReservationMemberHandler implements CommandHandler {
	private static final String FORM_VIEW = "/reservation/ReservationMemberPage.jsp";
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ReservationMemberService service = ReservationMemberService.getInstance();
		String id = req.getParameter("id");
		
		List<ReservationMember> result = service.selectById(id);
		
		req.setAttribute("user", id);
		req.setAttribute("result", result);
		return FORM_VIEW;
	}

}
