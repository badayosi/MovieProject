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
		return null;
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
	
}
