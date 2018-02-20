package movie.dao;

import java.util.List;

import movie.dto.ReservationUser;

public interface ReservationUserDao {
	public List<ReservationUser> selectById(String userId); 
}
