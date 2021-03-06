package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.UserDao;
import movie.dto.User;
import mvc.util.MySqlSessionFactory;

public class UserService{
	private static final UserService INSTANCE = new UserService();
	
	private UserService() {}

	public static UserService getInstance() {
		return INSTANCE;
	}


	public List<User> selectAll() {
		// TODO Auto-generated method stub
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		List<User> list = null;
		
		try {
			session=MySqlSessionFactory.openSession();
			UserDao dao=session.getMapper(UserDao.class);
			
			list=dao.selectAll();
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
		return list;
		
	}

	public User selectByIdCheckpass(User user){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		UserDao dao = session.getMapper(UserDao.class);
		User u = null;
		try{
			u = dao.selectByIdCheckpass(user);
			if(u == null){
				return null;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return u;
	}
	
	public User selectById(String id) {
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		UserDao dao = session.getMapper(UserDao.class);
		User user = null;
		try{
			user = dao.selectById(id);
			if(user == null){
				return null;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return user;
	}
	
	public User findId(User u) {
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		UserDao dao = session.getMapper(UserDao.class);
		User user = null;
		try{
			user = dao.findId(u);
			if(user == null){
				return null;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return user;
	}
	
	public User findPw(User u) {
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		UserDao dao = session.getMapper(UserDao.class);
		User user = null;
		try{
			user = dao.findPw(u);
			if(user == null){
				return null;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return user;
	}
	
	public int insertUser(User user){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		UserDao dao = session.getMapper(UserDao.class);
		
		try{
			dao.insertUser(user);
			session.commit();
			return 0;
		}catch(Exception e){
			
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		
		return -1;
	}
	
	public int deleteUser(String id){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		UserDao dao = session.getMapper(UserDao.class);
		
		try{
			dao.deleteUser(id);
			session.commit();
			return 0;
		}catch(Exception e){
			
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		
		return -1;
	}
	

	public int updateUser(User user){
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			UserDao dao=session.getMapper(UserDao.class);
			
			dao.update(user);
			session.commit();
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int userUpdate(User user){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		UserDao dao = session.getMapper(UserDao.class);
		
		try{
			
			dao.userUpdate(user);
			session.commit();
			return 0;
		}catch(Exception e){
			
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int passwordUpdate(User user){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		UserDao dao = session.getMapper(UserDao.class);
		
		try{
			dao.passwordUpdate(user);
			session.commit();
			return 0;
		}catch(Exception e){
			
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int deleteUpdate(String id){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		UserDao dao = session.getMapper(UserDao.class);
		
		try{
			dao.deleteUpdate(id);
			session.commit();
			return 0;
		}catch(Exception e){
			
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int updatePw(User user){
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			UserDao dao=session.getMapper(UserDao.class);
			System.out.println(user);
			dao.updatePw(user);
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
