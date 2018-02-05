package movie.dto;

import java.util.Date;

public class Movie {
	int movieNo;
	String movieName;
	String pathPoster;
	int playTime;
	int rating;
	double grade;
	Date openDate;
	Date closeDate;
	String genre;
	String pathSteelcut;
	String pathVideo;
	String synopsis;
	String actor;
	String director;

	public Movie() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Movie(int movieNo, String movieName, String pathPoster, int playTime, int rating, double grade,
			Date openDate, Date closeDate, String genre, String pathSteelcut, String pathVideo, String synopsis,
			String actor, String director) {
		super();
		this.movieNo = movieNo;
		this.movieName = movieName;
		this.pathPoster = pathPoster;
		this.playTime = playTime;
		this.rating = rating;
		this.grade = grade;
		this.openDate = openDate;
		this.closeDate = closeDate;
		this.genre = genre;
		this.pathSteelcut = pathSteelcut;
		this.pathVideo = pathVideo;
		this.synopsis = synopsis;
		this.actor = actor;
		this.director = director;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getPathPoster() {
		return pathPoster;
	}

	public void setPathPoster(String pathPoster) {
		this.pathPoster = pathPoster;
	}

	public int getPlayTime() {
		return playTime;
	}

	public void setPlayTime(int playTime) {
		this.playTime = playTime;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public Date getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getPathSteelcut() {
		return pathSteelcut;
	}

	public void setPathSteelcut(String pathSteelcut) {
		this.pathSteelcut = pathSteelcut;
	}

	public String getPathVideo() {
		return pathVideo;
	}

	public void setPathVideo(String pathVideo) {
		this.pathVideo = pathVideo;
	}

	public String getSynopsis() {
		return synopsis;
	}

	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	@Override
	public String toString() {
		return "Movie [movieNo=" + movieNo + ", movieName=" + movieName + ", pathPoster=" + pathPoster + ", playTime="
				+ playTime + ", rating=" + rating + ", grade=" + grade + ", openDate=" + openDate + ", closeDate="
				+ closeDate + ", genre=" + genre + ", pathSteelcut=" + pathSteelcut + ", pathVideo=" + pathVideo
				+ ", synopsis=" + synopsis + ", actor=" + actor + ", director=" + director + "]";
	}

}
