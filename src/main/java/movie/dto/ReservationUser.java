package movie.dto;

import java.util.Date;

public class ReservationUser {
	private int no;
	private String userId;
	private String movieName;
	private int movieNo;
	private String theaterName;
	private String theaterType;
	private String seat;
	private Date startTime;
	private int price;
	private int rating;
	private String pathPoster;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getPathPoster() {
		return pathPoster;
	}
	public void setPathPoster(String pathPoster) {
		this.pathPoster = pathPoster;
	}
	
	public ReservationUser() {
		super();
	}
	@Override
	public String toString() {
		return "ReservationUser [no=" + no + ", userId=" + userId + ", movieName=" + movieName + ", movieNo=" + movieNo
				+ ", theaterName=" + theaterName + ", theaterType=" + theaterType + ", seat=" + seat + ", startTime="
				+ startTime + ", price=" + price + ", rating=" + rating + ", pathPoster=" + pathPoster + "]";
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public ReservationUser(int no, String userId, String movieName, int movieNo, String theaterName, String theaterType,
			String seat, Date startTime, int price, int rating, String pathPoster) {
		super();
		this.no = no;
		this.userId = userId;
		this.movieName = movieName;
		this.movieNo = movieNo;
		this.theaterName = theaterName;
		this.theaterType = theaterType;
		this.seat = seat;
		this.startTime = startTime;
		this.price = price;
		this.rating = rating;
		this.pathPoster = pathPoster;
	}

}
