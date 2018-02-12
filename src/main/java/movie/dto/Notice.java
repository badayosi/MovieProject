package movie.dto;

import java.util.Date;

public class Notice {
	private int boardNo;
	private String title;
	private String content;
	private Date regdate;
	private int readcount;
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int board_no) {
		this.boardNo = board_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Notice(String title, String content, Date regdate, int readcount) {
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.readcount = readcount;
	}
	@Override
	public String toString() {
		return "Notice [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", readcount=" + readcount + "]";
	}
	
	
}

