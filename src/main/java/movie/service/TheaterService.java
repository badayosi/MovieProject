package movie.service;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.TheaterDao;
import movie.dto.Theater;
import mvc.util.MySqlSessionFactory;

public class TheaterService {
	private static final TheaterService instance = new TheaterService();

	public static TheaterService getInstance() {
		return instance;
	}

	public List<Theater> selectAll(){
		SqlSession session=null;
		List<Theater> list= null;
		try {
			session=MySqlSessionFactory.openSession();
			TheaterDao dao=session.getMapper(TheaterDao.class);
			
			list=dao.selectAll();
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
		return list;
	}
	
	public Theater selectById(int i){
		SqlSession session=null;
		Theater theater= null;
		try {
			session=MySqlSessionFactory.openSession();
			TheaterDao dao=session.getMapper(TheaterDao.class);
			
			theater=dao.selectById(i);
			
			return theater;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
		return theater;
	}
	
	public int deleteTheater(int i){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			TheaterDao dao=session.getMapper(TheaterDao.class);
			
			
			dao.delete(i);
			session.commit();
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}


	public int insertTheater(Theater theater){
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			TheaterDao dao=session.getMapper(TheaterDao.class);
			
			dao.insert(theater);
			session.commit();
			
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int updateTheater(Theater theater){
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			TheaterDao dao=session.getMapper(TheaterDao.class);
			
			dao.update(theater);
			session.commit();
			
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	
}
