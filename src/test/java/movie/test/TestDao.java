package movie.test;

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

public class TestDao {

	//@Test
	public void testSelectAll1(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			AddressDao dao=session.getMapper(AddressDao.class);
			
			List<Address> list=dao.selectAll();
			if(list.size()>0){
				for(Address address: list){
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
	public void testSelectAll2(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			BoardDao dao=session.getMapper(BoardDao.class);
			
			List<Board> list=dao.selectAll();
			if(list.size()>0){
				for(Board address: list){
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
	public void testSelectAll4(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			ReservationDao dao=session.getMapper(ReservationDao.class);
			
			List<Reservation> list=dao.selectAll();
			if(list.size()>0){
				for(Reservation address: list){
					System.out.println(address);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
	
	@Test
	public void testSelectAll5(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			TheaterDao dao=session.getMapper(TheaterDao.class);
			
			List<Theater> list=dao.selectAll();
			if(list.size()>0){
				for(Theater address: list){
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
	public void testSelectAll6(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			TimetableDao dao=session.getMapper(TimetableDao.class);
			
			List<Timetable> list=dao.selectAll();
			if(list.size()>0){
				for(Timetable address: list){
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
	public void testSelectAll7(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			UserDao dao=session.getMapper(UserDao.class);
			
			List<User> list=dao.selectAll();
			if(list.size()>0){
				for(User address: list){
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
	public void testSelectAll8(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			UserRankDao dao=session.getMapper(UserRankDao.class);
			
			List<UserRank> list=dao.selectAll();
			if(list.size()>0){
				for(UserRank address: list){
					System.out.println(address);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
	
	

}
