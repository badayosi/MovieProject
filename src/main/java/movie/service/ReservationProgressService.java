package movie.service;

import org.apache.ibatis.session.SqlSession;

import movie.dao.ReservationProgressDao;
import movie.dto.ReservationProgress;
import mvc.util.MySqlSessionFactory;

public class ReservationProgressService {
	private static final ReservationProgressService INSTANCE = new ReservationProgressService();

	private ReservationProgressService() {
		super();
	}

	public static ReservationProgressService getInstance() {
		return INSTANCE;
	}
	
	public ReservationProgress selectByTimetable(int tableNo) {
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReservationProgressDao dao = session.getMapper(ReservationProgressDao.class);
			ReservationProgress result = dao.selectByTimetable(tableNo);
			result.setRestSeat(result.getMaxSeat());
			
			return result;
		} finally {
			MySqlSessionFactory.closeSession(session);
		}
	}

}
