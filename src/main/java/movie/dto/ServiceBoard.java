package movie.dto;

import java.util.Date;

public class ServiceBoard {
	private int boardNo;
	private String userId;
	private String consulting;
	private String classification;
	private String title;
	private String content;
	private Date regdate;
	private boolean answer;
	private String answerContent;
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
	public String getConsulting() {
		return consulting;
	}
	public void setConsulting(String consulting) {
		this.consulting = consulting;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
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
	public boolean isAnswer() {
		return answer;
	}
	public void setAnswer(boolean answer) {
		this.answer = answer;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public ServiceBoard(int boardNo, String userId, String consulting, String classification, String title,
			String content, Date regdate, boolean answer, String answerContent) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.consulting = consulting;
		this.classification = classification;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.answer = answer;
		this.answerContent = answerContent;
	}
	
	public ServiceBoard(String userId, String consulting, String classification, String title,
			String content, Date regdate, boolean answer) {
		this.userId = userId;
		this.consulting = consulting;
		this.classification = classification;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.answer = answer;
	}
	
	
	public ServiceBoard(int boardNo, Date regdate, boolean answer, String answerContent) {
		super();
		this.boardNo = boardNo;
		this.regdate = regdate;
		this.answer = answer;
		this.answerContent = answerContent;
	}
	@Override
	public String toString() {
		return "ServiceBoard [boardNo=" + boardNo + ", userId=" + userId + ", consulting=" + consulting
				+ ", classification=" + classification + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", answer=" + answer + ", answerContent=" + answerContent + "]";
	}
}
