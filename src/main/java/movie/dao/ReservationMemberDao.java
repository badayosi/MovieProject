package movie.dao;

import java.util.List;

import movie.dto.ReservationMember;

public interface ReservationMemberDao {
	public List<ReservationMember> selectById(String id);
	public List<ReservationMember> selectByAll();
}
