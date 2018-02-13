package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.BoardDao;
import movie.dao.UserDao;
import movie.dto.Board;
import mvc.util.MySqlSessionFactory;

public class BoardService {
	private static final BoardService INSTANCE = new BoardService();

	private BoardService() {
		super();
	}

	public static BoardService getInstance() {
		return INSTANCE;
	}
	
	public int selectTosize(){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		BoardDao dao = session.getMapper(BoardDao.class);
		
		try{
			return dao.selectTosize();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		
		return -1;
	}
	public int insertBoard(Board board){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		BoardDao dao = session.getMapper(BoardDao.class);
		
		try{
			dao.insert_board(board);
			session.commit();
			return 0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		
		return -1;
	}
	
	public List<Board> selectLimit(int size){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		BoardDao dao = session.getMapper(BoardDao.class);
		
		try{
			return dao.selectLimit(size);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return null;
	}
}
