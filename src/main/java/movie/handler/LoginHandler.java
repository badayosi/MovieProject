package movie.handler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Reservation;
import movie.dto.Timetable;
import movie.dto.User;
import movie.service.ReservationService;
import movie.service.TimeTableService;
import movie.service.UserService;
import mvc.controller.CommandHandler;

public class LoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("get")){
		
			return "Login.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			UserService service = UserService.getInstance();
			User u = new User(id,password);
			User user = service.selectById(id);
			User user1 = service.selectByIdCheckpass(u);
			
			if(user == null){
				req.setAttribute("error","등록된 아이디가 없습니다.");
				return "Login.jsp";
			}else if(user1 == null){
				req.setAttribute("error","비밀번호가 일치하지 않습니다.");
				return "Login.jsp";
			}else if(user.getUserRank().equals("탈퇴회원")){
				req.setAttribute("error","탈퇴한 회원입니다.");
				return "Login.jsp";
			}			
			System.out.println(user);
			
			// RESERVATION.PROGRESS 영역 관리
			ReservationService reservationService = ReservationService.getInstance();
			List<Reservation> resultReserve = reservationService.selectById(id);
			TimeTableService timeTableService = TimeTableService.getInstance();
			Timetable resultTime = null;
			Date currentDate = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			for(Reservation reservation : resultReserve){
				resultTime = timeTableService.selectByNo(reservation.getTimetableNo());
				if(sf.format(resultTime.getEndTime()).compareTo(sf.format(currentDate)) < 0){
					reservation.setProgress(0);
					reservationService.fixReservation(reservation);
				}				
			}
			
			
			req.getSession().setAttribute("member",user);
			
			res.sendRedirect("/MovieProject/index.jsp");
			return null;
			
		}
		return null;
	}

}
