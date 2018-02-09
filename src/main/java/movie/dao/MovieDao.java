package movie.dao;

import java.util.List;

import movie.dto.Movie;

public interface MovieDao {
	public List<Movie> selectAll();
	
	public int insert(Movie movie);
	
	public Movie selectById(int no);
	
	public int selectLastNo();
	
	public String selectFilePath(int no);
	
	public int updateWithFile(Movie movie);
	
	public int updateWithOutFile(Movie movie);
}
