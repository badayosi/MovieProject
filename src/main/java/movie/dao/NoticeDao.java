package movie.dao;

import java.util.List;
import movie.dto.Notice;

public interface NoticeDao {
	public int selectTosize();
	public int selectTosizeTitle(String search);
	public int selectTosizeContent(String search);
	public int selectTosizeTitleContent(String search);
	public List<Notice> selectLimit(int size);
	public List<Notice> selectByTitle(Notice notice);
	public List<Notice> selectByContent(Notice notice);
	public List<Notice> selectByContentTitle(Notice notice);
	public void insert(Notice notice);
	public void updateByreadCount(Notice notice);
	public List<Notice> selectByNo(int boardNo);
	public List<Notice> selectByOne(int boardNo);
	public void deleteNotice(int boardNo);
	public void updateNotice(Notice notice);
	public Notice selectByNoOne(int boardNo);
}
