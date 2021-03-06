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
	public void delete(int boardNo){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		try{
			dao.delete(boardNo);
			session.commit();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
	}
	public List<ServiceBoard> selectByAll(){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		List<ServiceBoard> list = null;
		try{
			list = dao.selectByall();
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
	
	public ServiceBoard selectByNo(int boardNo){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		try{
			return dao.selectById(boardNo);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return null;
	}
	
	public List<ServiceBoard> selectByUserList(String userid){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		List<ServiceBoard> list = null;
		try{
			list = dao.selectByUserlist(userid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return list;
	}
	
	public List<ServiceBoard> selectBytitle(ServiceBoard sb){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		List<ServiceBoard> list = null;
		try{
			list = dao.selectBytitle(sb);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return list;
	}
	
	public List<ServiceBoard> selectByanswer(boolean b){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		List<ServiceBoard> list = null;
		try{
			list = dao.selectByanswer(b);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return list;
	}
	public List<ServiceBoard> selectByuserIdTitle(String title){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		List<ServiceBoard> list = null;
		try{
			list = dao.selectByuserIdTitle(title);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return list;
	}
	public List<ServiceBoard> selectByUserserachlist(String userId){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		ServiceBoardDao dao = session.getMapper(ServiceBoardDao.class);
		List<ServiceBoard> list = null;
		try{
			list = dao.selectByUserserachlist(userId);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return list;
	}
}
