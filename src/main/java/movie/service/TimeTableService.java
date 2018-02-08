package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.ReservationGuideDao;
import movie.dao.TimetableDao;
import movie.dto.ReservationGuide;
import mvc.util.MySqlSessionFactory;

public class TimeTableService {
	private static final TimeTableService INSTANCE = new TimeTableService();

	private TimeTableService() {
		super();
	}

	public static TimeTableService getInstance() {
		return INSTANCE;
	}
	
	public List<ReservationGuide> selectByMovie(int no){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			TimetableDao dao = session.getMapper(TimetableDao.class);
			
			//List<ReservationGuide> result = dao.selectByMovie(no);
			
			//return result;
			return null;
		} finally {
			MySqlSessionFactory.closeSession(session);
		}		
	}
}
