package movie.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Movie;
import movie.dto.ReservationGuide;
import movie.dto.Timetable;
import movie.service.MovieService;
import movie.service.ReservationGuideService;
import movie.service.TheaterService;
import movie.service.TimeTableService;
import mvc.controller.CommandHandler;

public class ReservationHandler implements CommandHandler {
	private static final String FORM_INSERT_MEMBER = "/reservation/ReservationInsert_Member.jsp";
	//private static final String FORM_LIST_ADMIN = "/reservation/ReservationList_Admin.jsp";
	ReservationGuideService service = null;
	
	MovieService movieService = null;
	TimeTableService timeTableService = null;
	TheaterService theaterService = null;
	String result = null;
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// REQUEST GET
		if(req.getMethod().equalsIgnoreCase("get")){
			// MEMBER RESERVATION
			// MOVIE LIST LOAD
			movieService = MovieService.getInstance();
			List<Movie> allMovie = movieService.selectAll();
			req.setAttribute("allMovie", allMovie);
			// SELECT MOVIE IF EXISTS
			if(req.getParameterValues("selectMovie").length > 0){
				String[] selectMovie = req.getParameterValues("selectMovie");
				timeTableService = TimeTableService.getInstance();
				Movie movieResult = null;
				List<Timetable> timetableResult = null;
				for(int index=0 ; index<selectMovie.length ; index++){
					movieResult = movieService.selectById(Integer.valueOf(selectMovie[index]));
					timetableResult = timeTableService.selectByMovie(movieResult.getMovieNo());
					String reqName = "listTimetable" +  index;
					req.setAttribute(reqName, timetableResult);
				}	
			}
			result = FORM_INSERT_MEMBER;
			
		}
		
		// REQUEST POST
		// SELECT TIME IF EXISTS & SELECT MOVIE IF EXISTS
		else if(req.getMethod().equalsIgnoreCase("post")){
			
			result = null;
		}

		return result;
	}
	
	private String findMemberReservation(String id, HttpServletRequest req, HttpServletResponse res){
		service = ReservationGuideService.getInstance();
		List<ReservationGuide> result = service.selectById(id);
		req.setAttribute("user", id);
		req.setAttribute("result", result);
		return FORM_INSERT_MEMBER;
	}
	
	private String findAllReservation(HttpServletRequest req){
		service = ReservationGuideService.getInstance();
		List<ReservationGuide> result = service.selectByAll();
		req.setAttribute("result", result);
		return FORM_INSERT_MEMBER;
	}
	
	private void cancleAdminReservation(String[] check, HttpServletRequest req){
		service = ReservationGuideService.getInstance();
		service.deleteByNo(check);
	}

}
