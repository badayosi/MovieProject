package movie.dao;

import java.util.List;

import movie.dto.ReservationGuide;

public interface ReservationGuideDao {
	public List<ReservationGuide> selectById(String id);
	public List<ReservationGuide> selectByAll();
}
