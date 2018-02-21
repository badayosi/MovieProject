package movie.dao;

import java.util.List;

import movie.dto.ServiceBoard;

public interface ServiceBoardDao {
	public List<ServiceBoard> selectByall();
	public void insert(ServiceBoard sb);
	public void update(ServiceBoard sb);
	public int selectTosize();
	public ServiceBoard selectById(int boardNo);
	public void insertFile(ServiceBoard sb);
	public List<ServiceBoard> selectByUserlist(String userid);
	public List<ServiceBoard> selectBytitle(ServiceBoard sb);
}
