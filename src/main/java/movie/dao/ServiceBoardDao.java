package movie.dao;

import java.util.List;

import movie.dto.ServiceBoard;

public interface ServiceBoardDao {
	public List<ServiceBoard> selectByall(int size);
	public void insert(ServiceBoard sb);
	public void update(ServiceBoard sb);
	public int selectTosize();
	public ServiceBoard selectById(int boardNo);
}