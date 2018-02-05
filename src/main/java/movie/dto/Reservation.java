package movie.dto;

public class Reservation {
	int no;
	String userId;
	int timetableNo;
	int price;
	String seatRank;

	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reservation(int no, String userId, int timetableNo, int price, String seatRank) {
		super();
		this.no = no;
		this.userId = userId;
		this.timetableNo = timetableNo;
		this.price = price;
		this.seatRank = seatRank;
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

	public String getSeatRank() {
		return seatRank;
	}

	public void setSeatRank(String seatRank) {
		this.seatRank = seatRank;
	}

	@Override
	public String toString() {
		return "Reservation [no=" + no + ", userId=" + userId + ", timetableNo=" + timetableNo + ", price=" + price
				+ ", seatRank=" + seatRank + "]";
	}

}
