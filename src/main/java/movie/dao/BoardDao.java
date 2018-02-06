package movie.dao;

import java.util.List;

import movie.dto.Board;

public interface BoardDao {
	public List<Board> selectAll();
}
