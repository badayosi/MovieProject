package movie.dao;

import movie.dto.ReservationProgress;

public interface ReservationProgressDao {
	public ReservationProgress selectByTimetable(int tableNo);
}
