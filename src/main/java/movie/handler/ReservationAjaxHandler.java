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
						
						// PROGRESS 예약진행중 1, 결제완료 2
						//result.setProgress(1);
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
				
				// 02/13 오후 09:30 진행상황
				// 회원가입해서 새로운유저로만 테스트 진행할 수 있다.
				// testuser/qwer1234%
				// 좌석을 클릭해서 selectSeat로 변경시에
				// reservationService에 회원ID와 상영시간표를 기준으로 검색해서
				// 조건이 일치하는 예약이 있는경우 좌석컬럼의 정보를 변경
				// 일치하지 않는경우 새로운 예약을 생성해서 정보를 저장
				
				// 02/14 오후 04:10 진행상황
				// 좌석을 선택 시마다 회원ID, 상영시간표번호를 기준으로 검색해서 조건이 일치하는 정보를 가지고 들어가서 좌석컬럼을 계속수정함.
				// 조건이 일치하지 않는 경우 INSERT과정 추가 필요.
				// PREV 버튼을 클릭할경우 현재까지 저장된 좌석정보를 지워버려야한다.
				// ID정보를 확인하고 그 정보를 바탕으로 상영시간표와 PROGRESS(1)로 검색해서 지워버리면 될거같다.
				// NEXT 버튼을 클릭할경우 재확인창까지 통과하면 좌석정보를 고정시켜야한다.
				// ID,TIME,PROGRESS(1)을 기준으로 검색해서 PROGRESS(2)로 변경할 필요가 있다.
				// 세션정보 유지시간을 좀 더 길게끌고갈필요가있다.
				// 브라우저가 꺼지거나, 유저가 직접 로그아웃을 클릭했을 때 세션정보파괴.
				
			}
			pwJson.flush();
		}
		return null;
	}
}
