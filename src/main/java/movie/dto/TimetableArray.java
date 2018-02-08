package movie.dto;

import java.util.List;

public class TimetableArray {
	private List<List<Timetable>> timetables;

	public TimetableArray() {
		super();
	}

	public void addTimetable(List<Timetable> timetable){
		timetables.add(timetable);
	}
}
