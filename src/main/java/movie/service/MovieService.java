package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.MovieDao;
import movie.dto.Movie;
import mvc.util.MySqlSessionFactory;

public class MovieService {
	private static final MovieService instance = new MovieService();

	public static MovieService getInstance() {
		return instance;
	}

	public List<Movie> selectAll() {
		try (SqlSession session = MySqlSessionFactory.openSession();) {
			MovieDao dao = session.getMapper(MovieDao.class);
			List<Movie> list = dao.selectAll();

			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Movie selectById(int no) {
		try (SqlSession session = MySqlSessionFactory.openSession();) {
			MovieDao dao = session.getMapper(MovieDao.class);
			Movie movie = dao.selectById(no);

			return movie;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int selectLastNo() {
		try (SqlSession session = MySqlSessionFactory.openSession();) {
			MovieDao dao = session.getMapper(MovieDao.class);
			int lastNo = dao.selectLastNo();
			
			return lastNo;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public String selectFilePath(int no) {
		try (SqlSession session = MySqlSessionFactory.openSession();) {
			MovieDao dao = session.getMapper(MovieDao.class);
			String mNo=dao.selectFilePath(no);
			
			return mNo;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int insert(Movie movie) {
		try (SqlSession session = MySqlSessionFactory.openSession();) {
			MovieDao dao = session.getMapper(MovieDao.class);
			int result = dao.insert(movie);
			session.commit();
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateWithFile(Movie movie){
		try (SqlSession session = MySqlSessionFactory.openSession();) {
			MovieDao dao = session.getMapper(MovieDao.class);
			int result = dao.updateWithFile(movie);
			session.commit();
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateWithOutFile(Movie movie){
		try (SqlSession session = MySqlSessionFactory.openSession();) {
			MovieDao dao = session.getMapper(MovieDao.class);
			int result = dao.updateWithOutFile(movie);
			session.commit();
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int no){
		try(SqlSession session=MySqlSessionFactory.openSession();) {
			MovieDao dao=session.getMapper(MovieDao.class);
			dao.delete(no);
			
			session.commit();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
