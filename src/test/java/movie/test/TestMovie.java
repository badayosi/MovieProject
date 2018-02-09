package movie.test;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import movie.dao.AddressDao;
import movie.dao.BoardDao;
import movie.dao.MovieDao;
import movie.dao.ReservationDao;
import movie.dao.TheaterDao;
import movie.dao.TimetableDao;
import movie.dao.UserDao;
import movie.dao.UserRankDao;
import movie.dto.Address;
import movie.dto.Board;
import movie.dto.Movie;
import movie.dto.Reservation;
import movie.dto.Theater;
import movie.dto.Timetable;
import movie.dto.User;
import movie.dto.UserRank;
import mvc.util.MySqlSessionFactory;

public class TestMovie {
	
	//@Test
	public void testSelectAll3(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			MovieDao dao=session.getMapper(MovieDao.class);
			
			List<Movie> list=dao.selectAll();
			if(list.size()>0){
				for(Movie address: list){
					System.out.println(address);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
		//@Test
	public void insert(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			MovieDao dao=session.getMapper(MovieDao.class);
			Movie movie=new Movie(0, "홍길동", "posterImg.jpg", 120, 19, 0, new Date(), new Date(), "action", "img1.jpg, img2.jpg, img3.jpg", "video.mp4", "줄거리~~ 아빠~~~", "홍길동 외1 명", "배재진","df");
			dao.insert(movie);
			session.commit();
			//return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
	//return -1;
	}
	
	//@Test
	public void selectById(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			MovieDao dao=session.getMapper(MovieDao.class);
			int no=7;
			Movie movie=dao.selectById(no);
			System.out.println(movie);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}	
	}
	
	//@Test
	public void selectLastNo(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			MovieDao dao=session.getMapper(MovieDao.class);
			
			int lastNo=dao.selectLastNo();
			System.out.println(lastNo);
			//return 0;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
		//return 0;
	}

}
