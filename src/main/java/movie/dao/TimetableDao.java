package movie.dao;

import java.util.List;

import movie.dto.Timetable;

public interface TimetableDao {
	public List<Timetable> selectAll();
	public List<Timetable> selectByMovie(int no);
	public List<Timetable> selectByTheater(int no);
	public void deleteByNo(int no);
}
