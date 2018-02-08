package movie.dto;

public class User {
	private String userId;
	private String password;
	private int point;
	private String email;
	private String phone;
	private String addr;
	private String gender;
	private String userRank;
	private String name;
	public String getName() {
		return name;
	}

	public User(String userId, String password) {
		this.userId = userId;
		this.password = password;
	}

	public void setName(String name) {
		this.name = name;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String userId, String password, int point, String email, String phone, String addr, String gender,
			String userRank, String name) {
		super();
		this.userId = userId;
		this.password = password;
		this.point = point;
		this.email = email;
		this.phone = phone;
		this.addr = addr;
		this.gender = gender;
		this.userRank = userRank;
		this.name = name;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUserRank() {
		return userRank;
	}

	public void setUserRank(String userRank) {
		this.userRank = userRank;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", point=" + point + ", email=" + email
				+ ", phone=" + phone + ", addr=" + addr + ", gender=" + gender + ", userRank=" + userRank + ", name="
				+ name + "]";
	}

	

}
