package movie.dao;

import java.util.List;
import movie.dto.Notice;

public interface NoticeDao {
	public int selectTosize();
	public List<Notice> selectLimit(int size);
	public List<Notice> selectByTitle(Notice notice);
	public List<Notice> selectByContent(Notice notice);
	public List<Notice> selectByContentTitle(Notice notice);
	public void insert(Notice notice);
	public void updateByreadCoutn(Notice notice);
	public List<Notice> selectByNo(int boardNo);

}
