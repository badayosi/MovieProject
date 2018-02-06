package movie.dao;

import java.util.List;

import movie.dto.Movie;

public interface MovieDao {
	public List<Movie> selectAll();
	
	public int insert(Movie movie);
}
