package movie.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import movie.dao.AddressDao;
import movie.dao.BoardDao;
import movie.dao.MovieDao;
import movie.dao.ReservationDao;
import movie.dao.TheaterDao;
import movie.dao.TimetableDao;
import movie.dao.UserDao;
import movie.dao.UserRankDao;
import movie.dto.Address;
import movie.dto.Board;
import movie.dto.Movie;
import movie.dto.Reservation;
import movie.dto.Theater;
import movie.dto.Timetable;
import movie.dto.User;
import movie.dto.UserRank;
import movie.service.ReservationService;
import movie.service.TimeTableService;
import mvc.util.MySqlSessionFactory;

public class TestDao {

	@Test
	public void testCode(){
		ReservationService reservationService = ReservationService.getInstance();
		List<Reservation> resultReserve = reservationService.selectById("user1");
		
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
	}
}
