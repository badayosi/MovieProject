package movie.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import movie.dao.ReservationGuideDao;
import movie.dto.ReservationGuide;
import mvc.util.MySqlSessionFactory;

public class TestReservation {

	//@Test
	public void testSelectAll1(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			ReservationGuideDao dao = session.getMapper(ReservationGuideDao.class);
			String id = "user2";
			
			List<ReservationGuide> list = dao.selectById(id);
			
			for(ReservationGuide member : list){
				System.out.println(member.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
}
