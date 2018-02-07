package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.ReservationGuideDao;
import movie.dto.ReservationGuide;
import mvc.util.MySqlSessionFactory;

public class ReservationGuideService {
	private static final ReservationGuideService INSTANCE = new ReservationGuideService();

	private ReservationGuideService() {
		super();
	}

	public static ReservationGuideService getInstance() {
		return INSTANCE;
	}
	
	public List<ReservationGuide> selectById(String id){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReservationGuideDao dao = session.getMapper(ReservationGuideDao.class);
			
			List<ReservationGuide> result = dao.selectById(id);
			
			return result;
		} finally {
			MySqlSessionFactory.closeSession(session);
		}		
	}
	
	public List<ReservationGuide> selectByAll(){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReservationGuideDao dao = session.getMapper(ReservationGuideDao.class);
			
			List<ReservationGuide> result = dao.selectByAll();
			
			return result;
		} finally {
			MySqlSessionFactory.closeSession(session);
		}
	}

}
