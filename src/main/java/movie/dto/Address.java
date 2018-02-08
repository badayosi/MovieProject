package movie.dto;

public class Address {
	String addrNo;
	String sido;
	String sigungu;
	String doro;
	int building1;
	int building2;

	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Address(String addrNo, String sido, String sigungu, String doro, int building1, int building2) {
		this.addrNo = addrNo;
		this.sido = sido;
		this.sigungu = sigungu;
		this.doro = doro;
		this.building1 = building1;
		this.building2 = building2;
	}

	public String getAddrNo() {
		return addrNo;
	}

	public void setAddrNo(String addrNo) {
		this.addrNo = addrNo;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getSigungu() {
		return sigungu;
	}

	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}

	public String getDoro() {
		return doro;
	}

	public void setDoro(String doro) {
		this.doro = doro;
	}

	public int getBuilding1() {
		return building1;
	}

	public void setBuilding1(int building1) {
		this.building1 = building1;
	}

	public int getBuilding2() {
		return building2;
	}

	public void setBuilding2(int building2) {
		this.building2 = building2;
	}

	@Override
	public String toString() {
		return sido + " " + sigungu + " " + doro
				+ " " + building1 +  building2;
	}

}
