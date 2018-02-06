package movie.dao;

import java.util.List;

import movie.dto.User;

public interface UserDao {
	public List<User> selectAll();
	public User selectById(String id);
}
