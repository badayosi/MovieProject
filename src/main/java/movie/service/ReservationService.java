package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.ReservationDao;
import movie.dto.Reservation;
import mvc.util.MySqlSessionFactory;

public class ReservationService {
	private static final ReservationService INSTANCE = new ReservationService();

	private ReservationService() {
		super();
	}

	public static ReservationService getInstance() {
		return INSTANCE;
	}
	
	public List<Reservation> selectByTimeTable(int no){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReservationDao dao = session.getMapper(ReservationDao.class);
			
			List<Reservation> result = dao.selectByTimeTable(no);
			
			return result;
		} finally {
			MySqlSessionFactory.closeSession(session);
		}		
	}
	
	public List<Reservation> selectByAll(){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReservationDao dao = session.getMapper(ReservationDao.class);
			
			List<Reservation> result = dao.selectAll();
			
			return result;
		} finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
	
	public Reservation selectByUserAndTime(String id, int timeNo){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReservationDao dao = session.getMapper(ReservationDao.class);
			Reservation reservation = new Reservation();
			
			reservation.setUserId(id);
			reservation.setTimetableNo(timeNo);
			
			Reservation result = dao.selectByUserAndTime(reservation);
			
			return result;
		} finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
	
	public void updateReservation(Reservation reservation){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReservationDao dao = session.getMapper(ReservationDao.class);
			
			dao.updateReservation(reservation);
			
			session.commit();
		} finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
	
	public void insertReservation(Reservation reservation){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReservationDao dao = session.getMapper(ReservationDao.class);
			
			dao.insertReservation(reservation);
			
			session.commit();
		} finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
	
	public void deleteReservation(Reservation reservation){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReservationDao dao = session.getMapper(ReservationDao.class);
			
			dao.deleteReservation(reservation);
			
			session.commit();
		} finally {
			MySqlSessionFactory.closeSession(session);
		}
		
	}
}
