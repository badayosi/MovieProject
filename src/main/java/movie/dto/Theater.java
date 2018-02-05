package movie.dto;

public class Theater {
	int theaterNo;
	String theatherName;
	int theaterFloor;
	int theaterMaxcount;
	int seatA;
	int seatB;
	int seatC;
	String theaterType;

	public Theater() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Theater(int theater_no, String theatherName, int theaterFloor, int theaterMaxcount, int seatA, int seatB,
			int seatC, String theaterType) {
		super();
		this.theaterNo = theater_no;
		this.theatherName = theatherName;
		this.theaterFloor = theaterFloor;
		this.theaterMaxcount = theaterMaxcount;
		this.seatA = seatA;
		this.seatB = seatB;
		this.seatC = seatC;
		this.theaterType = theaterType;
	}

	public int getTheater_no() {
		return theaterNo;
	}

	public void setTheater_no(int theater_no) {
		this.theaterNo = theater_no;
	}

	public String getTheatherName() {
		return theatherName;
	}

	public void setTheatherName(String theatherName) {
		this.theatherName = theatherName;
	}

	public int getTheaterFloor() {
		return theaterFloor;
	}

	public void setTheaterFloor(int theaterFloor) {
		this.theaterFloor = theaterFloor;
	}

	public int getTheaterMaxcount() {
		return theaterMaxcount;
	}

	public void setTheaterMaxcount(int theaterMaxcount) {
		this.theaterMaxcount = theaterMaxcount;
	}

	public int getSeatA() {
		return seatA;
	}

	public void setSeatA(int seatA) {
		this.seatA = seatA;
	}

	public int getSeatB() {
		return seatB;
	}

	public void setSeatB(int seatB) {
		this.seatB = seatB;
	}

	public int getSeatC() {
		return seatC;
	}

	public void setSeatC(int seatC) {
		this.seatC = seatC;
	}

	public String getTheaterType() {
		return theaterType;
	}

	public void setTheaterType(String theaterType) {
		this.theaterType = theaterType;
	}

	@Override
	public String toString() {
		return "Theater [theater_no=" + theaterNo + ", theatherName=" + theatherName + ", theaterFloor=" + theaterFloor
				+ ", theaterMaxcount=" + theaterMaxcount + ", seatA=" + seatA + ", seatB=" + seatB + ", seatC=" + seatC
				+ ", theaterType=" + theaterType + "]";
	}

}
