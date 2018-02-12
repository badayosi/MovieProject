package movie.dto;

import java.util.Date;

public class Board {
	int boardNo;
	String userId;
	int movieNo;
	String boardContent;
	Date regdate;
	int grade;
	private String userName;
	

	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public Board(String userId, int movieNo, String boardContent, Date regdate, int grade,
			String userName) {
		super();
		this.userId = userId;
		this.movieNo = movieNo;
		this.boardContent = boardContent;
		this.regdate = regdate;
		this.grade = grade;
		this.userName = userName;
	}



	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", userId=" + userId + ", movieNo=" + movieNo + ", boardContent=" + boardContent + ", regdate=" + regdate + ", grade=" + grade + "]";
	}

}
