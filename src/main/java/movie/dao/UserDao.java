package movie.dao;

import java.util.List;

import movie.dto.User;

public interface UserDao {
	public List<User> selectAll();
	public User selectById(String id);
	public User selectByIdCheckpass(User user);
	public void insertUser(User user);
	public void update(User user);
	public void deleteUser(String id);
	public void userUpdate(User user);
	public void passwordUpdate(User user);
	public void deleteUpdate(String id);
	public User findId(User user);
	public User findPw(User user);
	public int updatePw(User user);
}
