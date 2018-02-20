package movie.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import movie.dao.MyMovieHistoryDao;
import movie.dto.MyMovieHistory;
import mvc.util.MySqlSessionFactory;

public class TestMyMovieHistory {

	@Test
	public void selectById() {
		try (SqlSession session = MySqlSessionFactory.openSession();) {
			String userId="test1";
			MyMovieHistoryDao dao = session.getMapper(MyMovieHistoryDao.class);
			List<MyMovieHistory> list = dao.selectById(userId);
			if(list.size()>0){
				for(MyMovieHistory address: list){
					System.out.println(address);
				}
			
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
