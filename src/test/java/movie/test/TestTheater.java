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
import movie.service.TheaterService;
import movie.service.UserService;
import mvc.util.MySqlSessionFactory;

public class TestTheater {

	//@Test
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
	public void testSelectById(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			TheaterDao dao=session.getMapper(TheaterDao.class);
			
			Theater list=dao.selectById(1);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
	
	//@Test
	public void testInsert(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			TheaterDao dao=session.getMapper(TheaterDao.class);
			
			Theater t = new Theater("3관", 8, 40, "H", 10, "IMAX");
			int a = dao.insert(t);
			System.out.println("----"+a);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
	
	//  @Test
	public void test(){
		TheaterService service = TheaterService.getInstance();
		Theater theater = new Theater(3, "4관", 100, 100, "G", 10, "일반");
		theater.setTheaterTable("test111");
		int a = service.updateTheaterTable(theater);
		//System.out.println(a);
	}
	
	//@Test
	public void testdelete(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			TheaterDao dao=session.getMapper(TheaterDao.class);
			
			
			dao.delete(2);
			session.commit();
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
	
	//@Test
	public void testUpdate(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			TheaterDao dao=session.getMapper(TheaterDao.class);
			
			Theater t = new Theater(3, "1관", 9, 50, "G", 10, "일반");
			t.setTheaterTable("table");
			dao.update_table(t);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
	
	//@Test
	public void testUpdate1(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			UserDao dao=session.getMapper(UserDao.class);
			
			User u = new User("user2", "12345", 300, "user10@test.com", "0101235789", "대구 동구", "여자", "관리자", "이름");
					
			dao.update(u);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
	
	@Test
	public void testfind(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			UserService service = UserService.getInstance();
			
			User user = new User();
			user.setUserId("user2111");
			user.setEmail("user2@test.com");
			
			user.setPassword("1234456");
			int r = service.updatePw(user);
			User u = service.findPw(user);
			
			System.out.println(u.toString());
			System.out.println(r);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
	}

}
