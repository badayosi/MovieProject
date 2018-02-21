package movie.dao;

import java.util.List;

import movie.dto.Timetable;

public interface TimetableDao {
	public List<Timetable> selectAll();
	public List<Timetable> selectByMovie(int no);
	public List<Timetable> selectByTheater(int no);
	public List<Timetable> selectByDate(int theaterNo, String date);
	public Timetable selectByNo(int no);
	public void deleteByNo(int no);
	public void insert(Timetable timetable);
}
