package movie.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Movie;
import movie.dto.ReservationGuide;
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
			List<Movie> listMovie = movieService.selectAll();
			req.setAttribute("listMovie", listMovie);
			// SELECT MOVIE IF EXISTS 
			if(req.getParameterValues("selectMovie").length > 0){
				String[] selectMovie = req.getParameterValues("selectMovie");
				timeTableService = TimeTableService.getInstance();
				Movie movieResult = null;
				for(int index=0 ; index<selectMovie.length ; index++){
					movieResult = movieService.selectById(Integer.valueOf(selectMovie[index]));
					timeTableService.selectByMovie(movieResult.getMovieNo());
				}
			}
		}
		
		// REQUEST POST
		else if(req.getMethod().equalsIgnoreCase("post")){
			// 전체예약현황 > 예약취소(관리자용)
			if(req.getParameter("type").equals("예약취소")){
				String[] check = req.getParameterValues("check");
				cancleAdminReservation(check, req);
				result = findAllReservation(req);
				res.sendRedirect("reservationGuide.do");
				return null;
			}else if(req.getParameter("type").equals("예약수정")){
				System.out.println("Reservation Guide 진입 수정");
			}
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
