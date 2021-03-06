package movie.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dao.NoticeDao;
import movie.dao.ServiceBoardDao;
import movie.dto.Notice;
import movie.dto.ServiceBoard;
import mvc.util.MySqlSessionFactory;

public class NoticeService {
	private static final NoticeService INSTANCE = new NoticeService();

	public static NoticeService getInstance() {
		return INSTANCE;
	}

	private NoticeService() {}
	
	public List<Notice> selectByAll(int size){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		List<Notice> list = null;
		try{
			list = dao.selectLimit(size);
			for(Notice n : list){
				
			}
			return list;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return list;
	}
	
	public int insert(Notice notice){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		
		try{
			dao.insert(notice);
			session.commit();
			return 0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int update(Notice notice){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		
		try{
			dao.updateByreadCount(notice);
			session.commit();
			return 0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int selectTosize(){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		
		try{
			return dao.selectTosize();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	public List<Notice> selectByNo(int boardNo){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		List<Notice> notice = null;
		try{
			notice = dao.selectByNo(boardNo);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		
		return notice;
	}
	public List<Notice> selectByOne(int boardNo){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		List<Notice> notice = null;
		try{
			notice = dao.selectByOne(boardNo);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		
		return notice;
	}
	public List<Notice> selectByTitle(Notice notice){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		List<Notice> list = null;
		try{
			list = dao.selectByTitle(notice);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return list;
	}
	public List<Notice> selectByContent(Notice notice){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		List<Notice> list = null;
		try{
			list = dao.selectByContent(notice);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return list;
	}
	public List<Notice> selectByContentTitle(Notice notice){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		List<Notice> list = null;
		try{
			list = dao.selectByContentTitle(notice);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return list;
	}
	public int selectTosizeTitle(String search){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		
		try{
			return dao.selectTosizeTitle(search);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int selectTosizeContent(String search){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		
		try{
			return dao.selectTosizeContent(search);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int selectTosizeTitleContent(String search){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		
		try{
			return dao.selectTosizeTitleContent(search);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int deleteNotice(int boardNo){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		
		try{
			dao.deleteNotice(boardNo);
			session.commit();
			return 0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public int updateNotice(Notice notice){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		
		try{
			dao.updateNotice(notice);
			session.commit();
			return 0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return -1;
	}
	
	public Notice selectByNoOne(int boardNo){
		SqlSession session = null;
		session = MySqlSessionFactory.openSession();
		NoticeDao dao = session.getMapper(NoticeDao.class);
		
		try{
			return dao.selectByNoOne(boardNo);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			MySqlSessionFactory.closeSession(session);
		}
		return null;
	}
}
