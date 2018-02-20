package movie.handler;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.Reservation;
import movie.service.ReservationService;
import mvc.controller.CommandHandler;

public class MyInfoReservationDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int no = Integer.parseInt(req.getParameter("no"));
		Reservation r = new Reservation();
		r.setNo(no);
		ReservationService service = ReservationService.getInstance();
		service.deleteReservation(r);
			
		return null;
	}   

}
