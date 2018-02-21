package movie.dto;

import java.util.Date;

public class MyMovieHistory {
	String userId;
	String movieNo;
	String movieName;
	String theaterName;
	Date startTime;
	String seat;
	int rating;
	String pathPoster;

	public MyMovieHistory() {
		super();
	}

	public MyMovieHistory(String userId, String movieNo, String movieName, String theaterName, Date startTime,
			String seat, int rating, String pathPoster) {
		super();
		this.userId = userId;
		this.movieNo = movieNo;
		this.movieName = movieName;
		this.theaterName = theaterName;
		this.startTime = startTime;
		this.seat = seat;
		this.rating = rating;
		this.pathPoster = pathPoster;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(String movieNo) {
		this.movieNo = movieNo;
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

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
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

	@Override
	public String toString() {
		return "MyMovieHistory [userId=" + userId + ", movieNo=" + movieNo + ", movieName=" + movieName
				+ ", theaterName=" + theaterName + ", startTime=" + startTime + ", seat=" + seat + ", rating=" + rating
				+ ", pathPoster=" + pathPoster + "]";
	}

	

}
