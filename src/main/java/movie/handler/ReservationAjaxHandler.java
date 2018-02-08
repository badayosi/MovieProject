package movie.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.Movie;
import movie.service.MovieService;
import movie.service.TheaterService;
import movie.service.TimeTableService;
import mvc.controller.CommandHandler;

public class ReservationAjaxHandler implements CommandHandler {
	MovieService movieService = null;
	TimeTableService timeTableService = null;
	TheaterService theaterService = null;
	ObjectMapper om = null;
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// REQUEST GET
		if(req.getMethod().equalsIgnoreCase("get")){
			// MEMBER RESERVATION
			// MOVIE LIST LOAD
			movieService = MovieService.getInstance();
			om = new ObjectMapper();
			
			List<Movie> allMovie = movieService.selectAll();
			
			String jsonMovie = om.writeValueAsString(allMovie); //json 형태의 String으로 변환
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pwMoive = res.getWriter();
			pwMoive.print(jsonMovie);
			pwMoive.flush();
			
			/*// SELECT MOVIE IF EXISTS
			if(req.getParameterValues("selectMovie").length > 0){
				String[] selectMovie = req.getParameterValues("selectMovie");
				timeTableService = TimeTableService.getInstance();
				Movie movieResult = null;
				TimetableArray timetableResult = new TimetableArray();
				for(int index=0 ; index<selectMovie.length ; index++){
					movieResult = movieService.selectById(Integer.valueOf(selectMovie[index]));
					timetableResult.addTimetable(timeTableService.selectByMovie(movieResult.getMovieNo()));
				}
				
				String jsonTime = om.writeValueAsString(timetableResult); //json 형태의 String으로 변환
				res.setContentType("application/json;charset=utf-8");
				PrintWriter pwTime = res.getWriter();
				pwTime.print(jsonTime);
				pwTime.flush();
			}*/			
		}
		return null;
	}
}
