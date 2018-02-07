package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.ReservationMemberDao;
import movie.dto.ReservationMember;
import mvc.util.MySqlSessionFactory;

public class ReservationMemberService {
	private static final ReservationMemberService INSTANCE = new ReservationMemberService();

	private ReservationMemberService() {
		super();
	}

	public static ReservationMemberService getInstance() {
		return INSTANCE;
	}
	
	public List<ReservationMember> selectById(String id){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReservationMemberDao dao = session.getMapper(ReservationMemberDao.class);
			
			List<ReservationMember> result = dao.selectById(id);
			
			return result;
		} finally {
			MySqlSessionFactory.closeSession(session);
		}		
	}
	
	public List<ReservationMember> selectByAll(){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReservationMemberDao dao = session.getMapper(ReservationMemberDao.class);
			
			List<ReservationMember> result = dao.selectByAll();
			
			return result;
		} finally {
			MySqlSessionFactory.closeSession(session);
		}
	}

}
