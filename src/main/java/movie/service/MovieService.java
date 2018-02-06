package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.MovieDao;
import movie.dto.Movie;
import mvc.util.MySqlSessionFactory;

public class MovieService {
	private static final MovieService instance=new MovieService();

	public static MovieService getInstance() {
		return instance;
	}
	
	public List<Movie> selectAll(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			MovieDao dao=session.getMapper(MovieDao.class);
			
			List<Movie> list=dao.selectAll();
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
		return null;
	}
}
