package movie.dao;

import java.util.List;

import movie.dto.UserRank;

public interface UserRankDao {
	public List<UserRank> selectAll();
}
