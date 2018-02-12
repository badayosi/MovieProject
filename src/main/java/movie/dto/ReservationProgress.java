package movie.dto;

import java.util.Date;

public class ReservationProgress {
	private int timeNo;
	private Date startTime;
	private String theaterName;
	private String theaterType;
	private int restSeat;
	private int maxSeat;

	public ReservationProgress() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getTimeNo() {
		return timeNo;
	}

	public void setTimeNo(int timeNo) {
		this.timeNo = timeNo;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public String getTheaterType() {
		return theaterType;
	}

	public void setTheaterType(String theaterType) {
		this.theaterType = theaterType;
	}

	public int getRestSeat() {
		return restSeat;
	}

	public void setRestSeat(int restSeat) {
		this.restSeat = restSeat;
	}

	public int getMaxSeat() {
		return maxSeat;
	}

	public void setMaxSeat(int maxSeat) {
		this.maxSeat = maxSeat;
	}

	@Override
	public String toString() {
		return "ReservationProgress [timeNo=" + timeNo + ", startTime=" + startTime + ", theaterName=" + theaterName
				+ ", theaterType=" + theaterType + ", restSeat=" + restSeat + ", maxSeat=" + maxSeat + "]";
	}

}
