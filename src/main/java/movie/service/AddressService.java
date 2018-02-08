package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.AddressDao;
import movie.dao.UserDao;
import movie.dto.Address;
import movie.dto.User;
import mvc.util.MySqlSessionFactory;

public class AddressService {
	private static final AddressService INSTANCE = new AddressService();
	private AddressService() {}

	
	public static AddressService getInstance() {
		return INSTANCE;
	}
	public List<Address> selectByDoro(String doro) {
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		AddressDao dao = session.getMapper(AddressDao.class);
		List<Address> lists = null;
		try{
			lists = dao.selectBydoro(doro);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return lists;
	}
}
