package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.ServiceBoardDao;
import movie.dao.UserDao;
import movie.dto.ServiceBoard;
import mvc.util.MySqlSessionFactory;

public class ServiceBoardService {
	private static final ServiceBoardService INSTANCE = new ServiceBoardService();
	
	private ServiceBoardService(){}
	
	public static ServiceBoardService getInstance() {
		return INSTANCE;
	}
	
	public List<ServiceBoard> selectByAll(int size){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		List<ServiceBoard> list = null;
		try{
			list = dao.selectByall(size);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return list;
	}
	
	public int insert(ServiceBoard sb){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		
		try{
			dao.insert(sb);
			session.commit();
			return 0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int update(ServiceBoard sb){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		
		try{
			dao.update(sb);
			session.commit();
			return 0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int selectTosize(){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		
		try{
			return dao.selectTosize();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int insertFile(ServiceBoard sb){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		System.out.println(sb.getFilename());
		System.out.println(sb.getFilepath());
		try{
			dao.insertFile(sb);
			session.commit();
			return 0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
}
