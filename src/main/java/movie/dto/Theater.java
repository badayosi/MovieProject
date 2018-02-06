package movie.dto;

public class Theater {
	int theaterNo;
	String theaterName;
	int theaterFloor;
	int theaterMaxcount;
	String row;
	int col;
	String theaterType;

	public Theater() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getTheaterNo() {
		return theaterNo;
	}

	public void setTheaterNo(int theaterNo) {
		this.theaterNo = theaterNo;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
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

	public String getRow() {
		return row;
	}

	public void setRow(String row) {
		this.row = row;
	}

	public int getCol() {
		return col;
	}

	public void setCol(int col) {
		this.col = col;
	}

	public String getTheaterType() {
		return theaterType;
	}

	public void setTheaterType(String theaterType) {
		this.theaterType = theaterType;
	}

	public Theater(int theaterNo, String theaterName, int theaterFloor, int theaterMaxcount, String row, int col,
			String theaterType) {
		super();
		this.theaterNo = theaterNo;
		this.theaterName = theaterName;
		this.theaterFloor = theaterFloor;
		this.theaterMaxcount = theaterMaxcount;
		this.row = row;
		this.col = col;
		this.theaterType = theaterType;
	}
	
	

	public Theater(String theaterName, int theaterFloor, int theaterMaxcount, String row, int col,
			String theaterType) {
		super();
		this.theaterName = theaterName;
		this.theaterFloor = theaterFloor;
		this.theaterMaxcount = theaterMaxcount;
		this.row = row;
		this.col = col;
		this.theaterType = theaterType;
	}

	@Override
	public String toString() {
		return "Theater [theaterNo=" + theaterNo + ", theaterName=" + theaterName + ", theaterFloor=" + theaterFloor
				+ ", theaterMaxcount=" + theaterMaxcount + ", row=" + row + ", col=" + col + ", theaterType="
				+ theaterType + "]";
	}

	

}
