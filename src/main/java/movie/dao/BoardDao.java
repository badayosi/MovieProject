package movie.dao;

import java.util.List;

import movie.dto.Board;

public interface BoardDao {
	public List<Board> selectAll();
	public void insert_board(Board board);
	public int selectTosize();
	public List<Board> selectLimit(int size);
}
