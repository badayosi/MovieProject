package movie.dto;

import java.util.Date;

public class ReservationGuide {
	private int reservationNo;
	private String userId;
	private String movieName;
	private int theaterFloor;
	private String theaterName;
	private String theaterType;
	private Date startTime;
	private Date endTime;
	private String seat;
	private int price;

	public ReservationGuide() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReservationGuide(int reservationNo, String userId, String movieName, int theaterFloor, String theaterName,
			String theaterType, Date startTime, Date endTime, String seat, int price) {
		super();
		this.reservationNo = reservationNo;
		this.userId = userId;
		this.movieName = movieName;
		this.theaterFloor = theaterFloor;
		this.theaterName = theaterName;
		this.theaterType = theaterType;
		this.startTime = startTime;
		this.endTime = endTime;
		this.seat = seat;
		this.price = price;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public int getTheaterFloor() {
		return theaterFloor;
	}

	public void setTheaterFloor(int theaterFloor) {
		this.theaterFloor = theaterFloor;
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

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "ReservationMember [reservationNo=" + reservationNo + ", userId=" + userId + ", movieName=" + movieName
				+ ", theaterFloor=" + theaterFloor + ", theaterName=" + theaterName + ", theaterType=" + theaterType
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", seat=" + seat + ", price=" + price + "]";
	}

}
