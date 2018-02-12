package movie.handler;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.Movie;
import movie.dto.Reservation;
import movie.dto.ReservationProgress;
import movie.dto.Timetable;
import movie.service.MovieService;
import movie.service.ReservationProgressService;
import movie.service.ReservationService;
import movie.service.TheaterService;
import movie.service.TimeTableService;
import mvc.controller.CommandHandler;

public class ReservationAjaxHandler implements CommandHandler {
	MovieService movieService = null;
	TimeTableService timeTableService = null;
	TheaterService theaterService = null;
	ReservationProgressService progressService = null;
	ReservationService reservationService = null;
	ObjectMapper om = null;
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pwJson = res.getWriter();
		om = new ObjectMapper();
		// REQUEST GET
		if(req.getMethod().equalsIgnoreCase("get")){
			// MEMBER RESERVATION
			// MOVIE LIST LOAD
			if(req.getParameter("no") == null){
				movieService = MovieService.getInstance();
				
				List<Movie> allMovie = movieService.selectAll();
				
				String jsonMovie = om.writeValueAsString(allMovie); //json 형태의 String으로 변환
				pwJson.print(jsonMovie);
			}
			
			// SELECT MOVIE IF EXISTS
			if(req.getParameter("no") != null){
				String selectMovie = req.getParameter("no");
				timeTableService = TimeTableService.getInstance();
				Movie movieResult = movieService.selectById(Integer.valueOf(selectMovie));
				List<Timetable> timetableResult = timeTableService.selectByMovie(movieResult.getMovieNo());
				progressService = ReservationProgressService.getInstance();
				reservationService = ReservationService.getInstance();
				ReservationProgress progressResult = null;
				List<Reservation> reservationResult = null;
				ArrayList<ReservationProgress> result = new ArrayList<>();
				for(Timetable timetable : timetableResult){
					progressResult = progressService.selectByTimetable(timetable.getTableNo());
					reservationResult = reservationService.selectByTimeTable(progressResult.getTimeNo());
					progressResult.setRestSeat(progressResult.getRestSeat()-reservationResult.size());
					result.add(progressResult);
				}
				
					
				String jsonTime = om.writeValueAsString(result); //json 형태의 String으로 변환
				pwJson.print(jsonTime);
			}
			pwJson.flush();
		}
		return null;
	}
}
