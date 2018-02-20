package movie.handler;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.Movie;
import movie.dto.Reservation;
import movie.dto.Theater;
import movie.dto.Timetable;
import movie.service.MovieService;
import movie.service.ReservationService;
import movie.service.TheaterService;
import movie.service.TimeTableService;
import mvc.controller.CommandHandler;

public class ManagerAjaxHandler implements CommandHandler {
	ObjectMapper om = null;
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pwJson = res.getWriter();
		om = new ObjectMapper();
		
		// REQUEST GET
		if(req.getMethod().equalsIgnoreCase("get")){
			
			// LOAD
			if(req.getParameter("type").equals("load")){
				// THEATER ALL LIST LOAD
				if(req.getParameter("target").equals("theater") && req.getParameter("scope").equals("all")){
					TheaterService theaterService = TheaterService.getInstance();
					List<Theater> result = theaterService.selectAll();
					
					String json = om.writeValueAsString(result);
					pwJson.print(json);
				}
				// THEATER SCHEDULE LOAD
				if(req.getParameter("target").equals("timetable") && req.getParameter("scope").equals("theaterno")){
					String no = req.getParameter("theaterno");
					
					TimeTableService timeTableService = TimeTableService.getInstance();
					List<Timetable> resultTimeTable = timeTableService.selectByMovie(Integer.valueOf(no));
					
					MovieService movieService = MovieService.getInstance();
					ArrayList<Movie> resultMovie = new ArrayList<>();
					for(Timetable temp : resultTimeTable){					
						resultMovie.add(movieService.selectById(temp.getMovieNo()));
					}
					
					HashMap<String, Object> result = new HashMap<String, Object>();
					result.put("timeTable", resultTimeTable);
					result.put("movie", resultMovie);
					
					String json = om.writeValueAsString(result);
					pwJson.print(json);
				}
			}
			
			// DELETE
			if(req.getParameter("type").equals("delete")){
				if(req.getParameter("target").equals("timetable") && req.getParameter("scope").equals("no")){
					String no = req.getParameter("timetableno");
					
					ReservationService reservationService = ReservationService.getInstance();
					List<Reservation> resultReservation = reservationService.selectByTimeTable(Integer.valueOf(no));
					System.out.println(resultReservation.size());
					HashMap<String, String> result = new HashMap<String, String>();
					if(resultReservation.size() == 0){
						TimeTableService timeTableService = TimeTableService.getInstance();
						timeTableService.deleteByNo(Integer.valueOf(no));
						result.put("success", "정상적으로 삭제되었습니다.");
					}
					else{
						result.put("error", "존재하지 않거나 예약자가 존재하여 삭제할 수 없습니다.");
					}
					String json = om.writeValueAsString(result);
					pwJson.print(json);
				}
			}
			
			// INSERT
			if(req.getParameter("type").equals("insert")){
				if(req.getParameter("target").equals("timetable")){
					String no = req.getParameter("timetableno");
					
					ReservationService reservationService = ReservationService.getInstance();
					List<Reservation> resultReservation = reservationService.selectByTimeTable(Integer.valueOf(no));
					System.out.println(resultReservation.size());
					HashMap<String, String> result = new HashMap<String, String>();
					if(resultReservation.size() == 0){
						TimeTableService timeTableService = TimeTableService.getInstance();
						timeTableService.deleteByNo(Integer.valueOf(no));
						result.put("success", "정상적으로 삭제되었습니다.");
					}
					else{
						result.put("error", "존재하지 않거나 예약자가 존재하여 삭제할 수 없습니다.");
					}
					String json = om.writeValueAsString(result);
					pwJson.print(json);
				}
			}
		}
		pwJson.flush();
		return null;
	}
}
