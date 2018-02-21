package movie.handler;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Timetable;
import movie.service.TimeTableService;
import mvc.controller.CommandHandler;

public class managerAddTimetableHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int movieNo=Integer.parseInt(req.getParameter("movieNo"));
		int theaterNo=Integer.parseInt(req.getParameter("theaterNo"));
		Date startTime = new Date(Long.parseLong(req.getParameter("startTime")));
		Date endTime = new Date(Long.parseLong(req.getParameter("endTime")));
		//Date startTime=new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(); 
		//Date endTime=new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(req.getParameter("endTime"));
		
		Timetable timetable=new Timetable(movieNo, theaterNo, startTime, endTime);
		
		TimeTableService service=TimeTableService.getInstance();
		service.insert(timetable);
		
		return null;
	}

}
