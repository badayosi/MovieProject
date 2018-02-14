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
import movie.dto.ReservationProgress;
import movie.dto.Theater;
import movie.dto.Timetable;
import movie.dto.User;
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
			System.out.println("PARAMETER no :"+req.getParameter("no"));
			System.out.println("PARAMETER timeNo :"+req.getParameter("timeNo"));
			System.out.println("PARAMETER seat :"+req.getParameter("seat"));
			
			// MEMBER RESERVATION
			// MOVIE LIST LOAD
			if(req.getParameter("no") == null
					&& req.getParameter("timeNo") == null
					&& req.getParameter("seat") == null){
				movieService = MovieService.getInstance();
				
				List<Movie> allMovie = movieService.selectAll();
				
				String jsonMovie = om.writeValueAsString(allMovie); //json 형태의 String으로 변환
				pwJson.print(jsonMovie);
			}
			
			// SELECT MOVIE IF EXISTS
			if(req.getParameter("no") != null){
				System.out.println("SELECT MOVIE IF EXISTS");
				HashMap<String, Object> jsonResult = new HashMap<>();
				
				String selectMovie = req.getParameter("no");
				timeTableService = TimeTableService.getInstance();
				Movie movieResult = movieService.selectById(Integer.valueOf(selectMovie));
				// POSTER DATA LOAD
				jsonResult.put("movie", movieResult);
				// TIMETABLE DATA LOAD
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
				jsonResult.put("time", result);
				String json = om.writeValueAsString(jsonResult);
				pwJson.print(json);
			}
			
			// SELECT MOVIE & SELECT TIME = RESULT THEATER
			if(req.getParameter("timeNo") != null && req.getParameter("search") == null){
				System.out.println("SELECT MOVIE & SELECT TIME = RESULT THEATER");
				int loadTheater = Integer.valueOf(req.getParameter("timeNo"));
				theaterService = TheaterService.getInstance();
				Theater result = theaterService.selectById(loadTheater);
				
				String jsonTime = om.writeValueAsString(result); //json 형태의 String으로 변환
				pwJson.print(jsonTime);
			}
			
			// SELECT MOVIE & SELECT TIME = RESULT RESERVATION USER
			if(req.getParameter("timeNo") != null && req.getParameter("search") != null){
				System.out.println("SELECT MOVIE & SELECT TIME = RESULT RESERVATION USER");
				int loadReserve = Integer.valueOf(req.getParameter("timeNo"));
				reservationService = ReservationService.getInstance();
				List<Reservation> resultReserve = reservationService.selectByTimeTable(loadReserve);
				ArrayList<String> result = new ArrayList<String>();
				for(Reservation reserveSeat : resultReserve){
					result.add(reserveSeat.getSeat());
				}
				
				String jsonTime = om.writeValueAsString(result); //json 형태의 String으로 변환
				pwJson.print(jsonTime);
			}
			
			// RESERVATION.PROGRESS INSERT&UPDATE
			if(req.getParameter("seat") != null && req.getParameter("timetableNo") != null){
				System.out.println("RESERVATION.PROGRESS INSERT&UPDATE");
				String seat = String.valueOf(req.getParameter("seat"));
				int timetableNo = Integer.valueOf(req.getParameter("timetableNo"));
				User user = (User)req.getSession().getAttribute("member");
				
				if(user != null){
					System.out.println("USER LOAD SECCESS");
					System.out.println(user);
				}else{
					System.out.println("USER LOAD FAIL");
					System.out.println(user);
				}
					
				
				/*reservationService = ReservationService.getInstance();
				reservationService.selectByUserAndTime(, timeNo)
				
				// 02/13 오후 09:30 진행상황
				// 회원가입해서 새로운유저로만 테스트 진행할 수 있다.
				// testuser/qwer1234%
				// 좌석을 클릭해서 selectSeat로 변경시에
				// reservationService에 회원ID와 상영시간표를 기준으로 검색해서
				// 조건이 일치하는 예약이 있는경우 좌석컬럼의 정보를 변경
				// 일치하지 않는경우 새로운 예약을 생성해서 정보를 저장
				// progress컬럼은 예약이 진행되고 있는 경우 1, 결제까지 완료된 경우는 2로 설정한다.
				
				// 그리고 세션정보를 여기서도 확인가능한지 알아봐야할거같다.
				
				String jsonTime = om.writeValueAsString(seat);
				pwJson.print(jsonTime);*/
			}
			
			pwJson.flush();
		}
		return null;
	}
}
