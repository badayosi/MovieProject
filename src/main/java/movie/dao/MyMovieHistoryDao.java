package movie.dao;

import java.util.List;

import movie.dto.MyMovieHistory;

public interface MyMovieHistoryDao {	
	public List<MyMovieHistory> selectById(String userId);
	
}
