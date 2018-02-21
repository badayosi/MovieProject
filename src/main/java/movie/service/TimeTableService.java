package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.MovieDao;
import movie.dao.TimetableDao;
import movie.dto.Movie;
import movie.dto.Timetable;
import mvc.util.MySqlSessionFactory;

public class TimeTableService {
	private static final TimeTableService INSTANCE = new TimeTableService();

	private TimeTableService() {
		super();
	}

	public static TimeTableService getInstance() {
		return INSTANCE;
	}
	
	public List<Timetable> selectByMovie(int no){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			TimetableDao dao = session.getMapper(TimetableDao.class);
			
			List<Timetable> result = dao.selectByMovie(no);
			
			return result;
		} finally {
			MySqlSessionFactory.closeSession(session);
		}		
	}
	
	public List<Timetable> selectByTheater(int no){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			TimetableDao dao = session.getMapper(TimetableDao.class);
			
			List<Timetable> result = dao.selectByTheater(no);

			return result;
		} finally {
			MySqlSessionFactory.closeSession(session);
		}		
	}
	
	public List<Timetable> selectByDate(int theaterNo, String date){
		try (SqlSession session = MySqlSessionFactory.openSession();) {
			TimetableDao dao = session.getMapper(TimetableDao.class);
			List<Timetable> list = dao.selectByDate(theaterNo, date);

			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void deleteByNo(int no){
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			TimetableDao dao = session.getMapper(TimetableDao.class);
			
			dao.deleteByNo(no);
			
			session.commit();
		} finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
	
	public void insert(Timetable timetable){
		try (SqlSession session = MySqlSessionFactory.openSession();) {
			TimetableDao dao = session.getMapper(TimetableDao.class);
			dao.insert(timetable);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
