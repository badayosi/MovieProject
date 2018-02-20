package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.ReservationUserDao;
import movie.dto.ReservationUser;
import mvc.util.MySqlSessionFactory;

public class ReservationUserService {
	private static final ReservationUserService INSTANCE = new ReservationUserService();

	private ReservationUserService() {
		super();
	}

	public static ReservationUserService getInstance() {
		return INSTANCE;
	}
	
	public List<ReservationUser> selectById(String id){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReservationUserDao dao = session.getMapper(ReservationUserDao.class);
			
			List<ReservationUser> result = dao.selectById(id);
			
			return result;
		} finally {
			MySqlSessionFactory.closeSession(session);
		}		
	}
}
