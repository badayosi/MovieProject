package movie.dao;

import java.util.List;

import movie.dto.Reservation;

public interface ReservationDao {
	public List<Reservation> selectAll();
	public List<Reservation> selectByTimeTable(int no);
	public List<Reservation> selectByUserAndTime(Reservation reservation);
}
