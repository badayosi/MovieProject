package movie.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import movie.dao.ReservationMemberDao;
import movie.dto.ReservationMember;
import mvc.util.MySqlSessionFactory;

public class TestReservation {

	//@Test
	public void testSelectAll1(){
		SqlSession session=null;
		try {
			session=MySqlSessionFactory.openSession();
			ReservationMemberDao dao = session.getMapper(ReservationMemberDao.class);
			String id = "user2";
			
			List<ReservationMember> list = dao.selectById(id);
			
			for(ReservationMember member : list){
				System.out.println(member.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MySqlSessionFactory.closeSession(session);
		}
	}
}
