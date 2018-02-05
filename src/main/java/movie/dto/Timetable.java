package movie.dto;

import java.util.Date;

public class Timetable {
	int tableNo;
	int movieNo;
	int theaterNo;
	Date startTime;
	Date endTime;

	public Timetable() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Timetable(int tableNo, int movieNo, int theaterNo, Date startTime, Date endTime) {
		super();
		this.tableNo = tableNo;
		this.movieNo = movieNo;
		this.theaterNo = theaterNo;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public int getTableNo() {
		return tableNo;
	}

	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public int getTheaterNo() {
		return theaterNo;
	}

	public void setTheaterNo(int theaterNo) {
		this.theaterNo = theaterNo;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return "Timetable [tableNo=" + tableNo + ", movieNo=" + movieNo + ", theaterNo=" + theaterNo + ", startTime="
				+ startTime + ", endTime=" + endTime + "]";
	}

}
