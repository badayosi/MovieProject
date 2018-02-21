package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.MovieDao;
import movie.dao.MyMovieHistoryDao;
import movie.dto.Movie;
import movie.dto.MyMovieHistory;
import mvc.util.MySqlSessionFactory;

public class MyMovieHistoryService {
	private static final MyMovieHistoryService instance = new MyMovieHistoryService();

	public static MyMovieHistoryService getInstance() {
		return instance;
	}

	public List<MyMovieHistory> selectById(String userId) {
		try (SqlSession session = MySqlSessionFactory.openSession();) {
			MyMovieHistoryDao dao = session.getMapper(MyMovieHistoryDao.class);
			List<MyMovieHistory> list = dao.selectById(userId);

			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
