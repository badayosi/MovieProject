package movie.dao;

import java.util.List;

import movie.dto.User;

public interface UserDao {
	public List<User> selectAll();
	public User selectById(String id);
	public User selectByIdCheckpass(User user);
	public void insertUser(User user);
}
