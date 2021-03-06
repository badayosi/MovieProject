package movie.dao;

import java.util.List;

import movie.dto.Reservation;

public interface ReservationDao {
	public List<Reservation> selectAll();
	public List<Reservation> selectByTimeTable(int no);
	public List<Reservation> selectById(String id);
	public Reservation selectByUserAndTime(Reservation reservation);
	public void updateReservation(Reservation reservation);
	public void insertReservation(Reservation reservation);
	public void deleteReservation(Reservation reservation);
	public void fixReservation(Reservation reservation);
}
