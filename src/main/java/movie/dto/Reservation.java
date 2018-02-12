package movie.dto;

public class Reservation {
	int no;
	String userId;
	int timetableNo;
	int price;
	String seat;
	int progress;

	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reservation(int no, String userId, int timetableNo, int price, String seat) {
		super();
		this.no = no;
		this.userId = userId;
		this.timetableNo = timetableNo;
		this.price = price;
		this.seat = seat;
	}

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

	public int getTimetableNo() {
		return timetableNo;
	}

	public void setTimetableNo(int timetableNo) {
		this.timetableNo = timetableNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}
	
	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	@Override
	public String toString() {
		return "Reservation [no=" + no + ", userId=" + userId + ", timetableNo=" + timetableNo + ", price=" + price
				+ ", seatRank=" + seat + "]";
	}

}
