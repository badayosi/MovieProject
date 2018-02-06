package movie.dao;

import java.util.List;

import movie.dto.Theater;

public interface TheaterDao {
	public List<Theater> selectAll();	
	public Theater selectById(int i);
	
	public void delete(int i);
	public void update(Theater theater);
	public int insert(Theater theater);
}
