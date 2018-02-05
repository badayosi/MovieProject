package movie.dto;

public class UserRank {
	String name;
	int discount;

	public UserRank() {
		// TODO Auto-generated constructor stub
	}

	public UserRank(String name, int discount) {
		super();
		this.name = name;
		this.discount = discount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "UserRank [name=" + name + ", discount=" + discount + "]";
	}


}
