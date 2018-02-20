package movie.handler;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

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
				System.out.println(selectMovie);
				timeTableService = TimeTableService.getInstance();
				Movie movieResult = movieService.selectById(Integer.valueOf(selectMovie));
				System.out.println(movieResult);
				// POSTER DATA LOAD
				jsonResult.put("movie", movieResult);
				// TIMETABLE DATA LOAD
				List<Timetable> timetableResult = timeTableService.selectByMovie(movieResult.getMovieNo());
				System.out.println(timetableResult);
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
				timeTableService = TimeTableService.getInstance();
				Timetable resultTime = timeTableService.selectByNo(loadTheater);
				theaterService = TheaterService.getInstance();
				Theater result = theaterService.selectById(resultTime.getTheaterNo());
				
				String jsonTime = om.writeValueAsString(result); //json 형태의 String으로 변환
				pwJson.print(jsonTime);
			}
			
			// SELECT MOVIE & SELECT TIME = RESULT RESERVATION USER
			if(req.getParameter("timeNo") != null && req.getParameter("search") != null){
				System.out.println("SELECT MOVIE & SELECT TIME = RESULT RESERVATION USER");
				int loadReserve = Integer.valueOf(req.getParameter("timeNo"));
				User user = (User)req.getSession().getAttribute("member");
				HashMap<String, String> result = new HashMap<>();
				
				// USER SESSION 획득 성공시
				if(user != null){
					reservationService = ReservationService.getInstance();
					// TIMETABLE NO 조건으로 검색
					List<Reservation> resultReserve = reservationService.selectByTimeTable(loadReserve);
					
					String makeStr = "";
					for(Reservation reserveSeat : resultReserve){
						if(makeStr.equals(""))
							makeStr += reserveSeat.getSeat();
						else
							makeStr += "/"+reserveSeat.getSeat();
					}
					result.put("resultSeat", makeStr);
					// USER ID, TIMETABLE NO 조건으로 검색
					Reservation reserveResult = reservationService.selectByUserAndTime(user.getUserId(), loadReserve);
					if(reserveResult != null)
						result.put("targetSeat", reserveResult.getSeat());
					String jsonResult = om.writeValueAsString(result); //json 형태의 String으로 변환
					pwJson.print(jsonResult);
				}
				// USER SESSION 획득 실패시
				else{
					// ERROR 알림 후 LOGIN 이동
					result.put("error", "USER 정보를 찾을 수 없습니다.\n로그인 후 이용바랍니다.");
					result.put("solution", "/MovieProject/login/Login.jsp");
					String jsonResult = om.writeValueAsString(result); //json 형태의 String으로 변환
					pwJson.print(jsonResult);
				}
			}
			
			// RESERVATION.PROGRESS INSERT&UPDATE
			if(req.getParameter("seat") != null && req.getParameter("timetableNo") != null){
				System.out.println("RESERVATION.PROGRESS INSERT&UPDATE");
				String seat = String.valueOf(req.getParameter("seat"));
				int timetableNo = Integer.valueOf(req.getParameter("timetableNo"));
				User user = (User)req.getSession().getAttribute("member");
				HashMap<String, String> errorAlert = new HashMap<>(); 
				
				// USER SESSION 획득 성공시
				if(user != null){
					System.out.println("USER LOAD SECCESS");
					reservationService = ReservationService.getInstance();
					// USER ID, TIMETABLE NO 조건으로 검색
					Reservation result = reservationService.selectByUserAndTime(user.getUserId(), timetableNo);
					System.out.println(result);
					// 결과값이 리턴될 경우 RESERVATION UPDATE 진행
					if(result != null){
						result.setSeat(seat);
						reservationService.updateReservation(result);
					}
					// 결과값이 NULL일 경우 RESERVATION INSERT 진행
					else{
						result = new Reservation();
						result.setUserId(user.getUserId());
						result.setTimetableNo(timetableNo);
						result.setPrice(0);
						result.setSeat(seat);
						result.setProgress(1);
						reservationService.insertReservation(result);
					}
					return null;
				}
				// USER SESSION 획득 실패시
				else{
					// ERROR 알림 후 LOGIN 이동
					errorAlert.put("error", "USER 정보를 찾을 수 없습니다.\n로그인 후 이용바랍니다.");
					errorAlert.put("solution", "/MovieProject/login/Login.jsp");
				}
				String jsonResult = om.writeValueAsString(errorAlert);
				pwJson.print(jsonResult);
			}
			
			// RESERVATION.PROGRESS PREV,NEXT
			if(req.getParameter("circultKey") != null){
				System.out.println("RESERVATION.PROGRESS CIRCULTKEY METHOD");
				String keyType = String.valueOf(req.getParameter("circultKey"));
				int timetableNo = Integer.valueOf(req.getParameter("timetableNo"));
				User user = (User)req.getSession().getAttribute("member");
				HashMap<String, String> errorAlert = new HashMap<>(); 
				
				// USER SESSION 획득 성공시
				if(user != null){
					System.out.println("USER LOAD SECCESS");
					reservationService = ReservationService.getInstance();
					// USER ID, TIMETABLE NO 조건으로 검색
					Reservation result = reservationService.selectByUserAndTime(user.getUserId(), timetableNo);
					System.out.println(result);
					// 결과값이 리턴될 경우 KEY=FIX 일 때 RESERVATION UPDATE 진행
					if(result != null && keyType.equals("fix")){
						result.setProgress(2);
						reservationService.updateReservation(result);
					}
					// 결과값이 리턴될 경우 KEY=CANCLE 일 때 RESERVATION DELETE 진행
					else if(result != null && keyType.equals("cancle")){
						reservationService.deleteReservation(result);
					}
					// 결과값이 NULL일 경우 RESERVATION ERROR 진행
					else{
						errorAlert.put("error", "예약진행 중 에러가 발생하였습니다.\n관리자에게 문의 후 이용바랍니다.");
						errorAlert.put("solution", "/MovieProject/reservation/ReservationInsert_Member.jsp");
						String jsonResult = om.writeValueAsString(errorAlert);
						pwJson.print(jsonResult);
						pwJson.flush();
					}
					return null;
				}
				// USER SESSION 획득 실패시
				else{
					// ERROR 알림 후 LOGIN 이동
					errorAlert.put("error", "USER 정보를 찾을 수 없습니다.\n로그인 후 이용바랍니다.");
					errorAlert.put("solution", "/MovieProject/login/Login.jsp");
				}
				String jsonResult = om.writeValueAsString(errorAlert);
				pwJson.print(jsonResult);
			}
			pwJson.flush();
		}
		return null;
	}
}
