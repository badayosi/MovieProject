package movie.dao;

import java.util.List;

import movie.dto.Reservation;

public interface ReservationDao {
	public List<Reservation> selectAll();
	public List<Reservation> selectByTimeTable(int no);
}
