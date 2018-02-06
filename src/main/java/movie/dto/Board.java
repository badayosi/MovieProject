package movie.dto;

import java.util.Date;

public class Board {
	int boardNo;
	String userId;
	int movieNo;
	String boardTitle;
	String boardContent;
	Date regdate;
	int grade;
	
	

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Board(int boardNo, String userId, int movieNo, String boardTitle, String boardContent, Date regdate,
			int grade) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.movieNo = movieNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.regdate = regdate;
		this.grade = grade;
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

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
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
		return "Board [boardNo=" + boardNo + ", userId=" + userId + ", movieNo=" + movieNo + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", regdate=" + regdate + ", grade=" + grade + "]";
	}

}
