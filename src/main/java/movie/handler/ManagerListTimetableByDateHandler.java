package movie.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.Timetable;
import movie.service.TimeTableService;
import mvc.controller.CommandHandler;

public class ManagerListTimetableByDateHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		int movieNo=Integer.parseInt(req.getParameter("theaterNo"));
		String date="%"+req.getParameter("date")+"%";
		TimeTableService service=TimeTableService.getInstance();
		List<Timetable> ttResult=service.selectByDate(movieNo, date);
		
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(ttResult);
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		return null;
	}

}
