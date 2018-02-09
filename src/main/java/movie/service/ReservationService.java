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
}
