package movie.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.ReservationGuide;
import movie.dto.ReservationUser;
import movie.service.ReservationGuideService;
import movie.service.ReservationUserService;
import mvc.controller.CommandHandler;

public class MyInfoReservationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String id = req.getParameter("userId");
		ReservationUserService service = ReservationUserService.getInstance();
		List<ReservationUser> list = service.selectById(id);
		
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(list); //json 형태의 String으로 변환
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		return null;
	}

}
